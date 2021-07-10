function [acc1,acc2] = OVO(data1,data2,data3,data4,trainingData,evalData,labelE,labelT)

%6 pairs
[predictedLabels11,scores11,predictedLabels12,scores12] = classification(data1,data2,trainingData,evalData);
[predictedLabels21,scores21,predictedLabels22,scores22]  = classification(data1,data3,trainingData,evalData);
[predictedLabels31,scores31,predictedLabels32,scores32]  = classification(data1,data4,trainingData,evalData);
[predictedLabels41,scores41,predictedLabels42,scores42]  = classification(data2,data3,trainingData,evalData);
[predictedLabels51,scores51,predictedLabels52,scores52] = classification(data2,data4,trainingData,evalData);
[predictedLabels61,scores61,predictedLabels62,scores62] = classification(data3,data4,trainingData,evalData);

%predict labels of trainingData
p1 = (scores11(:,1)+scores21(:,1)+scores31(:,1))/3;
p2 = (scores11(:,2)+scores41(:,1)+scores51(:,1))/3;
p3 = (scores21(:,2)+scores41(:,2)+scores61(:,1))/3;
p4 = (scores31(:,2)+scores51(:,2)+scores61(:,2))/3;

testingLabels1=zeros(length(p1),1);
[~,testingLabels1]=max([p1 p2 p3 p4],[],2);
acc1 = 100*length(find((labelT-testingLabels1)==0))/length(labelT);

%predict labels of evalData
p1 = (scores12(:,1)+scores22(:,1)+scores32(:,1))/3;
p2 = (scores12(:,2)+scores42(:,1)+scores52(:,1))/3;
p3 = (scores22(:,2)+scores42(:,2)+scores62(:,1))/3;
p4 = (scores32(:,2)+scores52(:,2)+scores62(:,2))/3;

testingLabels2=zeros(length(p1),1);
[~,testingLabels2]=max([p1 p2 p3 p4],[],2);
acc2 = 100*length(find((labelE-testingLabels2)==0))/length(labelE);

end