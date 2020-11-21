
clc
nom_doss = 'MuHaVi_Camera3';
nom_doc_silh_entr = 'Input_contour_MuHaVi_Camera3_Train.txt';
nom_doc_silh_sort = 'Output_contour_MuHaVi_Camera3_Train.txt';
type_mvt = 'MuHaVi_Camera3';
type_input = 'Contour';

save_network = Rn_All (nom_doc_silh_entr, nom_doc_silh_sort, type_mvt, type_input )

nom_dossier = strcat(nom_doss, '_Mvts_Test')
nom_doss1 = strcat(nom_doss, '_Train')
nom_doss2 = strcat(nom_doss, '_Test')


input_test = 'Input_contour_MuHaVi_Camera3_Test.txt';
output_test = 'Output_contour_MuHaVi_Camera3_Test.txt';
eval = Evaluation_systeme( save_network, input_test, output_test, nom_dossier, nom_doss1, nom_doss2 )