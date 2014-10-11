function clustering(numClusters,matrix)
%makes k cluster from data in matrix
    num=num2str(numClusters);
    nameCenter=['centers_' num '.mat'];
    nameAssig=['assignments_' num '.mat'];
    data_vector=matrix;
    if iscell(matrix)
        data_vector=single(concatVectors(matrix));
        data_vector=getRandDes(data_vector);
    end
    data_vector=data_vector';%es la matriz traspuesta
    [assignments,centers]=kmeans(data_vector,numClusters);
    save(nameCenter,'centers');
    save(nameAssig,'assignments');
end
function data=concatVectors(cell)
    data=[];
    for i=1:numel(cell)
        data=[data cell{i}];
    end
end
function data=getRandDes(data_vector)
    pos=randperm(size(data_vector,2));
    data=zeros(128,100000);
    for i=1:100000
        data(:,i)=data_vector(:,pos(i));
    end
    save('Rand_descriptors.mat','data');
end