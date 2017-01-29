%% This m-file is for feature representation
 % We use pixel representation in both scenarios
 
function a = my_rep(m)
    imgSize = 32;
    imgPixel = [imgSize imgSize];
    
    rdata = im_box(m) ; %remove empty rows and columns 
    rdata = im_resize(rdata, imgPixel); % resize to 32*32
    
 % Switch to turn on im_feature and dissimilarity
 
    %rdata = im_features(rdata, 'all'); %for feature representation
    %rdata = distm(rdata);  %for dissimilarity representation
    
    a = prdataset(rdata);   %convert to dataset
end