%Esta funcion entrega el svm de los archivos de entrenamiento
%test path es la ruta de los archivos de entrenamiento
%centers son los centros de los clusters
%ej de test_path: C:\Users\Vincent\git\Tarea3_patrones\Tarea3\Dataset\Test
function [ obtained, expected ] = testing(test_path, svm, centers)
    [perros, otros, expected] = process_img( test_path );
    hist = [histogramas(centers, perros); histogramas(centers, otros)];
    [obtained] = predict(svm,hist);
end

