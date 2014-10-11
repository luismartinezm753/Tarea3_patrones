function [frame, descriptor] = sift_descriptor(img)
    if size(img, 3)== 3
        img=rgb2gray(img);
    end
    img=single(img);
    [frame,descriptor]=vl_sift(img);
end