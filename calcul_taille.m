function [ taille ] = calcul_taille( n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

taille = 0;
for i = 1 : (n+1)
    for j = 1 :(n+1)
        k = i - 1;
        l = j - 1;
        if k + l <= n
            taille = taille + 1;
        end
    end
end

end

