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
    else
        centers{k}=clustering(i,data);
    end
    k=k+1;
end
disp('clusters listos');
pathTrain='Dataset/Train';%son / xq es linux
pathTest='Dataset/Test';
k=100;
train=cell(1,7);
scores=cell(1,7);
treshold=[0.2 0.4 0.5 0.6 0.7 0.8 0.9];
%entrenamos el SVM
for j=1:numel(centers)
    name=['trainer_' num2str(k) '.mat'];
    if (exist(name,'file')==2)
        train{j}=load(name);
    else
        train{j}=training(pathTrain,centers{j}.centers);
        train = train{j};
        save(name, 'train');
    end
    disp('Test');
    [obtained, expected, score] = testing(pathTest,train{j}.trainer,centers{j}.centers,k);%entrenamos el svm
    scores{j} = score;
    save(['score_' num2str(k) '.mat'], 'score');
    figure;
    hold on
    for i=1:numel(treshold)
        [targets, outputs]=filtrar(score, expected, treshold(i));
        plotroc(targets, outputs);
    end
    hold off
    k=k+200;
end
