%Esta funcion entrega el svm de los archivos de entrenamiento
%test path es la ruta de los archivos de entrenamiento
%centers son los centros de los clusters
%ej de test_path: C:\Users\Vincent\git\Tarea3_patrones\Tarea3\Dataset\Test
function [ obtained, classes, scores ] = testing(test_path, svm, centers,k)
    name=['hist_' num2str(k) '.mat'];    
    if(exist(name,'file')==2)
        hist=load(name);
        hist = hist.hist;
        classes = clases(test_path);
    else        
        [perros, otros, classes] = process_img( test_path );
        hist = [histogramas(centers, perros); histogramas(centers, otros)];        
        save(name,'hist')
    end
    [obtained, scores] = predict(svm,hist);
end