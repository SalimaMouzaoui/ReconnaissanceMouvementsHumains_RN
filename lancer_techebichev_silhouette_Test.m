function [ nom_doc_input, nom_doc_output ] = lancer_techebichev_silhouette_Test( matrix, n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


 % fichier d'entrée Silhouette
taille = calcul_taille( n );

longueur = length(matrix);

Matrice_Moment_silhouette = zeros (longueur, taille);
% les moments de Tchebychev
for h = 1 : longueur

    nom_doss_entree = matrix{h, 2};
   % disp (nom_doss_entree);
    nom_image = strcat(nom_doss_entree, '\', num2str(matrix{h, 1}), '.PNG');
    J = imread(nom_image);
       
    [height, width, numberOfColorChannels] = size(J);
 
%     disp (width)
%     disp (height)
    Tpq = zeros(1, taille);
    
    m = 1;
    for i = 1 : (n+1)
        for j = 1 :(n+1)
            k = i - 1;
            l = j - 1;
            if k + l <= n
                Tpq(m) = chebychev_silhouette( J, width, height, k, l);
                Matrice_Moment_silhouette(h, m) = Tpq(m);
                m = m + 1;
            end
        end
    end
%     disp('Tpq = ')
%     disp(Tpq);
end

%disp (Matrice_Moment_silhouette);

% nom_doc = strcat('Input_silhouette_', matrix{1, 3}, '_.txt');
% Input_slh = fopen(nom_doc,'w');
% 
% % fichier de sortie Silhouette
% nom_doc = strcat('Output_silhouette_', matrix{1, 3}, '_.txt');
% Output_slh = fopen(nom_doc,'w');

ch1 = ' %s '; 
i = 1;
indice = 1;
while i <= longueur
    
    nom_doc_input = strcat('Input_silhouette_', matrix{i, 3}, '_Test.txt');
    Input_slh = fopen(nom_doc_input, 'w+');
        
        % fichier de sortie Silhouette
    nom_doc_output = strcat('Output_silhouette_', matrix{i, 3}, '_Test.txt');
    Output_slh = fopen(nom_doc_output, 'w+');
     
    while indice <= 6       
   %     disp (matrix{i, 3});
        for j = 1 : taille
            if Matrice_Moment_silhouette(i, j) == 0                
                fprintf(Input_slh, ch1, '0');                
            else
               % disp (Matrice_Moment_silhouette(i, j));
                fprintf(Input_slh, ch1, Matrice_Moment_silhouette(i, j));                
            end
        end
        ch = '\n';
        fprintf(Output_slh, ch1, num2str(matrix{i, 4})); 
        fprintf(Output_slh, ch); 
        i = i + 1;
        indice = indice + 1;
        fprintf(Input_slh, ch); 
       
    end
    
    fclose(Input_slh); 
    fclose(Output_slh); 
  
    indice = 1;
    
end

  

end

