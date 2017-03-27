function [ proc,neuro ] = optimize( P,T )
%OPTIMIZE Summary of this function goes here
%   Detailed explanation goes here
proc=[];
neuro=[];
for i=10:5:320
    tmp=[];
    for j=1:3
        net=feedforwardnet([i],'trainscg');
        net.trainParam.max_fail=6;
        net=train(net,P,T*100,'useGPU','yes');
        [p,in] = procent(sim(net,P),T);
        tmp=[tmp,p];
    end;
    proc=[proc,mean(tmp)];
    neuro=[neuro,i];
end

