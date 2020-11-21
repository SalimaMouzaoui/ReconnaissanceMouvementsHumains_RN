function [ elet_centre ] = elet_centrale( tab )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

nb = length(tab);
j = 1;
for i = 1 : nb
    if tab(i) ~= 0
        tableau(j) = tab(i);
        j = j + 1;
    end
end
nbre = length(tableau);

% 
% disp ('nbre = ');
% disp (nbre);

if mod(nbre, 2) == 0
    paire = 1;
else paire = 0; 
end

if paire == 0
    indice = floor(nbre / 2) + 1;
%         disp ('indice = ');
%         disp (indice);
        
    elet_centre = tableau(indice);
else
    indice = (nbre / 2);
    elet_centre = tableau(indice);
end
    
end

