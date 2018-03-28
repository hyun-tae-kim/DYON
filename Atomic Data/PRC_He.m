function [PRC_He_1_0,PRC_He_2_1]=PRC_He(n_e,T_i);

global n_e_data_PRC_He;
 
global T_e_data_PRC_He;
 
global Table_PRC_He_1_0;
 
global Table_PRC_He_2_1;

PRC_He_1_0=interp2(n_e_data_PRC_He,T_e_data_PRC_He,Table_PRC_He_1_0,n_e,T_i,'spline');
PRC_He_2_1=interp2(n_e_data_PRC_He,T_e_data_PRC_He,Table_PRC_He_2_1,n_e,T_i,'spline');
%interpolation function for charge exchange power coefficient of He in each ionization stages(1+->0, 2+->1+)