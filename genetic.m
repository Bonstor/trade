function [ err ] = Untitled( in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tmp=[];
in=abs(round(in))+1;
load('Genetic.mat');
n1=in(1);
n2=in(2);
n3=in(3);
n4=in(4);
[ P,T ] = make_data4( RTS(1:30000), BR(1:30000), SBRF(1:30000), Si(1:30000) , n2,n3,n4);
    for j=1:1
        net=feedforwardnet([n1],'trainscg');
        net.trainParam.max_fail=6;
        net.trainParam.epochs=5000;
        net=train(net,P,T*100,'useGPU','yes');
        [p,in] = procent(sim(net,P),T);
        tmp=[tmp,p];
    end;
    err=100-mean(tmp);

end

