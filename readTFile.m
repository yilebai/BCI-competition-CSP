function [data1,data2,data3,data4,data5] = readTFile(x)

file=load(x)
numCh=22;
fs=250;
count=0;

info1 = zeros(size(file.data.parameters.EVENT.TYP,1),2);%769 
info2 = zeros(size(file.data.parameters.EVENT.TYP,1),2);%770
info3 = zeros(size(file.data.parameters.EVENT.TYP,1),2);%771
info4 = zeros(size(file.data.parameters.EVENT.TYP,1),2);%772
info5 = zeros(size(file.data.parameters.EVENT.TYP,1),2);%all
for i = 1:size(file.data.parameters.EVENT.TYP,1)
    if(file.data.parameters.EVENT.TYP(i)==769||file.data.parameters.EVENT.TYP(i)==770||file.data.parameters.EVENT.TYP(i)==771||file.data.parameters.EVENT.TYP(i)==772)
        count = count + 1;
        info5(i,1)=file.data.parameters.EVENT.POS(i);
        info5(i,2)=file.data.parameters.EVENT.DUR(i);
    end

     if(file.data.parameters.EVENT.TYP(i)==769)
        info1(i,1)=file.data.parameters.EVENT.POS(i);
        info1(i,2)=file.data.parameters.EVENT.DUR(i);
    elseif(file.data.parameters.EVENT.TYP(i)==770)
        info2(i,1)=file.data.parameters.EVENT.POS(i);
        info2(i,2)=file.data.parameters.EVENT.DUR(i); 
    elseif(file.data.parameters.EVENT.TYP(i)==771)
        info3(i,1)=file.data.parameters.EVENT.POS(i);
        info3(i,2)=file.data.parameters.EVENT.DUR(i);
    elseif(file.data.parameters.EVENT.TYP(i)==772)
        info4(i,1)=file.data.parameters.EVENT.POS(i);
        info4(i,2)=file.data.parameters.EVENT.DUR(i);
     end
end
info1(any(info1,2)==0,:)=[];
info2(any(info2,2)==0,:)=[];
info3(any(info3,2)==0,:)=[];
info4(any(info4,2)==0,:)=[];
info5(any(info5,2)==0,:)=[];

%filter the signal to remove artifact
[B,A]=butter(5,[7*(2/fs),30*(2/fs)]); 
data=filter(B,A,file.data.signal);

batchsize=4*fs;%4s after the cue
%construct responses
data1 = zeros(batchsize,numCh,size(info1,1));%72
data2 = zeros(batchsize,numCh,size(info2,1));
data3 = zeros(batchsize,numCh,size(info3,1));
data4 = zeros(batchsize,numCh,size(info4,1));
data5 = zeros(batchsize,numCh,size(info5,1));%288


for x = 1:size(info1,1)
      data1(:,:,x) =  data(info1(x,1):info1(x,1)+batchsize-1,1:22);
      data2(:,:,x) =  data(info2(x,1):info2(x,1)+batchsize-1,1:22);
      data3(:,:,x) =  data(info3(x,1):info3(x,1)+batchsize-1,1:22);
      data4(:,:,x) =  data(info4(x,1):info4(x,1)+batchsize-1,1:22);
end

for x = 1:size(info5,1)
      data5(:,:,x) =  data(info5(x,1):info5(x,1)+batchsize-1,1:22);
end


end
