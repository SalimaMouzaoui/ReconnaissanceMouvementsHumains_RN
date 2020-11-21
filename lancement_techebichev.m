
clc;
% 
% % Donnees de Train
nom_doss = 'MuHaVi_Camera4_Train';%'Mouvements_Leger_Test'; Mouvements_Avec_Deplacement_Train Mouvements_Avec_Deplacement_Test ;
ch = 'matrix_train';
%ch = 'matrix_test';
%filename = strcat(nom_doss, '.mat');
filename = strcat(nom_doss, '.mat');
S = load (filename, ch);
matrix = S.matrix_train;
%matrix = S.matrix_test;
% 
n = 9;
disp ('Silhouette Début ');
%lancer_techebychev_silhouette( matrix, nom_doss, n );
disp ('Silhouette fin ');
disp ('ctr Début ');
lancer_techebychev_contour( matrix, nom_doss, n );
disp ('ctr fin ');
disp ('sql Début ');
lancer_techebychev_squelette( matrix, nom_doss, n );
disp ('sql fin ');
% 
% disp ('**********************************');
% 
% % Donnees de test
% nom_doss = 'MuHaVi_Camera3_Test_1';%'Mouvements_Leger_Test'; Mouvements_Avec_Deplacement_Train Mouvements_Avec_Deplacement_Test ;
% ch = 'matrix_train';
% %ch = 'matrix_test';
% %filename = strcat(nom_doss, '.mat');
% filename = strcat(nom_doss, '.mat');
% S = load (filename, ch);
% matrix = S.matrix_train;
% %matrix = S.matrix_test;
% 
% n = 9;
% disp ('Silhouette Début ');
% lancer_techebychev_silhouette( matrix, nom_doss, n );
% disp ('Silhouette fin ');
% disp ('ctr Début ');
% lancer_techebychev_contour( matrix, nom_doss, n );
% disp ('ctr fin ');
% disp ('sql Début ');
% lancer_techebychev_squelette( matrix, nom_doss, n );
% disp ('sql fin ');

disp ('**********************************');

nom_doss = 'MuHaVi_Camera4_Test';%'Mouvements_Leger_Test'; Mouvements_Avec_Deplacement_Train Mouvements_Avec_Deplacement_Test ;
%ch = 'matrix_train';
ch = 'matrix_test';
%filename = strcat(nom_doss, '.mat');
filename = strcat(nom_doss, '.mat');
S = load (filename, ch);
%matrix = S.matrix_train;
matrix = S.matrix_test

n = 9;
disp ('Silhouette Début ');
lancer_techebychev_silhouette( matrix, nom_doss, n );
disp ('Silhouette fin ');
disp ('ctr Début ');
lancer_techebychev_contour( matrix, nom_doss, n );
disp ('ctr fin ');
disp ('sql Début ');
lancer_techebychev_squelette( matrix, nom_doss, n );
disp ('sql fin ');

disp ('"""""""""""""""""""""""""""""""""""""""');

% nom_doss = 'Mouvements_Leger_Test';%'Mouvements_Leger_Test'; Mouvements_Avec_Deplacement_Train Mouvements_Avec_Deplacement_Test ;
% %ch = 'matrix_train';
% ch = 'matrix_test';
% %filename = strcat(nom_doss, '.mat');
% filename = strcat(nom_doss, '.mat');
% S = load (filename, ch);
% %matrix = S.matrix_train;
% matrix = S.matrix_test;
% 
% n = 9;
% disp ('Silhouette Début ');
% lancer_techebychev_silhouette( matrix, nom_doss, n );
% disp ('Silhouette fin ');
% disp ('ctr Début ');
% lancer_techebychev_contour( matrix, nom_doss, n );
% disp ('ctr fin ');
% disp ('sql Début ');
% lancer_techebychev_squelette( matrix, nom_doss, n );
% disp ('sql fin ');


% % Donnees de Test Pour chaque fichier séparé
% ch = 'matrix';
% filename = 'Test.mat';
% S = load (filename, ch);
% matrix = S.matrix;

%lancer_techebichev_silhouette_Test( matrix )
%lancer_techebichev_contour_Test( matrix )
%lancer_techebichev_squelette_Test( matrix )