%Esta funcion entrega el svm de los archivos de entrenamiento
%train path es la ruta de los archivos de entrenamiento
%centers son los centros de los clusters
%ej de train_path: C:\Users\Vincent\git\Tarea3_patrones\Tarea3\Dataset\Train
function svm = trainer(train_path, centers)
    perros = LoadImg(strcat(train_path, '/Dog/'), '*.jpg');%son / en linux
    otros = LoadImg(strcat(train_path, '/No-Dog/'), '*.jpg');
    class_dog = [];
    class_no_dog = [];
    numel(perros)
    for i = 1:numel(perros)
        class_dog = [class_dog; 'perro'];
    end
    for i = 1:numel(otros)
        class_no_dog = [class_no_dog; 'no-perro'];
    end
    classes = [cellstr(class_dog); cellstr(class_no_dog)];
    hist = [histogramas(centers, perros); histogramas(centers, otros)];
    svm = fitcsvm(hist, classes, 'Standardize',true,'KernelFunction','RBF');
    CVSVMModel = crossval(svm);
    svm = CVSVMModel.Trained{1};
end
