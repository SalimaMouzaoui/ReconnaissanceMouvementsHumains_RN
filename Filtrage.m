function [ ] = Filtrage( nom_doss, chemin_image, nom_image, doss_select )
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
t = [9 9];%taille du filter
H = fspecial('Gaussian',t,1);
ImageG = imfilter(I,H);
%ImageG = uint8(ImageG);
motif = '(\d)+.PNG';
[ num_frame ] = extraction_num_frame( nom_image, motif );

filename = strcat(num2str(num_frame), '.PNG');
fullFileName = fullfile(OutVideoDir, filename); 
imwrite(ImageG, fullFileName);
        
end

