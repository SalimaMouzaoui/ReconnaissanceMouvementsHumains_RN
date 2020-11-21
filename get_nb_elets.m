function [ nb ] = get_nb_elets( tab )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
nb = 0;
for i = 1 : length(tab)
    if tab(i) ~= 0
        nb = nb + 1 ;
    end
end

end

