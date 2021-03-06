function makeDataset(path,size,flag)
    %el flag sirve para ver si es de la clase perro o no/perro, cero para
    %No-Dog y 1 para Dog
    %Crea el dataset tanto la parte de test como train, los conjunto de train y
    %test son disjuntos
    data=dir(path);
    folder=randperm(numel(data));
    k=1;
    n=0;
    while n<=size
        if(folder(k)==1 || folder(k)==2)%caso especial xq agrego 2 archivos raros xd
            k=k+1;
            continue
        end
        nameFolder=data(folder(k)).name;
        if strcmp(nameFolder,'056.dog')
            k=k+1;
            continue
        end
        actualFolder=dir([path nameFolder]);
        images=getRandImg(actualFolder, nameFolder, path);
        saveImages(images,folder(k),flag);
        k=k+1;
        n=n+numel(images);
    end
end
function images=getRandImg(dir, nameFolder,path)
    %path='/home/luism/Universidad/Patrones/256_ObjectCategories/';
    perm=randperm(numel(dir));
    nimages=ceil((numel(dir)-5)*rand()+5);%tomamos al menos 5 fotos
    images=cell(1,nimages);
    for i=1:nimages
        if(perm(i)==1 || perm(i)==2 || strcmp('greg',dir(perm(i)).name))%caso especial xq agrego 2 archivos raros xd
            continue
        end
        images{i}=imread([path nameFolder '/' dir(perm(i)).name]);
    end
end
function saveImages(images,k,class)
    pathTest='Dataset/Test/';
    pathTrain='Dataset/Train/';
    flag=2;
    if class>0
        pathTrain=strcat(pathTrain,'Dog/');
        pathTest=strcat(pathTest,'Dog/');
    else
        pathTrain=strcat(pathTrain,'No-Dog/');
        pathTest=strcat(pathTest,'No-Dog/');
    end
    for i=1:numel(images)
        if isempty(images{i})
            continue
        end
        name=strcat(num2str(k),num2str(i));
        name=strcat(name,'.jpg');
        if flag>0
            name=strcat(pathTrain,name);
            flag=flag-1;
        else
            name=strcat(pathTest,name);
            flag=2;
        end
        imwrite(images{i},name,'jpg');
    end
end
