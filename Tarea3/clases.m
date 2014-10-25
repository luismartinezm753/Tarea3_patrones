function [ classes ] = clases( path )
%UNTITLED Summary of this function goes here
%   Entrega las clases a las que corresponden las imagenes de test_path o
%   de train_path
    D = dir([strcat(path, '/Dog'), '/*.jpg']);
    dogs = length(D(not([D.isdir])));
    D = dir([strcat(path, '/No-Dog'), '/*.jpg']);
    otros = length(D(not([D.isdir])));
    class_dog = [];
    class_no_dog = [];
    for i = 1:dogs
        class_dog = [class_dog; 'perro'];
    end
    for i = 1:otros
        class_no_dog = [class_no_dog; 'no-perro'];
    end
    classes = [cellstr(class_dog); cellstr(class_no_dog)];
end

