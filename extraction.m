function [ name_person, name_action ] = extraction( nom_video )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

info = regexp(nom_video,'(\w+)-(\w+).\w+','tokens');
%celldisp(doubleValues2);
 
name_person = info{1}{1} ;
 
name_action = info{1}{2} ;
 
end

