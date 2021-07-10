function [predictedLabels1,scores1,predictedLabels2,scores2] = classification(data1,data2,trainingData,evalData)

fs=250;
nbFilterPairs=1;           %%select the number of filter pairs
winSize=[0.5,4];            % time window in seconds [0,4] 
winSize=(winSize)*fs;       % time window in samples
color_1=[255,55,151]/255;
color_2=[141,221,0]/255;

labels=[zeros(size(data1,3),1);ones(size(data2,3),1)];
c1=data1(winSize(1,1):winSize(1,2),:,:);
c2=data2(winSize(1,1):winSize(1,2),:,:);
CSPmatrix=CSP(covarianceMatrices(c1),covarianceMatrices(c2)); %%generate the CSP matrix
projection=trialsProjection(cat(3,c1,c2),CSPmatrix,nbFilterPairs); %%project the EEG signals
features=extractFeatures(projection); %%Generate features based on variance
%%%%generate LDA model
classificationModel=fitcdiscr(features,labels); 
K=classificationModel.Coeffs(1,2).Const;
L=classificationModel.Coeffs(1,2).Linear;
f=@(x1,x2) K + L(1)*x1 + L(2)*x2;


figure
hold on
plot(features(labels==0,1),features(labels==0,2),...
    'p','color','w','MarkerFaceColor',color_1,'markerSize',10)
plot(features(labels==1,1),features(labels==1,2),...
    'o','color','w','MarkerFaceColor',color_2,'markerSize',8)
model=fimplicit(f,...
    [min(min(features(:,1))) max(max(features(:,1))) min(min(features(:,2))) max(max(features(:,2)))]);
model.Color=[0 0 0];
model.LineWidth=2;
title('Decision boundary')


%%%prepare for predicting training data
projection1=trialsProjection(trainingData(winSize(1,1):winSize(1,2),:,:),CSPmatrix,nbFilterPairs);
features_test1=extractFeatures(projection1);
[predictedLabels1,scores1]=predict(classificationModel,features_test1);
%%%prepare for predicting evalData
projection2=trialsProjection(evalData(winSize(1,1):winSize(1,2),:,:),CSPmatrix,nbFilterPairs);
features_test2=extractFeatures(projection2);
[predictedLabels2,scores2]=predict(classificationModel,features_test2);

end