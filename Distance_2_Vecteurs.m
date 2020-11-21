function [ dist ] = Distance_2_Vecteurs( array1, array2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

somme = 0;
for i = 1 : length(array1)
    somme = somme + ((array1(i) - array2(i))^2);
end

dist = sqrt(somme);

end

