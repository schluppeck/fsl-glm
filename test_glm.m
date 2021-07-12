% quick example of using the pre-comoputed GLM from fsl in matlab
%
% ds 2021-07

%%
fname = 'designMatrix.txt';

X = load(fname);

figure
subplot(2,1,1)
plot(X)
title('design matrix columns')

subplot(2,1,2)
imagesc(X)
axis('square')
colormap('gray')

%% figure 2

% mix together columns

b = [2;0;0.2;0]
T = X*b

figure
plot(T,'r','linewidth',2)
hold on
plot(X(:,[1,3]), 'k')

