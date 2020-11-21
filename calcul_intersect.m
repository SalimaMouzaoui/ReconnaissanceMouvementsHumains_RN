function [ nb ] = calcul_intersect( array1, array2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

nb = 0;
for i = 1 : length(array1)
    for j = 1 : length(array2)
        if array1(i) == array2(j)
            nb = nb + 1;
            break;
        end
    end
end
    

end

