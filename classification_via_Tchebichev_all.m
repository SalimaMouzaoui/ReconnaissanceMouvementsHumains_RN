% effacer la console
  clc;

% Traitement apres Sélection

nb_frames_selected = 6;
nom_dossier = 'Mouvements_Avec_Deplacement'; %'Mouvement_Avec_Deplacement';%'Results_Camera3';
listdir_Res = dir (nom_dossier);

len = 0;
for k = 1 : length(listdir_Res)
    nom_doosier = listdir_Res(k).name;
    if ~strcmp(nom_doosier, '.') && ~strcmp(nom_doosier, '..')
        
        if (isempty(strfind(nom_doosier, '_Squeletisation')) == 1)
            len = len + 1;
        end
    end
end

%disp (len);
longueur = nb_frames_selected * len;

matrix = cell(longueur, 4); % 3 cases : la 1ere : le num de l'image, 
% 2eme : le nom du dossier, 3eme : la classe de la posture

ind = 1;
for k = 1 : length(listdir_Res)
nom_doosier = listdir_Res(k).name;

if ~strcmp(nom_doosier, '.') && ~strcmp(nom_doosier, '..') && (isempty(strfind(nom_doosier, '_Squeletisation')) == 1)
     nom_mvt = recup_nom_mvt(nom_doosier);
          
     nom_doosier = strcat(nom_dossier, '\', nom_doosier);
    % disp (nom_doosier);
     array_frames = tableau_des_frames( nom_doosier );
     array_frames = sort(array_frames);
   %  disp (length(array_frames));
     for j = 1 : length(array_frames)
         matrix{ind, 1} = array_frames(j);         
         matrix{ind, 2} = nom_doosier;
         matrix{ind, 3} = nom_mvt;
         ind = ind + 1;
     end
end
end

disp (matrix);
% % Squelettisation
% for i = 1 : longueur
%     squeletisation( matrix{i, 2}, matrix{i, 1} )
% end
% % 
% % 


indice = 1;

mvt_crt = matrix{1, 3};
array_class = zeros (1, nb_frames_selected);
array_image = zeros (1, nb_frames_selected);
array_doss_class = cell (1, nb_frames_selected);
ind = 1;
i = 1;
sauv = 1;

while i <= longueur
%for i = 1 : longueur
%     
    seuil_predef = 1.7;
    %disp ('i = ');
    %disp (i);
%     if i > nb_frames_selected 
%        % disp (' i am here ');
%        
%         if (~strcmp(mvt_crt, matrix{i, 3}))
%             
%             mvt_crt = matrix{i, 3};
%            
%             [array_class, array_doss_class, i, matrix, sauv, array_image, indice] = choix_class_via_tchebichev(matrix, i, array_image,...
%                 array_doss_class, nb_frames_selected, seuil_predef, indice);          
%         
%         end
%         
%     else
    if i == 1
        matrix{i, 4} = indice;
        array_class(ind) = indice;
        array_image(ind) = matrix{i, 1};
        array_doss_class{ind} = matrix{i, 2};
        indice = indice + 1;
        ind = ind + 1;
        i = i + 1;
        %disp (array_image);
    elseif i == 2
        seuil = Select_Frame_classification_via_tchebichev( matrix{i, 2}, matrix{i-1, 2}, matrix{i, 1}, matrix{i-1, 1} );
%        disp (matrix{i, 2});
%         disp (matrix{i, 1});
%          disp (matrix{i-1, 2});
%         disp (matrix{i-1, 1});
    %    disp (seuil);
        if seuil < seuil_predef            
            matrix{i, 4} = matrix{i-1, 4};
            array_class(ind) = matrix{i, 4};
            array_image(ind) = matrix{i, 1};
            array_doss_class{ind} = matrix{i, 2};
            ind = ind + 1;
            i = i + 1;
        %disp (array_image);
        else
            matrix{i, 4} = indice;
            array_class(ind) = indice; 
            array_image(ind) = matrix{i, 1};           
            array_doss_class{ind} = matrix{i, 2};
            indice = indice + 1;  
            ind = ind + 1;  
            i = i + 1; 
        %disp (array_image);
            
        end
        
    else
%         disp ('i = ');
%         disp (i);
        k = i;
        array_preced_img = zeros (1, k);
        array_preced_indic = zeros (1, k);
        array_preced_doss = cell (1, k);
        l = 1;
        while k >= 1
            array_preced_img(l) = matrix{k, 1};
            array_preced_indic(l) = k;
            array_preced_doss{l} = matrix{k, 2};
            l = l + 1;
            k = k - 1;
        end
        
%         disp ('k = ');
%         disp (k);
%         disp ('l = ');
%         disp (l);
       % disp (array_preced_img);
        k = 1;
        elet_crt = array_preced_img(1);
        %disp (elet_crt);
        array_seuil = zeros (1, length(array_preced_img)-1);
        
        for l = 2 : length(array_preced_img)
           
            nom_doss1 = array_preced_doss{1};
          %  disp (nom_doss1);
            nom_doss2 = array_preced_doss{l};
            
       %     disp ('img1 = ');
        %     disp (elet_crt);
         %    disp ('img2 = ');
          %   disp (array_preced_img(l));
             
             seuil = Select_Frame_classification_via_tchebichev( nom_doss1, nom_doss2, elet_crt, array_preced_img(l) );
           %  disp ('seuil = ');
            % disp (seuil);
            
            array_seuil(k) = seuil;
            k = k + 1;
        end
        
       % disp (array_seuil);
        [seuil_min, indic_min] = calcul_min_nrml ( array_seuil );
        
         %disp ('seuil_min = ');
         %disp (seuil_min);
        
         %disp ('indic_min = ');
        % disp (indic_min);
         
         new_indic = indic_min; %length(array_seuil) - indic_min + 1;
        if seuil_min < seuil_predef            
          %  disp ('seuil < seuil');
            matrix{i, 4} = matrix{new_indic, 4};            
            array_class(ind) = matrix{new_indic, 4};
            array_image(ind) = matrix{i, 1};
            array_doss_class{ind} = matrix{i, 2};
            ind = ind + 1;   
            i = i + 1;
        %disp (array_image);
%         elseif seuil_min == 0
%             disp ('here == 0');
%             matrix{i, 4} = indice;
       %     indice = indice + 1;
        else
%             disp ('indic = ');
%             disp (indice);
            matrix{i, 4} = indice;   
            array_class(ind) = indice;
            array_image(ind) = matrix{i, 1};
            array_doss_class{ind} = matrix{i, 2};
            indice = indice + 1;        
            ind = ind + 1;
            i = i + 1;    
       % disp (array_image);
            
        end
        %disp ('matrix{i, 4} = '); 
        %disp (matrix{i, 4});
    end
  %  end
    
end

% 
 disp (matrix);
 
matrix_to_save = 'Mouvements_Avec_Deplacement_Train_all';
save(matrix_to_save, 'matrix'); %, '.mat');

% ch = 'matrix';
% filename = 'Mouvements_Avec_Deplacement_Train.mat';
% S = load (filename, ch);
%S.matrix
%lancer_techebychev( S.matrix );

