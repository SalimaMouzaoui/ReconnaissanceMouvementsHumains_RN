% 
% 
% ch = 'matrix';
% filename = 'Mouvements_Avec_Deplacement_Train.mat';
% S = load (filename, ch);
% matrix = S.matrix;
% 
% % Train
% lancer_Squeletisation( matrix );
% 
% ch = 'matrix_test';
% filename = 'Mouvements_Avec_Deplacement_Test.mat';
% S = load (filename, ch);
% matrix = S.matrix_test;
% 
% % Test
% lancer_Squeletisation( matrix );

clc
nom_doss = 'Mouvements_Leger_Test'; % MuHaVi_Camera3_Test_1 %'Mouvements_Avec_Deplacements_All';

listdir = dir(nom_doss);

for k = 1 : length(listdir)
 nom_dossier = listdir(k).name; 
 if ~strcmp(nom_dossier, '.') && ~strcmp(nom_dossier, '..') && (isempty(strfind(nom_dossier, '_Contour')) == 1)
     
     nom_doss_1 = strcat(nom_doss, '\', nom_dossier);
     listdir2 = dir(nom_doss_1);
     for j = 1 : length(listdir2)
        
         if ~strcmp(listdir2(j).name, '.') && ~strcmp(listdir2(j).name, '..')
             nom_doss_entr = strcat(nom_doss_1, '\', listdir2(j).name);
             squeletisation( nom_doss_1, listdir2(j).name )
         end
     end
 end
end
 




