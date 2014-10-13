function [ dogs, otros, classes ] = process_img( path )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    dogs = LoadImg(strcat(train_path, '/Dog/'), '*.jpg');%son / en linux
    otros = LoadImg(strcat(train_path, '/No-Dog/'), '*.jpg');
    class_dog = [];
    class_no_dog = [];
    numel(dogs)
    for i = 1:numel(dogs)
        class_dog = [class_dog; 'perro'];
    end
    for i = 1:numel(otros)
        class_no_dog = [class_no_dog; 'no-perro'];
    end
    classes = [cellstr(class_dog); cellstr(class_no_dog)];
end

