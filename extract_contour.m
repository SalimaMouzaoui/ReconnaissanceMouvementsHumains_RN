function [ b, bw ] = extract_contour( nom_image) %nom_video, nom_dossier, indice_image )

% OutVideoDir = strcat('Frames_Contour_', nom_video);
% if ~exist(OutVideoDir, 'dir')
%     mkdir(OutVideoDir);
% end

%nom_image = strcat(nom_dossier, nom_video, '\','Frame', num2str(indice_image),'_BE.png');

bw = imread(nom_image);
bw = im2bw(imread(nom_image)); 

h = fspecial('gaussian', 5, 5);
bw = imfilter(bw, h);
bw = imfill(~bw, 'hole');
bw = ~bw;

b = bwboundaries(bw);
% 
% figure, imshow(bw), title('contour');
% hold 
% 
% for i = 1:length(b)
%     contour = b{i};
%     plot(contour(:,2), contour(:,1), 'r', 'LineWidth', 2);
% end
% 
% F = getframe;
% figure
% imshow(F.cdata)
% 
% filename = strcat('Frame', num2str(indice_image), '_CT.png');
% fullFileName = fullfile(OutVideoDir, filename); 
% imwrite(F.cdata, fullFileName);

end

