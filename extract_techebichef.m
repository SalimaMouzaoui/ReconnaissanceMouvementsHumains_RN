function [ array1, taille ] = recup_array_techebichev( nom_image, n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

taille = calcul_taille( n );

array1 = zeros (1, taille);

J = imread(nom_image);
       
[height, width, numberOfColorChannels] = size(J);

Tpq = zeros(1, taille);
    
    m = 1;
    for i = 1 : (n+1)
        for j = 1 :(n+1)
            k = i - 1;
            l = j - 1;
            if k + l <= n
                 Tpq(m) = chebychev_silhouette( J, width, height, k, l);              
                array1(m) = Tpq(m);
                m = m + 1;
            end
        end
    end

end

