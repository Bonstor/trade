function [ P,T ] = make_data4( RTS, BR, SBRF, SI , len,trunk,local_mean)
%MAKE_DATA4 Summary of this function goes here
%   Detailed explanation goes here
[ out,P_rts, T] = make_data( RTS, 1, len, trunk,local_mean);
[ out,P_br, T_br] = make_data( BR, 1, len, trunk,local_mean);
[ out,P_sbrf, T_sbrf] = make_data( SBRF, 1, len, trunk,local_mean);
[ out,P_si, T_si] = make_data( SI, 1, len, trunk,local_mean);
P=[P_rts;P_br;P_sbrf;P_si];
end

