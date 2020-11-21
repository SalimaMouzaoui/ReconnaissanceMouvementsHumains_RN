function [ num_frame ] = extraction_num_frame( nom_image, motif )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

 info = regexp(nom_image, motif, 'tokens');

% info = regexp(nom_image,'(\d+).png','tokens');
%  disp (info{1}{1});
% 
% if isempty(info)
%     info = regexp(nom_image,'(\d+).PNG','tokens');
%     disp ('1');
% elseif isempty(info)
%     disp ('here');
%     info = regexp(nom_image,'Frame(\d+)_BE.png','tokens');
% else
%     disp ('2');
%     info = regexp(nom_image,'Frame(\d+).png','tokens');
%     
% end
%  
num_frame = info{1}{1} ;
% 
% disp (num_frame);
end