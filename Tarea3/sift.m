function sift()
    %rCarga las imagenes del directorio corpus y calcul para SIFT cada una,
    %guarda una matriz con los descriptores y otra con los keypoints.
    path='corpus/';
    dirImg=dir('corpus/*.jpg');
    nfiles=length(dirImg);
    frames=cell(1,nfiles);
    descriptor=cell(1,nfiles);
    for i=1:nfiles
        img=imread([path dirImg(i).name]);
        if size(img, 3)== 3
            img=rgb2gray(img);
        end
        img=single(img);
        [frames{i},descriptor{i}]=vl_sift(img);
    end
    save('descriptor.mat','descriptor');
    save('frames.mat','frames');
end

