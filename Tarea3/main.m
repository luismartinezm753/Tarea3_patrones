%%Main de la tarea
descriptors=load('Rand_descriptors.mat');
centers=cell(1,7);
k=1;
data=descriptors.data;
%creamos los cluster
for i=[100 300 500 700 900 1100 1300]
    name=['centers_' num2str(i) '.mat'];
    if (exist(name,'file')==2)
        centers{k}=load(name);
        k=k+1;
    else
        centers{k}=clustering(i,data);
        k=k+1;
    end
end
disp('clusters listos');
pathTrain='Dataset/Train';%son / xq es linux
k=100;
trainer=cell(1,7);
%entrenamos el SVM
for j=1:numel(centers)
    trainer{j}=training(pathTrain,centers{j}.centers);
    saveTrainer(trainer{j},k);
    k=k+200;
end

