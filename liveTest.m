%% This m-file is for live test
 % First import the image file to x1
    
x1 = im2bw(x1);
x2 = imresize(x1,[1500 1500]);
x2 = 1 - x2;    %reverse black and white

%% Save images to separate files
for i=0:9
    for j=0:9
        data = getImage(i,j,x2);
        name = ['n',num2str(i),num2str(j),'.mat'];
        save(name,'data');
    end
end
%%
% Here I organized each file into the right folder by hand
% because we will use 'prdatafile' later

%% Load as prdataset

handDataset = prdatafile('handwritten','load');
handDataset_rep = my_rep(handDataset);
labs = genlab([10 10 10 10 10 10 10 10 10 10],['digit_0';'digit_1';'digit_2';'digit_3';'digit_4';'digit_5';'digit_6';'digit_7';'digit_8';'digit_9']);
handDataset_rep = prdataset(handDataset_rep,labs)

