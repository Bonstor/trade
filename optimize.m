function [ proc ] = optimize( P,T )
%OPTIMIZE Summary of this function goes here
%   Detailed explanation goes here
proc=[];
for i=10:+10:150
    net=feedforwardnet([i],'trainscg');
    net=train(net,P,T,'useParallel','yes');
    [p,in] = procent(sim(net,P),T);
    proc=[proc,p];
    

end

