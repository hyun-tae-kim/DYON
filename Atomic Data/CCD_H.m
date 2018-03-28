function [CCD_H_1_0]=CCD_H(n_e,T_i);

global n_e_data_CCD_H;
 
global T_e_data_CCD_H;
 
global Table_CCD_H_1_0;
 

CCD_H_1_0=interp2(n_e_data_CCD_H,T_e_data_CCD_H,Table_CCD_H_1_0,n_e,T_i,'spline');

%interpolation function for charge exchange coefficient of H (1+->0)
