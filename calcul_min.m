function [ min1, indic_min ] = calcul_min( array )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

for i = 1 : length(array)
    
    if (array(i) ~= 0)
        min1 = array(i);
        indic_min = i;
        break;
    end
end

for i = 1 : length(array)
    
    if (array(i) ~= 0)
        
        if array(i) < min1
            min1 = array(i);
            indic_min = i;
        end
    end
end

end

