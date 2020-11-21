
clc

%nom_mvt = 'Mouvements_Leger';
nom_mvt = 'MuHaVi_Camera4';
nom_doss = strcat(nom_mvt, '_Test');
%nom_doss = 'Mouvements_Leger_Test';
nb_postures = 6;

nom_dossier = 'MuHaVi_Camera4_All';
%nom_dossier = 'Mouvements_Leger_All';
ch = 'matrix';
filename = strcat(nom_dossier, '.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
S = load (filename, ch);
matrix_all = S.matrix;

%disp (matrix_all);
separation_data_app_test( matrix_all, nom_doss, nb_postures, nom_mvt )
