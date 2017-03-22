function [ output,P, T] = make_data( input, time, tail, trunk)
%MAKE_DATA Summary of this function goes here
%   Detailed explanation goes here
s = size(input);
s = s(1);
output = [];
for i=1:+time:s-time
    output =[output, (input(i+time)-input(i))/input(i)];
    %output = [output; input(i)];
end
output = output;
s = size(output);
s = s(2);
P=[];
T=[];
% for i=1:s
%     output(i) = i;
% end
parfor i=1:s-tail-1
    P=[P;output(i:i+tail-1)*100];
    T=[T;output(i+tail)];
end
P=P';
T=T';
end

