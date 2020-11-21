function [ ] = create_video( nom_doss )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 % create the video writer with 1 fps

nom_video = strcat(nom_doss, '.avi');
files = dir(nom_doss);
N=30;
writerObj = VideoWriter( nom_video );
writerObj.FrameRate = N;
open(writerObj);
[ array_frames ] = tableau_des_frames( nom_doss );
array_frames = sort(array_frames);

for i=1:length(array_frames) %number of images to be read
%    if ~strcmp(files(i).name, '.') && ~strcmp(files(i).name, '..')

    nom_file = strcat(nom_doss, '\000', num2str(array_frames(i)), '.PNG');
    I = imread(nom_file);
    J = imresize(I, 0.28);
   % imshow(J);
  %  j = imread(nom_file);
   % [x, map] = imread(nom_file);
   % nom_file = imresize(j, [40 40]);
    %disp (nom_file);
%     img = imread(nom_file);
%     img = uint8(img);
    writeVideo(writerObj,J)

%    end
end
close(writerObj);

end

