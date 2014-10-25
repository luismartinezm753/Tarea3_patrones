function [ dogs, otros, classes ] = process_img( path )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    dogs = LoadImg(strcat(path, '/Dog/'), '*.jpg');%son / en linux
    otros = LoadImg(strcat(path, '/No-Dog/'), '*.jpg');
    classes = clases(path);
end

