function [centroid, oui] = boite_englobante(nom_doss, nom_image, indice_image) %boite_englobante( nom_image, indice_i_g, indice_j_g, taille_i, taille_j)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

oui = 0;
OutVideoDir = nom_doss;
if ~exist(OutVideoDir, 'dir')
    mkdir(OutVideoDir);
end

% récupérer la plus grande zone
BW = im2bw(imread(nom_image)); 

[L, num] = bwlabel(BW, 8);

count_pixels_per_obj = sum(bsxfun(@eq,L(:),1:num));
[~,ind] = max(count_pixels_per_obj);
biggest_blob = (L==ind);

%%// Display the images
% 
% figure,imshow(BW)
% figure,imshow(biggest_blob)

nom_image_apres_trait = strcat('Frame', num2str(indice_image), '.PNG');
%disp (nom_image_apres_trait);

imwrite(biggest_blob, nom_image_apres_trait);

I = imread(nom_image_apres_trait);

delete(nom_image_apres_trait);

 %Label the image
[Label, num] = bwlabel(I);

stats = regionprops(Label,'all');
centroid = stats.Centroid;

%Object Number
[row, col] = find(Label==num);

%To find Bounding Box
sx=min(col)-0.5;
sy=min(row)-0.5;
breadth=max(col)-min(col)+1;
len=max(row)-min(row)+1;

sx = sx + 1;
sy = sy + 1;
breadth = breadth + 1;
len = len + 1;

BBox=[sx sy breadth len];
%display(BBox);

% figure,imshow(I);
% 
% hold;
x=zeros([1 5]);
y=zeros([1 5]);
x(:)=BBox(1);
y(:)=BBox(2);
x(2:3)=BBox(1)+BBox(3);
y(3:4)=BBox(2)+BBox(4);
%plot(x,y,'Color','r');

% sx = sx + 1;
% sy = sy + 1;
% breadth = breadth + 1;
% len = len + 1;

I2 = imcrop(I, [sx sy breadth len]);

% imwrite(I2, 'plot.png')
nom = strcat('plot', num2str(indice_image), '.png');
%disp (nom)

if  ~isempty(I2)
imwrite(I2, nom)

I = imread(nom);
[h, w, z] = size(I);

%if h > 10 && w < 90
    filename = strcat(num2str(indice_image),'.PNG');
    fullFileName = fullfile(OutVideoDir, filename);  
    imwrite(I, fullFileName);      
    oui = 1;
%else 
 %   oui = 0;
% else
%     dicrim = 1;
%end

delete(nom);
end

end


