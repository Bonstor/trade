function [ err ] = Untitled( in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tmp=[];
in=abs(round(in))+1;
load('Genetic.mat');
number_of_nero=in(1);
tail=in(2);
trunc=in(3);
loc_mean=in(4);
len=10000;
[ P,T ] = make_data4( RTS(1:len), BR(1:len), SBRF(1:len), Si(1:len) , tail,trunc,loc_mean);
    for j=1:1
        net=feedforwardnet([number_of_nero],'trainscg');
        net.trainParam.max_fail=6;
        net.trainParam.epochs=5000;
        net=train(net,P,T*100,'useGPU','yes');
        [p,in] = procent(sim(net,P),T);
        tmp=[tmp,p];
    end;
    err=100-mean(tmp);

end

