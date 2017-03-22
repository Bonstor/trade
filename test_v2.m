function [ money_arr,op_arr ] = test_v2( net,p,data,tail,money )
%TEST_V2 Summary of this function goes here
%   Detailed explanation goes here
save = 0;
s = sim(net,p);
len = size(data);
len = len(2);
op_arr=[];
money_arr = [];
for i=1+tail:len-1
    money_arr = [money_arr,money];
    if s(i)>save
        money = money + money * data(i)-4;
        op_arr=[op_arr,data(i)];
        if money<10
            break
        end;
    end;
    if s(i)<-save
        money = money - money * data(i)-4;
        op_arr=[op_arr,data(i)];
        if money<10
            break
        end;
    end;
end

end

