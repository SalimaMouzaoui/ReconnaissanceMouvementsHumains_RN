function [ array_class, array_doss_class, k, matrix, sauv, array_result, indice ] = choix_class_via_tchebichev_all( matrix, i, array_image, array_doss_class, ...
                                                              nb_frames_selected, seuil_predef, indice )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% disp ('here');
% disp (array_image);
% array_class_new = zeros(1, nb_frames_selected);
% array_doss_class_new = cell(1, nb_frames_selected);

%disp (matrix);
sauv = length(array_doss_class) + 1;

i_new = length(array_doss_class) + 1;
%array_new = zeros (1, nb_frames_selected);
%i_new = 1;
% disp (i);
% disp ((i + nb_frames_selected));
% disp (array_image);
k = i;
indi = 1;
oui = 0;
first = 1;
while k < (i + nb_frames_selected) 
    %disp (k);
    mvt_crt = matrix{k, 3};
    %disp ('mvt_crt ');
   % disp (mvt_crt);
    %disp ('avant');
  %  disp (k );
    if first == 1
    for m = 1 : (k-1)
     %   if (~isempty(matrix{k, 4}))
   %  disp ('zmmmmmar');
    % disp (matrix{m, 2});
            if (strcmp(mvt_crt, matrix{m, 3}) == 1)
      %          disp ('entrant');
                indice_crt = m;
                oui = 1;
                break;
            else
    %            disp ('non');
                oui = 0;
            end
     %   end
    end
    first = 0;
    end
    
    if oui == 1
%         disp ('oui = 1');
%         disp (array_image);
     %   disp (array_result);
    for l = indice_crt : (indice_crt + nb_frames_selected - 1)
         matrix{k, 4} = matrix{l, 4};       
      %  disp (matrix{k, 4});   
         array_class(i_new) = matrix{l, 4};
        % array_image(i_new) = matrix{l, 1};
       %  disp (array_class(i_new));
         array_doss_class{i_new} = matrix{l, 2};
         i_new = i_new + 1;
         k = k + 1; 
         array_new(indi) = matrix{l, 1};
         indi = indi + 1;
    end
    else
%         disp ('non');
%         
%         disp (array_image);
     %   disp (array_result);
        
        
    elet_crt = matrix{k, 1};
    array_new(indi) = elet_crt;
    indi = indi + 1;
%     disp ('courrrrrrrrrrrrrrrrrrrrrrrrtttttttttttttttttt');
%     disp (elet_crt);
    array_seuil = zeros (1, length(array_image)-1);
    l = 1;
    
    for j = 1 : length(array_image)
        nom_doss1 = matrix{k, 2};
    %    disp ('n1 = ');
 %         disp (nom_doss1);
       % disp (elet_crt);
        nom_doss2 = array_doss_class{j};
     %   disp ('n2 = ');
         % disp (nom_doss2);
        %  disp ('j = ');
       %   disp (j);
      %  disp (array_image(j));
        seuil = Select_Frame_classification_via_tchebichev( nom_doss1, nom_doss2, elet_crt, array_image(j) );
%           disp (nom_doss1);
%         disp (elet_crt);
%          disp (nom_doss2);
%         disp (array_image(j));
%         disp (seuil);
     %   disp (seuil);
        array_seuil(l) = seuil;
        l = l + 1;        
    end
    %disp (array_seuil);
    [seuil_min, indic_min] = calcul_min ( array_seuil );
    new_indic = indic_min;
   % new_indic = length(array_seuil) - indic_min + 1;
    if seuil_min < seuil_predef           
         matrix{k, 4} = matrix{new_indic, 4};       
      %  disp (matrix{k, 4});   
         array_class(i_new) = matrix{new_indic, 4};
      %   array_image(i_new) = array_image(j);
       %  disp (array_class(i_new));
         array_doss_class{i_new} = matrix{k, 2};
         i_new = i_new + 1;
         k = k + 1;
    else
        matrix{k, 4} = indice;
%         disp ('else');
%         disp (matrix{k, 4}); 
        array_class(i_new) = indice;
     %   array_image(i_new) = array_image(j);
        %disp (array_class(i_new));
        array_doss_class{i_new} = matrix{k, 2};
        indice = indice + 1;  
        i_new = i_new + 1;
        k = k + 1;
    end
    
    end
end


long = length(array_image) + length(array_new);
array_result = zeros (1, long);

for i = 1 : length(array_image)
    array_result(i) = array_image(i);
end

for i = 1 : length(array_new)
    array_result(i+length(array_image)) = array_new(i);
end

%disp (matrix);
%disp (array_result);
end

