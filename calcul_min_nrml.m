function [ min1, indic_min ] = calcul_min_nrml( array )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

min1 = array(1);
indic_min = 1;

for i = 2 : length(array)
    if array(i) < min1
        min1 = array(i);
        indic_min = i;
        break;
    end
end
end

