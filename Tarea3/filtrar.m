%Esta funcion entrega los datos para el plotroc, recibe los scores del SVM,
%las clases esperadas (expected) y el umbral (threshold).
%Filtra los resltados dependiendo de las clases, poniendo un 1 en la clase
%a la que corresponda.
function [ targets, outputs ] = filtrar(scores, expected, threshold)
    targets = [];
    outputs = [];
    diff = max(max(scores(:,1)), max(scores(:,2))) - min(min(scores(:,1)), min(scores(:,2)));
    thr = threshold*diff + min(min(scores(:,1)), min(scores(:,2)));
    for i = 1:numel(expected)
        if(scores(i,2)>=thr)
            outputs = [outputs, [1;0]];
        else
            outputs = [outputs, [0;1]];
        end
        if(strcmp(expected{i},'perro'))
            targets = [targets, [1;0]];
        else
            targets = [targets, [0;1]];
        end
    end
end
