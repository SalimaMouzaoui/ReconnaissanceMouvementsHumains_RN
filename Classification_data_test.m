function [matrix_to_save ] = Classification_data_test( matrix2, nom_dossier )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% effacer la console
  clc;

% Traitement apres Sélection

nb_frames_selected = 6;
%nom_dossier = 'Mouvements_Leger_Test';%'Mouvements_Avec_Deplacement'; %'Mouvement_Avec_Deplacement';%'Results_Camera3';
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
     %disp (nom_doosier);
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
array_class = zeros (1, nb_frames_selected);
array_image = zeros (1, nb_frames_selected);
array_doss_class = cell (1, nb_frames_selected);
ind = 1;
i = 1;
found = 0;
length_train = length(matrix2);
ind_train = 1;

seuil_predef = 1.4;
    
while i <= longueur
%for i = 1 : longueur
%     
 if mod (i, 10) == 0
        disp ('i = ');
        disp (i);
 end
 
while ind_train < length_train
%    disp (matrix{i, 1});
 %  disp (matrix2{ind_train, 1});
    seuil = Select_Frame_classification_via_tchebichev( matrix{i, 2}, matrix2{ind_train, 2}, matrix{i, 1}, matrix2{ind_train, 1} );
 %   disp (seuil);
    if seuil < seuil_predef           
  %      disp (' inf ');
        matrix{i, 4} =  matrix2{ind_train, 4};
        ind_train = ind_train + 1;
        i = i + 1;
        break;
    else
        ind_train = ind_train + 1;
     %   disp ('else');
        k = ind_train ;
        array_preced_img = zeros (1, k);
        array_preced_indic = zeros (1, k);
        array_preced_doss = cell (1, k);
        l = 1;
        while k >= 1
            array_preced_img(l) = matrix2{k, 1};
            array_preced_indic(l) = k;
            array_preced_doss{l} = matrix2{k, 2};
            l = l + 1;        
            k = k - 1;
        end
    end
    k = 1;
        elet_crt = matrix{i, 1};
        %disp (elet_crt);
        array_seuil = zeros (1, length(array_preced_img)-1);
        
        for l = 1 : length(array_preced_img)
           
            nom_doss1 = matrix{i, 2};
      %      disp (nom_doss1);
            nom_doss2 = array_preced_doss{l};
    %        disp (nom_doss2);
    %        disp ('img1 = ');
      %       disp (elet_crt);
      %       disp ('img2 = ');
      %      disp (array_preced_img(l));         
          %   
             seuil = Select_Frame_classification_via_tchebichev( nom_doss1, nom_doss2, elet_crt, array_preced_img(l) );
             
    %         disp ('seuil = ');
    %         disp (seuil);
    %        
            if seuil > seuil_predef
      %          disp ('super');
                array_seuil(k) = seuil;
                k = k + 1;                             
            else
     %           disp ('else super ');
                array_seuil(k) = seuil;
                k = k + 1;
          %      disp (length(array_seuil));
          %      disp ('llllllll ');
           %     disp (array_preced_indic(l));
                
                new_indic = array_preced_indic(l); % - length(array_seuil) + 1;
                found = 1;
            %    disp ('found');
           %     break;
            end
         if found == 1
             break;
         end
        end
            
         if found == 1 %seuil < seuil_predef            
%             disp ('new_indic');
%             disp (new_indic);
        %    disp (matrix);
     %   disp ('foubnd');
            matrix{i, 4} = matrix2{new_indic, 4};   
         %   disp (matrix{new_indic, 4});  
            array_class(ind) = matrix2{new_indic, 4};
            array_image(ind) = matrix2{i, 1};
            array_doss_class{ind} = matrix2{i, 2};
            ind = ind + 1;   
            i = i + 1;
            found = 0;
            break;
        %disp (array_image);
%         elseif seuil_min == 0
%             disp ('here == 0');
%             matrix{i, 4} = indice;
       %     indice = indice + 1;
%         else
% %             disp ('indic = ');
% %             disp (indice);
% %disp ('else ');
%             matrix{i, 4} = indice;   
%             array_class(ind) = indice;
%             array_image(ind) = matrix{i, 1};
%             array_doss_class{ind} = matrix{i, 2};
%             indice = indice + 1;        
%             ind = ind + 1;
%             i = i + 1;    
         end
   
