function [ proc,in ] = procent( S,T )
%TEST Summary of this function goes here
%   Detailed explanation goes here
save = 0;
len = size(S);
len = len(2);
in=0;
proc = 0;
parfor i=1:len
    if S(i)>save
        in = in+1;
        if S(i) * T(i)>=0
            proc = proc+1;
        end
    end;
     if S(i)<-save
        in = in+1;
        if S(i) * T(i)>=0
            proc = proc+1;
        end
    end;
end;
proc = proc * 100 /in;
        

end

