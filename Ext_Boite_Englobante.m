function [ list_dossier ] = Ext_Boite_Englobante(nom_doss)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

dirlist = dir (nom_doss);%('.');
indice = 1;

for i = 1 : length(dirlist)
    if ~strcmp(dirlist(i).name, '.') && ~strcmp(dirlist(i).name, '..')
        if (dirlist(i).isdir == 1)
            if ~strcmp(dirlist(i).name, nom_doss) 
                %disp ('avant');
                if(isempty(strfind(dirlist(i).name, '_Boite_Englobante')) == 1)
                 
                     disp (dirlist(i).name);
                     list_dossier{indice} = dirlist(i).name;
                     indice = indice + 1;
                    nom_doss_new = strcat(nom_doss, '\', dirlist(i).name, '_Boite_Englobante');
                   % j = 1;
                   dirlist(i).name = strcat(nom_doss, '\', dirlist(i).name);
                    dirlist2 = dir(dirlist(i).name);
                %    disp (length(dirlist2));
                    
                    for k = 1 : length(dirlist2)
                         %  disp (dirlist2(k).name);
                        if ~strcmp(dirlist2(k).name, '.') && ~strcmp(dirlist2(k).name, '..') 
                            motif = '(\d)+.PNG';
%                             disp ( dirlist2(k).name);
                            num_frame = extraction_num_frame( dirlist2(k).name, motif );
                        %    disp (str2num(num_frame));
                            chemin_image = strcat (dirlist(i).name, '/', dirlist2(k).name);
                            boite_englobante(nom_doss_new, chemin_image, str2num(num_frame));
                            %    disp (dirlist2(k).name);
                         %   j = j + 1;
                        end
                    end
                end
              
            end
        end       
    end
end

end

