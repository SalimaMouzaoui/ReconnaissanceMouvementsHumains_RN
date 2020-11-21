clc;

nom_doss = 'Mouvements_Avec_Deplacement1'; %'Mouvements_Avec_Deplacement';
ch = 'matrix';
filename = strcat(nom_doss, '.mat');
S = load (filename, ch);
matrix2 = S.matrix;
nom_doss_test = 'Mouvements_Avec_Deplacement_Test';
Classification_data_test( matrix2, nom_doss_test );