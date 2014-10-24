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
pathTest='Dataset/Test';
k=100;
trainer=cell(1,7);
test=cell(1,7);
filtrate=cell(1,7);
treshold=[0.2 0.4 0.5 0.6 0.7 0.8 0.9];
%entrenamos el SVM
for j=1:numel(centers)
    name=['trainer_' num2str(k) '.mat'];
    if (exist(name,'file')==2)
        trainer{j}=load(name);
    else
        trainer{j}=training(pathTrain,centers{j}.centers);
        saveTrainer(trainer{j},k);
    end
    test{j}=testing(pathTest,trainer{j},centers{j},centers);%entrenamos el svm
    save(test{j},['test_' num2str(k) '.mat']);
    filtrate{j}=filtrate(test{j}.scores,test{j}.expected,treshol(j));
    save(filtrate{j},['filtrate_' num2str(k) '.mat']);
    k=k+200;
end
