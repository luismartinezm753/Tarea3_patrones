function makeCorpus(size)
    %Esta funcion genera el corpus para despues crear los clusters
    %se escoge una carpeta al azar y se toma una cantidad aleatoria de
    %fotos, tambien se usa para producir 
    path='/home/luism/Universidad/Patrones/256_ObjectCategories/';
    dataset=dir(path);
    folder=randperm(258);
    k=1;
    n=0;
    while n<size
        if(folder(k)==1 || folder(k)==2)%caso especial xq agrego 2 archivos raros xd
            k=k+1;
            continue
        end
        nameFolder=dataset(folder(k)).name;
        actualFolder=dir([path nameFolder]);
        images=getRandImg(actualFolder, nameFolder);
        saveImages(images,folder(k));
        k=k+1;
        n=n+numel(images);
    end
end
function images=getRandImg(dir, nameFolder)
    path='/home/luism/Universidad/Patrones/256_ObjectCategories/';
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
function saveImages(images,k)
    for i=1:numel(images)
        if isempty(images{i})
            continue
        end
        name=strcat(num2str(k),num2str(i));
        name=strcat(name,'.jpg');
        name=strcat('corpus/',name);
        imwrite(images{i},name,'jpg');
    end
end