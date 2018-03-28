function [ACD_He_1_0,ACD_He_2_1]=ACD_He(n_e,T_e); 
%interpolation function for recombination coefficient of He in each ionization stages(1+->0, 2+->1+)

global n_e_data_ACD_He
global T_e_data_ACD_He
global Table_ACD_He_1_0
global Table_ACD_He_2_1

ACD_He_1_0=interp2(n_e_data_ACD_He,T_e_data_ACD_He,Table_ACD_He_1_0,n_e,T_e,'spline'); 
ACD_He_2_1=interp2(n_e_data_ACD_He,T_e_data_ACD_He,Table_ACD_He_2_1,n_e,T_e,'spline');
%interpolation function for recombination coefficient of He in each ionization stages(1+->0, 2+->1+)