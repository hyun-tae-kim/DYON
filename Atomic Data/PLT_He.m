function [PLT_He_0,PLT_He_1]=PLT_He(n_e,T_e);

global n_e_data_PLT_He;
 
global T_e_data_PLT_He;
 
global Table_PLT_He_0;
 
global Table_PLT_He_1;
 
PLT_He_0=interp2(n_e_data_PLT_He,T_e_data_PLT_He,Table_PLT_He_0,n_e,T_e,'spline');
PLT_He_1=interp2(n_e_data_PLT_He,T_e_data_PLT_He,Table_PLT_He_1,n_e,T_e,'spline');
%interpolation function for total line radiation power coefficient of He in each ionization stages(0, 1+, 2+)
