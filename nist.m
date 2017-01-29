%% This m-file is for training classifiers for both scenarios

rdata1 = prnist([0:9],[1:4:1000]);  %250 per class
rdata2 = prnist([0:9],[1:100:1000]);    %10 per class

disp([newline 'Data ready'])
%pause;
% imgSize = 32;
% imgPixel = [imgSize imgSize];
% %rdata = im_rotate(rdata);
% rdata = im_box(rdata,1,0) ; %remove empty empty border columns and rows 
% rdata = im_resize(rdata, imgPixel); % resize
%dataset = prdataset(rdata);%convert to dataset

dataset1 = my_rep(rdata1);
dataset2 = my_rep(rdata2);
disp([newline 'Dataset prepared and ready'])
%% 3NN PCA28 Scenario 1
w = knnc([],3);
p = pcam([],29);
Wp = p * w;
Vp1 = dataset1 * Wp;

%% SVC PCA23 Scenario 2
w = ldc;
p = pcam([],23);
Wp = p * w;
Vp2 = dataset2 * Wp;