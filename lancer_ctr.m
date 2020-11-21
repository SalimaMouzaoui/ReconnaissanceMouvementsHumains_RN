clc
nom_doss = 'Mouvements_Leger_All';

listdir = dir(nom_doss);

for k = 1 : length(listdir)
 nom_dossier = listdir(k).name; 
 if ~strcmp(nom_dossier, '.') && ~strcmp(nom_dossier, '..') && (isempty(strfind(nom_dossier, '_Squeletisation')) == 1)
     
     nom_doss_1 = strcat(nom_doss, '\', nom_dossier);
     listdir2 = dir(nom_doss_1);
     for j = 1 : length(listdir2)
        
         if ~strcmp(listdir2(j).name, '.') && ~strcmp(listdir2(j).name, '..')
             nom_doss_entr = strcat(nom_doss_1, '\', listdir2(j).name);
        %     disp (nom_doss_1);
             Trace_contour( listdir2(j).name,  nom_doss_1)
         end
     end
 end
end
 


