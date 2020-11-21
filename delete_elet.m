function [ tab ] = delete_elet( tab)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
i = length(tab);

while i > 1
    if tab(i) ~= 0
        tab(i) = 0;
        break;
    else
        i = i - 1;
    end
end

end

