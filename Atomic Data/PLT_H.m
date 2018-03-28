function [PLT_H_0]=PLT_H(n_e,T_e);

global n_e_data_PLT_H;
 
global T_e_data_PLT_H;
 
global Table_PLT_H_0;
 
 
PLT_H_0=interp2(n_e_data_PLT_H,T_e_data_PLT_H,Table_PLT_H_0,n_e,T_e,'spline');

     
%interpolation function for total line radiation power coefficient of H (1+)