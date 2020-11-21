function [ nbFrames ] = lecture_video( nom_video, chemin )

video = VideoReader(strcat(chemin, '\', nom_video));
OutVideoDir = nom_video;
if ~exist(OutVideoDir, 'dir')
    mkdir(OutVideoDir);
end
nbFrames = video.NumberOfFrames;

    for i = 1:nbFrames
        img = read(video, i);
        baseFileName = sprintf('%d.PNG', i); % e.g. "Frame1.png"
        fullFileName = fullfile(OutVideoDir, baseFileName); 
        imwrite(img, fullFileName);
    end
    
end

