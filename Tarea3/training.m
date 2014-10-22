%Esta funcion entrega el svm de los archivos de entrenamiento
%train path es la ruta de los archivos de entrenamiento
%centers son los centros de los clusters
%ej de train_path: C:\Users\Vincent\git\Tarea3_patrones\Tarea3\Dataset\Train
function svm = training(train_path, centers)
    [perros, otros, classes] = process_img( train_path );
    hist = [histogramas(centers, perros); histogramas(centers, otros)];
    svm = fitcsvm(hist, classes, 'Standardize',true,'KernelFunction','RBF');
    CVSVMModel = crossval(svm);
    svm = CVSVMModel.Trained{1};
end
