function [ ] = lancer_Squeletisation( matrix )

clc; 

% Squelettisation
for i = 1 : length(matrix)
    squeletisation( matrix{i, 2}, matrix{i, 1} )
end
end