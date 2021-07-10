
close all
clear
clc

numCh=22;%22+3
fs=250;
%read training files
[data1T1,data1T2,data1T3,data1T4,data1T5] = readTFile('A01T.mat');
[data2T1,data2T2,data2T3,data2T4,data2T5] = readTFile('A02T.mat');
[data3T1,data3T2,data3T3,data3T4,data3T5] = readTFile('A03T.mat');
[data4T1,data4T2,data4T3,data4T4,data4T5] = readTFile('A04T.mat');
[data5T1,data5T2,data5T3,data5T4,data5T5] = readTFile('A05T.mat');
[data6T1,data6T2,data6T3,data6T4,data6T5] = readTFile('A06T.mat');
[data7T1,data7T2,data7T3,data7T4,data7T5] = readTFile('A07T.mat');
[data8T1,data8T2,data8T3,data8T4,data8T5] = readTFile('A08T.mat');
[data9T1,data9T2,data9T3,data9T4,data9T5] = readTFile('A09T.mat');

label1T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A01T.mat');
label1T=label1T.classlabel;
label2T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A02T.mat');
label2T=label2T.classlabel;
label3T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A03T.mat');
label3T=label3T.classlabel;
label4T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A04T.mat');
label4T=label4T.classlabel;
label5T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A05T.mat');
label5T=label5T.classlabel;
label6T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A06T.mat');
label6T=label6T.classlabel;
label7T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A07T.mat');
label7T=label7T.classlabel;
label8T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A08T.mat');
label8T=label8T.classlabel;
label9T=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A09T.mat');
label9T=label9T.classlabel;

%read evaluation files
[data1E] = readEFile('A01E.mat');
[data2E] = readEFile('A02E.mat');
[data3E] = readEFile('A03E.mat');
[data4E] = readEFile('A04E.mat');
[data5E] = readEFile('A05E.mat');
[data6E] = readEFile('A06E.mat');
[data7E] = readEFile('A07E.mat');
[data8E] = readEFile('A08E.mat');
[data9E] = readEFile('A09E.mat');

label1E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A01E.mat');
label1E=label1E.classlabel;
label2E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A02E.mat');
label2E=label2E.classlabel;
label3E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A03E.mat');
label3E=label3E.classlabel;
label4E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A04E.mat');
label4E=label4E.classlabel;
label5E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A05E.mat');
label5E=label5E.classlabel;
label6E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A06E.mat');
label6E=label6E.classlabel;
label7E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A07E.mat');
label7E=label7E.classlabel;
label8E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A08E.mat');
label8E=label8E.classlabel;
label9E=load('F:\uulm\semester3\BMI\MI competition\BCIcompetition_IV\true_labels\A09E.mat');
label9E=label9E.classlabel;

[acc11,acc12] = OVO(data1T1,data1T2,data1T3,data1T4,data1T5,data1E,label1E,label1T);
[acc21,acc22] = OVO(data2T1,data2T2,data2T3,data2T4,data2T5,data2E,label2E,label2T);
[acc31,acc32] = OVO(data3T1,data3T2,data3T3,data3T4,data3T5,data3E,label3E,label3T);
[acc41,acc42] = OVO(data4T1,data4T2,data4T3,data4T4,data4T5,data4E,label4E,label4T);
[acc51,acc52] = OVO(data5T1,data5T2,data5T3,data5T4,data5T5,data5E,label5E,label5T);
[acc61,acc62] = OVO(data6T1,data6T2,data6T3,data6T4,data6T5,data6E,label6E,label6T);
[acc71,acc72] = OVO(data7T1,data7T2,data7T3,data7T4,data7T5,data7E,label7E,label7T);
[acc81,acc82] = OVO(data8T1,data8T2,data8T3,data8T4,data8T5,data8E,label8E,label8T);
[acc91,acc92] = OVO(data9T1,data9T2,data9T3,data9T4,data9T5,data9E,label9E,label9T);
accT = cat(1,acc11,acc21,acc31,acc41,acc51,acc61,acc71,acc81,acc91);
aveAccT = mean(accT);
accE = cat(1,acc12,acc22,acc32,acc42,acc52,acc62,acc72,acc82,acc92);
aveAccE = mean(accE);