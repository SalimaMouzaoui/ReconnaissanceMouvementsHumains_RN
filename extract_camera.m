function [ info ] = extract_camera( name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
motif = '([a-zA-Z]+[0-9])\d*(\w+\d+)(\w+\d+)';
info = regexp(name, motif, 'tokens');

end

