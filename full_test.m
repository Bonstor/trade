function [ money_arr,procent,in,oper ] = full_test( data,net,tail,money )
%FULL_TEST Summary of this function goes here
%   Detailed explanation goes here
tic
money_arr=[];
procent=0;
in=0;
oper = [];
si = size(data);
si = si(1);
tmp=[];
stock = 0;
save=0;
for i=tail+2:si
    if stock == 1
        money_arr = [money_arr,money + data(i-1)];
    else
        money_arr = [money_arr,money];
    end
    tmp = data(i-tail-1:i-1);
    P=[];
    for j=1:tail
        P =[P;(tmp(j+1)-tmp(j))/tmp(j)];
    end
    s=sim(net,P);
%     if s(1)>save
%         if stock == 0
%             stock = 1;
%             money = money - data(i-1)-2;
%         end
%         if stock == -1
%             stock = 1;
%             money = money + (money_in - data(i-1)-2);
%         end
%     end
%     if s(1)<-save
%         if stock == 0
%             stock = -1;
%             money_in=data(i-1);
%             money=money-2;
%         end;
%         if stock == 1
%             stock = -1;
%             money = money+data(i-1)-2;
%             money_in=data(i-1);
%         end;
%     end;
%         
%
%     
%     
%     
%     
    if s(1)>save & stock == 0
        if data(i)>=0
            procent = procent + 1;
        end;
        in=in+1;
        stock = 1;
        money = money - data(i-1)-2;
    end
    if s(1)<-save & stock == 1
        if data(i)<=0
            procent = procent + 1;
        end;
        in=in+1;
        stock = 0;
        money = money + data(i-1)-2;
    end;
    
        
end

%money_arr = [money_arr,money];
toc
    
end

