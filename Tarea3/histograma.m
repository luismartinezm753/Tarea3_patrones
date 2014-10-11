%Se le entrega una imagen (img), un knn creado por fitcknn y el numero de
%clusters que hay (numCluster).
function hist = histograma(img, knn, numCluster)
    [~, descriptor] = sift_descriptor(img);
    descriptor = descriptor';
    hist = zeros(1, numCluster);
    for i = 1:size(descriptor,1)
        class = predict(knn, descriptor(i,:));
        clust = str2num(class{1});
        hist(clust) = hist(clust) + 1;
    end
    hist = hist/sum(hist);
end