function [ centroid ] = centroid_image( nom_image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% BW = imread(nom_image);
% L = bwlabel(BW);
% stats = regionprops(L,'all');
% centroid = stats.Centroid;

bw = imread(nom_image);
%figure, imshow(I)
%bw = im2bw(I); %, graythresh(getimage));
% figure, imshow(bw)
bw2 = imfill(bw,'holes');
L = bwlabel(bw2);
s = regionprops(L, 'centroid');
%centroid = cat(1, s.Centroid);

centroid = s.Centroid;
 
%Display original image and superimpose centroids.
%imshow(I)
% hold(imgca,'on')
% plot(imgca,centroid(:,1), centroid(:,2), 'r*')
% hold(imgca,'off')

end

