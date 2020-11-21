function [ array_class, array_doss_class, k, matrix, sauv ] = choix_class( matrix, i, array_image, array_doss_class, nb_frames_selected, seuil_predef, indice )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% disp ('here');
% disp (array_image);
% array_class_new = zeros(1, nb_frames_selected);
% array_doss_class_new = cell(1, nb_frames_selected);
sauv = length(array_doss_class) + 1;

i_new = length(array_doss_class) + 1;
%i_new = 1; 
k = i;
while k < (i + nb_frames_selected) 
    %disp (k);
    elet_crt = matrix{k, 1};
%    disp (elet_crt);
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
        seuil = Select_Frame_classification( nom_doss1, nom_doss2, elet_crt, array_image(j), seuil_predef );
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
       %  disp (array_class(i_new));
         array_doss_class{i_new} = matrix{k, 2};
         i_new = i_new + 1;
         k = k + 1;
    else
        matrix{k, 4} = indice;
%         disp ('else');
%         disp (matrix{k, 4}); 
        array_class(i_new) = indice;
        %disp (array_class(i_new));
        array_doss_class{i_new} = matrix{k, 2};
        indice = indice + 1;  
        i_new = i_new + 1;
        k = k + 1;
    end
end

% disp ('i_new= ');
% disp (i_new);
% disp (array_class);
% disp (matrix);

end

