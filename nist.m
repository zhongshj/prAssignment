%% This m-file is for training classifiers for both scenarios

rdata1 = prnist([0:9],[1:1:1000]);  %1000 per class
rdata2 = prnist([0:9],[1:100:1000]);    %10 per class
disp([newline 'Data extracted'])

dataset1 = my_rep(rdata1);
dataset2 = my_rep(rdata2);
disp([newline 'Data representation ready'])
%% 3NN PCA28 Scenario 1
w = knnc([],3);
p = pcam([],29);
Wp1 = p * w;
Vp1 = dataset1 * Wp1;
disp([newline 'Classifier 1 trained'])
%% SVC PCA23 Scenario 2
w = fisherc;
p = pcam([],23);
Wp2 = p * w;
Vp2 = dataset2 * Wp2;
disp([newline 'Classifier 2 trained'])
%% Crossval
%prcrossval(dataset1,Wp1,10)
prcrossval(dataset2,Wp2,10)
%% nist_eval
%nist_eval('my_rep',Vp1)
nist_eval('my_rep',Vp2)
