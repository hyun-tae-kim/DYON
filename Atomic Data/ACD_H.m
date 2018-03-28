function [ACD_H_1_0]=ACD_H(n_e,T_e);

global n_e_data_ACD_H
global T_e_data_ACD_H
global Table_ACD_H_1_0
 

ACD_H_1_0=interp2(n_e_data_ACD_H,T_e_data_ACD_H,Table_ACD_H_1_0,n_e,T_e,'spline');

%interpolation function for recombination coefficient of H (1+->0)