end
% 
%     if i == 1
%         matrix{i, 4} = indice;
%         array_class(ind) = indice;
%         array_image(ind) = matrix{i, 1};
%         array_doss_class{ind} = matrix{i, 2};
%         indice = indice + 1;
%         ind = ind + 1;
%         i = i + 1;
%         %disp (array_image);
%     elseif i == 2
%         seuil = Select_Frame_classification_via_tchebichev( matrix{i, 2}, matrix{i-1, 2}, matrix{i, 1}, matrix{i-1, 1} );
% %        disp (matrix{i, 2});-
% %         disp (matrix{i, 1});
% %          disp (matrix{i-1, 2});
% %         disp (matrix{i-1, 1});
%     %    disp (seuil);
%         if seuil < seuil_predef            
%             matrix{i, 4} = matrix{i-1, 4};
%             array_class(ind) = matrix{i, 4};
%             array_image(ind) = matrix{i, 1};
%             array_doss_class{ind} = matrix{i, 2};
%             ind = ind + 1;
%             i = i + 1;
%         %disp (array_image);
%         else
%             matrix{i, 4} = indice;
%             array_class(ind) = indice; 
%             array_image(ind) = matrix{i, 1};           
%             array_doss_class{ind} = matrix{i, 2};
%             indice = indice + 1;  
%             ind = ind + 1;  
%             i = i + 1; 
%         %disp (array_image);
%             
%         end
%         
%     else
% %         disp ('i = ');
% %         disp (i);
%         k = i;
%         array_preced_img = zeros (1, k);
%         array_preced_indic = zeros (1, k);
%         array_preced_doss = cell (1, k);
%         l = 1;
%         while k >= 1
%             array_preced_img(l) = matrix{k, 1};
%             array_preced_indic(l) = k;
%             array_preced_doss{l} = matrix{k, 2};
%             l = l + 1;
%             k = k - 1;
%         end
% %         disp ('k = ');
% %         disp (k);
% %         disp ('l = ');
% %         disp (l);
%        % disp (array_preced_img);
%         k = 1;
%         elet_crt = array_preced_img(1);
%         %disp (elet_crt);
%         array_seuil = zeros (1, length(array_preced_img)-1);
%         
%         for l = 2 : length(array_preced_img)
%            
%             nom_doss1 = array_preced_doss{1};
%      %       disp (nom_doss1);
%             nom_doss2 = array_preced_doss{l};
%    %          disp (nom_doss2);
%        %     disp ('img1 = ');
%         %     disp (elet_crt);
%          %    disp ('img2 = ');
%         %    disp (array_preced_img(l));         
%           %   
%              seuil = Select_Frame_classification_via_tchebichev( nom_doss1, nom_doss2, elet_crt, array_preced_img(l) );
%              
%           %   disp ('seuil = ');
%          %    disp (seuil);
%     %        
%             if seuil > seuil_predef
%   %              disp ('supper');
%                 array_seuil(k) = seuil;
%                 k = k + 1;                             
%             else
%                 array_seuil(k) = seuil;
%                 k = k + 1;
%           %      disp (length(array_seuil));
%           %      disp ('llllllll ');
%            %     disp (array_preced_indic(l));
%                 
%                 new_indic = array_preced_indic(l); % - length(array_seuil) + 1;
%                 found = 1;
%             %    disp ('found');
%            %     break;
%             end
% %          if found == 1
% %              break;
% %          end
%         end
%             
%          if found == 1 %seuil < seuil_predef            
% %             disp ('new_indic');
% %             disp (new_indic);
%         %    disp (matrix);
%             matrix{i, 4} = matrix{new_indic, 4};   
%          %   disp (matrix{new_indic, 4});  
%             array_class(ind) = matrix{new_indic, 4};
%             array_image(ind) = matrix{i, 1};
%             array_doss_class{ind} = matrix{i, 2};
%             ind = ind + 1;   
%             i = i + 1;
%             found = 0;
%         %disp (array_image);
% %         elseif seuil_min == 0
% %             disp ('here == 0');
% %             matrix{i, 4} = indice;
%        %     indice = indice + 1;
%         else
% %             disp ('indic = ');
% %             disp (indice);
% %disp ('else ');
%             matrix{i, 4} = indice;   
%             array_class(ind) = indice;
%             array_image(ind) = matrix{i, 1};
%             array_doss_class{ind} = matrix{i, 2};
%             indice = indice + 1;        
%             ind = ind + 1;
%             i = i + 1;    
%          end
%         
%         
%      %   disp (array_seuil);
%        % [seuil_min, indic_min] = min ( array_seuil );
%         
%          %disp ('seuil_min = ');
%          %disp (seuil_min);
%         
% %          disp ('indic_min = ');
% %          disp (indic_min);
%          
%   %       new_indic = length(array_seuil) - indic_min + 1;
% %         if seuil_min < seuil_predef            
% %      %       disp ('seuil < seuil');
% %             matrix{i, 4} = matrix{new_indic, 4};            
% %             array_class(ind) = matrix{new_indic, 4};
% %             array_image(ind) = matrix{i, 1};
% %             array_doss_class{ind} = matrix{i, 2};
% %             ind = ind + 1;   
% %             i = i + 1;
% %         %disp (array_image);
% % %         elseif seuil_min == 0
% % %             disp ('here == 0');
% % %             matrix{i, 4} = indice;
% %        %     indice = indice + 1;
% %         else
% % %             disp ('indic = ');
% % %             disp (indice);
% %             matrix{i, 4} = indice;   
% %             array_class(ind) = indice;
% %             array_image(ind) = matrix{i, 1};
% %             array_doss_class{ind} = matrix{i, 2};
% %             indice = indice + 1;        
% %             ind = ind + 1;
% %             i = i + 1;    
% %        % disp (array_image);
% %             
% %         end
%         %disp ('matrix{i, 4} = '); 
%         %disp (matrix{i, 4});
%     end
  %  end
    
end

% 
 disp (matrix);
 
matrix_to_save = nom_dossier;%'Mouvements_Leger_Train_all';
save(matrix_to_save, 'matrix'); %, '.mat');

ch = 'matrix';
S = load (matrix_to_save, ch);
S.matrix;

end

