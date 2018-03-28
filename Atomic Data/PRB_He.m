function [PRB_He_1_0,PRB_He_2_1]=PRB_He(n_e,T_e);

global n_e_data_PRB_He;
 
global T_e_data_PRB_He;
 
global Table_PRB_He_1_0;
 
global Table_PRB_He_2_1;
 
PRB_He_1_0=interp2(n_e_data_PRB_He,T_e_data_PRB_He,Table_PRB_He_1_0,n_e,T_e,'spline');
PRB_He_2_1=interp2(n_e_data_PRB_He,T_e_data_PRB_He,Table_PRB_He_2_1,n_e,T_e,'spline');    
%interpolation function for recombination and bremsstrahlung power coefficient of He in each ionization stages(1+->0, 2+->1+)
