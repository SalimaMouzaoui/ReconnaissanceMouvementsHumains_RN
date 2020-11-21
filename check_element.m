function [ exist ] = check_element( array, element )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

exist = 0;
for i = 1 : length( array)
    if array(i) == element
        array(array == i) = [];
        exist = 1;
        break;
    end
end

end

