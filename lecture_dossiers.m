function [  ] = lecture_dossiers( nom_doss, dirlist, nom_doss_3, doss_select)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%disp ('her e i am ');
%j = 1 ; f
%ind = 1;
%disp (doss_select);

for i = 1 : length(dirlist)
    if ~strcmp(dirlist(i).name, '.') && ~strcmp(dirlist(i).name, '..')
%        disp(' name = ');
       % disp(dirlist(i).name);
        if strcmp (dirlist(i).name, 'Frames.txt')
                %disp (nom_doss);
                nom_fichier = strcat(nom_doss, '/', 'Frames.txt');
                tab_result = recup_indic_dbt_fin(nom_fichier);
        elseif (strfind(dirlist(i).name, 'PNG')) > 1 % i.e c'est une image (strfind(dirlist(i).name, 'GT') == 1) || 

       %     disp ('image ');
         %     disp (' nom_doss = ');
           %   disp (doss_select);
              nom_image = dirlist(i).name;
              chemin_image = strcat(nom_doss, '/', nom_image);
              
%               disp ('chemin_image = ');
           %    disp (chemin_image);
              Filtrage (nom_doss, chemin_image, nom_image, doss_select);            
            
   %        len = tab_result(2) - tab_result(1) + 1;
      %     tableau_frames = cell (1, len);
                      
           %   disp ('*********************************************************');
             % disp (dirlist(i).name);
%              motif = '(GT-\d+.PNG)';
%              nom_frame = extraction_num_frame( dirlist(i).name, motif ); 
%              disp (nom_frame);
%              tableau_frames(ind) = nom_frame; %str2num(num_frame);
%               ind = ind + 1;
            %  disp (tableau_frames(ind));
         %  end
        end

        if (dirlist(i).isdir == 1) % is a folder not a file 1 : folder; 0 : file

           % disp ('doss ');
            nom_doss_2 = strcat(nom_doss, '/', dirlist(i).name);
            nom_doss_3 = strcat(nom_doss_3, '_', dirlist(i).name);
                        
            dirlist2 = dir(nom_doss_2);

            lecture_dossiers( nom_doss_2, dirlist2, nom_doss_3, doss_select );
        end
    end
end



end

