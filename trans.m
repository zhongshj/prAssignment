

%%

%% IN4085 Pattern Recognition | Final Project

%  Instructions
%  ------------
% 
%  This file contains ...
%  Parameters:
%   - pixels
%   - classifier parameters
%   - pca
%   - feature selection
%   - dissimilarity

%% Initialization
clear ; close all; clc

%% Setup the parameters
imgSize = 32;

input_layer_size  = imgSize^2;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)
imgPixel = [imgSize imgSize];

%% =========== Part 1: Data Selection & Preprocessing =============

rdata = prnist([0:9],[1:4:1000]);
disp([newline 'Data ready'])
%pause;

%rdata = im_rotate(rdata);
rdata = im_box(rdata,1,0) ; %remove empty empty border columns and rows 
rdata = im_resize(rdata, imgPixel); % resize
dataset = prdataset(rdata);%convert to dataset
disp([newline 'Dataset prepared and ready'])
%pause;

%% Pixel Representation %%
%feature_dataset = im_features(dataset, 'all');
%[train_data, test_data] = gendat(dataset, 0.8);
%[d1,d2,d3,d4,d5] = gendat(dataset, [0.2,0.2,0.2,0.2,0.2]);

%w = ldc(f_train_data);
%acc = 1 - (f_test_data * w * testc)
%w3 = qdc;
%F = im_features(dataset, 'all');
%[train_data, test_data] = gendat(F, 0.1);
w1 = ldc;
w2 = qdc;
w3 = knnc([],3);
w4 = knnc([],5);
w5 = parzenc([],0.25);
w6 = svc;
w7 = fisherc;
w8 = naivebc;
w9 = neurc;
%[ERR4,STDS4] = prcrossval(dataset,w4,10);
%[ERR7,STDS7] = prcrossval(distm(dataset),w7,10);
%[ERR8,STDS8] = prcrossval(distm(dataset),w8,10);
%[ERR9,STDS9] = prcrossval(dataset,w9,10);
%[ERR5,STDS5] = prcrossval(distm(dataset),w5,10);

%w5 = knnc([],4);
%w2 = parzenc([],0.25);
%w10 = [w2,w3,w4,w5,w6,w7,w8]*{prodc,meanc,medianc,maxc,minc,votec};
%%
window = [0.01 0.05 0.1 0.25 0.5 1 1.5 2 3 4 5];
ERRparzen = [];
for i = 1:length(window)
    w4 = parzenc([],window(i));
    [ERR4,STDS4] = prcrossval(dataset,w4,10);
    ERRparzen = [ERRparzen,ERR4];
end
plot(ERRparzen,window);

%%
ERRP6 = [];
for i = 1:1:24
    p = pcam([],i);
    Wp = p*w7;
    [temp,temp2] = prcrossval(F,Wp,10);
    ERRP6 = [ERRP6,temp];
end
%%
x = 1:1:25;
plot(x,ERRP1,'-bo');
title('PCA Error for Pixel Representation Scenario 2');
xlabel('Number of features');ylabel('Error');
axis([0,27,0.1,0.9]);
hold on;
plot(x,ERRP2,'-k*');
hold on;
plot(x,ERRP3,'-r+');
legend('3NN','SVC','fisher')
%%
x = 1:1:24;
plot(x,ERRP4,'-bo');
xlabel('Number of features');ylabel('Error');
title('PCA Error for Feature Representation Scenario 2');
axis([0,27,0.1,0.9]);
hold on;
plot(x,ERRP5,'-k*');
hold on;
plot(x,ERRP6,'-r+');
legend('ldc','SVC','fisher')
%%
W = {w1,w2};
p1 = pcam([],0.55);
p2 = pcam([],0.60);
p3 = pcam([],0.65);
p4 = pcam([],0.70);
p5 = pcam([],0.75);
P = {p1,p2,p3,p4,p5};
Wp = P*w1;
Vp = train_data*Wp;
disp([newline 'Errors for individual classifiers with PCA 85'])
testc(test_data,Vp);
