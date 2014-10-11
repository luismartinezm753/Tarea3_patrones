%Se le entrega una matriz con los centros (centers) de los clusters.
%Tambien las imagenes a las que se les quiere cacular el histograma
function hist = histogramas(centers, imgs)
    numClust = size(centers,1);
    hist = zeros (numel(imgs), numClust);
    classes = (1:1:numClust);
    class = {};
    for i =1:numel(classes)
        class{i} = num2str(classes(i));
    end
    knn = fitcknn(centers, class', 'NumNeighbors', 1); %ClassificationKNN.fit para versión 2013
    for i = 1:numel(imgs)
        hist(i,:) = histograma(imgs{i}, knn, numClust);
    end
end