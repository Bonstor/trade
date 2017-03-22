function [ money_arr,op_arr ] = test( net,tail,data,money )
%TEST Summary of this function goes here
%   Detailed explanation goes here
len = size(data);
len = len(2);
op_arr=[];
money_arr = [];
for i=1+tail:len-1
    p=data(i-tail:i-1)';
    s = sim(net,p);
    money_arr = [money_arr,money];
    if s(1)>0
        money = money + money * data(i)-4;
        op_arr=[op_arr,data(i)];
        if money<10
            break
        end;
    end;
end

