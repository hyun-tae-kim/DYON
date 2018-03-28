function [PRB_H_1_0]=PRB_H(n_e,T_e);

global n_e_data_PRB_H;
 
global T_e_data_PRB_H;
 
global Table_PRB_H_1_0;
 

PRB_H_1_0=interp2(n_e_data_PRB_H,T_e_data_PRB_H,Table_PRB_H_1_0,n_e,T_e,'spline');

%interpolation function for recombination and bremsstrahlung power coefficient of H (1+->0)
