function [data1] = readEFile(x)

file=load(x)
numCh=22;
fs=250;
count=0;

info = zeros(size(file.data.parameters.EVENT.TYP,1),2);%769 
for i = 1:size(file.data.parameters.EVENT.TYP,1)
    if(file.data.parameters.EVENT.TYP(i)==783)
        count = count + 1;
        info(i,1)=file.data.parameters.EVENT.POS(i);
        info(i,2)=file.data.parameters.EVENT.DUR(i);
    end;  
    
 
     
end;
info(any(info,2)==0,:)=[];


%filter the signal to remove artifact
[B,A]=butter(5,[7*(2/fs),30*(2/fs)]); 
data=filter(B,A,file.data.signal);

batchsize=4*fs;%4s after the cue
%construct responses
data1 = zeros(batchsize,numCh,size(info,1));


for x = 1:size(info,1)
      data1(:,:,x) =  data(info(x,1):info(x,1)+batchsize-1,1:22);
end;


end
