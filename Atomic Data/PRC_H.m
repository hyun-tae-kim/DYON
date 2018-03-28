function [PRC_H_1_0]=PRC_H(n_e,T_i);

global n_e_data_PRC_H;
 
global T_e_data_PRC_H;
 
global Table_PRC_H_1_0;
 

PRC_H_1_0=interp2(n_e_data_PRC_H,T_e_data_PRC_H,Table_PRC_H_1_0,n_e,T_i,'spline');

%interpolation function for recombination coefficient of H (1+->0)
