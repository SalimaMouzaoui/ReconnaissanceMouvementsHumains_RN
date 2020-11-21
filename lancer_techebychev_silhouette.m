function [ ] = lancer_techebychev_silhouette( matrix, nom_doss, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% les moments de tchebychev sur la silhouette

% 1 => blanc et 0 => noir 

% p + q  = n qui représente l'ordre
% par exple n = 5 donc on aura p = 1; q = 4 ... etc 

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

% fichier d'entrée Silhouette
nom_doc = strcat('Input_silhouette_', nom_doss, '.txt');
Input_slh = fopen(nom_doc,'w');

% fichier de sortie Silhouette
nom_doc = strcat('Output_silhouette_', nom_doss, '.txt');
Output_slh = fopen(nom_doc,'w');

for i = 1 : longueur
        result = num2str(matrix{i, 4});
    for j = 1 : taille
        ch = ' %s ';        
        
        if Matrice_Moment_silhouette(i, j) == 0
            
            fprintf(Input_slh, ch, '0');
        
        else
            fprintf(Input_slh, ch, Matrice_Moment_silhouette(i, j));
           
        end
        
    end
                
        fprintf(Output_slh, ch, result);
        ch = '\n';        
        
       fprintf(Input_slh, ch);  
        
        fprintf(Output_slh, ch);      
end

 fclose(Input_slh); 
        
 fclose(Output_slh);

% minimum = min (Matrice_Moment_silhouette);
% minimumF = min (minimum)
% 
% maximum = max (Matrice_Moment_silhouette);
% maximumF = max (maximum)

%RN( minimum, maximum );
end

