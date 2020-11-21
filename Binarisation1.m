function [ ] = Binarisation1( nom_doss, chemin_image, nom_image, doss_select )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

doss_select = strcat (doss_select, '_');
nom_doss = regexprep(nom_doss, '/', '_');
nom_doss = regexprep(nom_doss, doss_select, '');

OutVideoDir = strcat(nom_doss);
if ~exist(OutVideoDir, 'dir')
    mkdir(OutVideoDir);
end
I = imread(chemin_image);
%BW = im2bw(I, 0.5);

%BW = rgb2gray(I);
BW = I;
filename = nom_image;
fullFileName = fullfile(OutVideoDir, filename); 
imwrite(BW, fullFileName);
        
end

