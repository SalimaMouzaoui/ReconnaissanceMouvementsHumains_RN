function [ eval, our_target, target ] = Evaluation_systeme( save_netwok, nom_file_entree, nom_file_sortie, nom_dossier, nom_doss1, nom_doss2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


clc;

%save_netwok = RN ;
 net = load(strcat(save_netwok, '.mat'));

% nom_file_entree = 'Input_Squeletisation_Mouvements_Avec_Deplacement_Test.txt'; %'Input_silhouette_wave2_Test.txt';%'Input_silhouette_jump_Test.txt';

 input_test = importdata(nom_file_entree);
% 
% %[silh] = pre_traitement(silh, minimum, maximum);
% 
input_test = input_test';
nb_postures = 6;

%nom_file_sortie = 'Output_Squeletisation_Mouvements_Avec_Deplacement_Test.txt';
target_reel = recup_content_file( nom_file_sortie );
input_all = recup_content_file( nom_file_entree );

%disp (length(input_all));

%nom_dossier = 'Mouvements_Avec_Deplacement_Mvts_Test';

%nom_doss1 = 'Mouvements_Avec_Deplacement_Train';
ch = 'matrix_train';
filename = strcat(nom_doss1, '.mat');
S = load (filename, ch);
matrix = S.matrix_train;

%nom_doss2 = 'Mouvements_Avec_Deplacement_Test';
ch = 'matrix_test';
filename = strcat(nom_doss2, '.mat');
S = load (filename, ch);
matrix_test = S.matrix_test

%disp (nom_dossier);
ch = 'array_mvt';
filename = strcat(nom_dossier, '.mat') %'Mouvements_Avec_Deplacement_Train.mat';
S = load (filename, ch);
array_mvt = S.array_mvt;

taille = 55;
l = 1;
indice1 = 1;

array_distance = zeros (1, length(array_mvt));

%disp (length(array_mvt));
array_distance = zeros (1, length(array_mvt));
for i = 1 : (length(target_reel)/nb_postures)
  %  disp (i);
    target = zeros (1, nb_postures);
    input = zeros (nb_postures, taille);
    %disp (array_mvt(l));
    save_matrix = recup_possible_codage( matrix, array_mvt(l), nb_postures);
    save_matrix_test = recup_possible_codage( matrix_test, array_mvt(l), nb_postures);
    
    k = 1;
    j = 1;
    while j < nb_postures 
        target(k) = target_reel(i);
        k = k + 1;
        j = j + 1;
    end
    %disp (nb_postures*taille);
    k = 1;
    
 %   disp (indice1);
 %   disp ((indice1 + nb_postures*taille - 1));
    
    ind2 = indice1;
    while ind2 < (indice1 + nb_postures*taille - 1) 
        for indice = 1 : taille
            input(k, indice) = input_all(ind2);
            ind2 = ind2 + 1;
        end
        k = k + 1;
    end
    indice1 = ind2;
%    disp (indice1);
    
   % disp ('input');
   % disp (input);
    input = input';
    outputSimulation = sim(net.net, input);
 %   disp (outputSimulation);
  %  disp (round(outputSimulation));
    our_target = round(outputSimulation);
    
    ch = 'codage';
    filename = strcat(save_matrix, '.mat');
    S = load (filename, ch);
    matrix_codage = S.codage;

    filename = strcat(save_matrix_test, '.mat');
    S = load (filename, ch);
    matrix_codage_test = S.codage;
    
    [nb_ligne, nb_postures] = size(matrix_codage);
    ind1 = 1;
    array_long = zeros (1, nb_ligne*nb_postures);
    for ind2 = 1 : nb_ligne
        for ind3 = 1 : nb_postures
            array_long(ind1) = matrix_codage(ind2, ind3);
            ind1 = ind1 + 1;
        end
    end
    
    [nb_ligne, nb_postures] = size(matrix_codage_test);
    ind1 = 1;
    array_long_test = zeros (1, nb_ligne*nb_postures);
    for ind2 = 1 : nb_ligne
        for ind3 = 1 : nb_postures
            array_long_test(ind1) = matrix_codage_test(ind2, ind3);
            ind1 = ind1 + 1;
        end
    end
        
    distance = 0;
    for ind1 = 1 : length(our_target)
        exist = check_element( array_long, our_target(ind1) );
        if exist == 1
            distance = distance + 1;
        else        
        exist  = check_element( array_long_test, our_target(ind1) );
        if exist == 1
            distance = distance + 1;
        end
        end
    end
    if distance >= 2
   %     disp (' =  1');
        array_distance(l) = 1;
    else
        array_distance(l) = 0;
    end
    l = l + 1;
        
end

nb = 0;
for i = 1 : length(array_distance)
    if (array_distance(i) == 1)
        nb = nb + 1;
    end
end
% 
 disp ('nb = ');
 disp (nb);
 disp ('length(array_distance) ');
 disp (length(array_distance));

eval = (nb / length(array_distance)) * 100
% 
% outputSimulation = round(outputSimulation);
% nom_file = 'Output_silhouette_wave2_Test.txt';
% target_reel = recup_content_file( nom_file );
% mvt = 'wave2';
% 
% distance = calcul_intersect(outputSimulation, target_reel)
% %distance = length(intersection)
% 
% if distance >= 3
%     disp ('mouvement = ');
%     disp (mvt);
% else
%     disp ('inconnu');
% end
% 
% 

end

