function [CCD_He_1_0,CCD_He_2_1]=CCD_He(n_e,T_i);

global n_e_data_CCD_He;
 
global T_e_data_CCD_He;
 
global Table_CCD_He_1_0;
 
global Table_CCD_He_2_1;


CCD_He_1_0=interp2(n_e_data_CCD_He,T_e_data_CCD_He,Table_CCD_He_1_0,n_e,T_i,'spline');
CCD_He_2_1=interp2(n_e_data_CCD_He,T_e_data_CCD_He,Table_CCD_He_2_1,n_e,T_i,'spline');
%interpolation function for charge exchange coefficient of He in each ionization stages(1+->0, 2+->1+)