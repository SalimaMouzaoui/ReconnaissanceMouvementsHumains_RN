function [ ] = lancer_techebychev( matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% les moments de tchebychev sur la silhouette

% 1 => blanc et 0 => noir 

% p + q  = n qui représente l'ordre
% par exple n = 5 donc on aura p = 1; q = 4 ... etc 

n = 9;
taille = calcul_taille( n );

longueur = length(matrix);

disp (longueur);

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


% les moments de tchebychev sur le contour
% 
% 1 => blanc et 0 => noir 
% 
% p + q  = n qui représente l'ordre
% par exple n = 5 donc on aura p = 1; q = 4 ... etc 
% 
% extract_contour( 'Frame2_BE.png' );

% Matrice_Moment_contour = zeros (longueur, taille);
% % les moments de Tchebychev
% 
% for h = 1 : longueur
% 
%     nom_doss_entree = matrix{h, 2};
%     nom_image = strcat(nom_doss_entree, '\', num2str(matrix{h, 1}), '.PNG');
%     
%     [boundaries, bw] = extract_contour( nom_image );
%     %imshow(bw);
%     J = imread(nom_image);
%    % extract_contour( 'Frame2_BE.png' );
%     [height, width, numberOfColorChannels] = size(J);
%  
%     Tpq = zeros(1, taille);
%     
%     m = 1;
%     for i = 1 : (n+1)
%         for j = 1 :(n+1)
%             k = i - 1;
%             l = j - 1;
%             if k + l <= n
%                 Tpq(m) = chebychev_contour( bw, width, height, boundaries, k, l);
%                 Matrice_Moment_contour(h, m) = Tpq(m);
%                 m = m + 1;
%             end
%         end  
%     end
% %     disp('Tpq = ')
% %     disp(Tpq);
% end

% les moments de tchebychev sur le squelette
% Matrice_Moment_Squeletisation = zeros (longueur, taille);
% 
% for h = 1 : longueur
% 
%     nom_doss_entree = matrix{h, 2};
%     nom_image = strcat(nom_doss_entree, '_Squeletisation', '\', num2str(matrix{h, 1}), '.PNG');
%     
%     J = imread(nom_image);
%     [height, width, numberOfColorChannels] = size(J);
%  
%     Tpq = zeros(1, taille);
%     
%     m = 1;
%     for i = 1 : (n+1)
%         for j = 1 :(n+1)
%             k = i - 1;
%             l = j - 1;
%             if k + l <= n
%                
%                 Tpq(m) = chebychev_Squeletisation( J, width, height, k, l);
% 
%                 Matrice_Moment_Squeletisation(h, m) = Tpq(m);
%                 m = m + 1;
%             end
%         end  
%     end
% %     disp('Tpq = ')
% %     disp(Tpq);
% end
% 
% 

% fichier d'entrée Silhouette
nom_doc = strcat('Input_silhouette_Coll.txt');
Input_slh = fopen(nom_doc,'w');

% fichier de sortie Silhouette
nom_doc = strcat('Output_silhouette_Coll.txt');
Output_slh = fopen(nom_doc,'w');
  
% fichier d'entrée Squelette
% nom_doc = strcat('Input_squelette.txt');
% Input_sql = fopen(nom_doc,'w');
% 
% % fichier de sortie Squelette
% nom_doc = strcat('Output_squelette.txt');
% Output_sql = fopen(nom_doc,'w');
% 
% fichier d'entrée contour
% nom_doc = strcat('Input_contour.txt');
% Input_ctr = fopen(nom_doc,'w');
% 
% fichier de sortie contour
% nom_doc = strcat('Output_contour.txt');
% Output_ctr = fopen(nom_doc,'w');

% % all
% 
% nom_doc_all = strcat('Input.txt');
% Input_all = fopen(nom_doc_all,'a+');
% 
% % fichier de sortie
% nom_doc_all = strcat('Output.txt');
% Output_all = fopen(nom_doc_all,'a+');

for i = 1 : longueur
        result = num2str(matrix{i, 4});
    for j = 1 : taille
        ch = ' %s ';        
        
        if Matrice_Moment_silhouette(i, j) == 0
            
            fprintf(Input_slh, ch, '0');
        
        else
            fprintf(Input_slh, ch, Matrice_Moment_silhouette(i, j));
           
        end
        
        
%         if Matrice_Moment_contour(i, j) == 0
%             
%             fprintf(Input_ctr, ch, '0');
%         else
%             fprintf(Input_ctr, ch, Matrice_Moment_contour(i, j));
%         end
%         
%         if Matrice_Moment_Squeletisation(i, j) == 0
%             
%             fprintf(Input_sql, ch, '0');
%         else
%             fprintf(Input_sql, ch, Matrice_Moment_Squeletisation(i, j));
%         end
    end
                
    
        fprintf(Output_slh, ch, result);
   %   fprintf(Output_ctr, ch, result);
     % fprintf(Output_sql, ch, result);
        ch = '\n';        
        
       fprintf(Input_slh, ch);  
      %   fprintf(Input_sql, ch); 
%         fprintf(Input_ctr, ch);
        
        fprintf(Output_slh, ch);      
   %      fprintf(Output_sql, ch);      
   %      fprintf(Output_ctr, ch);
end

 fclose(Input_slh);  
%  fclose(Input_sql); 
 % fclose(Input_ctr);
        
% fclose(Output_slh);      
 % fclose(Output_sql);      
  %fclose(Output_ctr);

  
% minimum = min (Matrice_Moment_silhouette);
% minimumF = min (minimum)
% 
% maximum = max (Matrice_Moment_silhouette);
% maximumF = max (maximum)

%RN( minimum, maximum );
end

