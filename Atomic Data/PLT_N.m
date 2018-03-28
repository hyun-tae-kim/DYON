function [PLT_N_0,PLT_N_1,PLT_N_2,PLT_N_3,PLT_N_4,PLT_N_5,PLT_N_6]=PLT_N(n_e,T_e);

global n_e_data_PLT_N;
 
global T_e_data_PLT_N;
 
global Table_PLT_N_0;
 
global Table_PLT_N_1;
 
global Table_PLT_N_2;
 
global Table_PLT_N_3;
 
global Table_PLT_N_4;
 
global Table_PLT_N_5;
 
global Table_PLT_N_6;


PLT_N_0=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_0,n_e,T_e,'spline');
PLT_N_1=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_1,n_e,T_e,'spline');
PLT_N_2=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_2,n_e,T_e,'spline');
PLT_N_3=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_3,n_e,T_e,'spline');
PLT_N_4=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_4,n_e,T_e,'spline');
PLT_N_5=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_5,n_e,T_e,'spline');
PLT_N_6=interp2(n_e_data_PLT_N,T_e_data_PLT_N,Table_PLT_N_6,n_e,T_e,'spline');


    
%interpolation function for total line radiation powr coefficient of nitrogen in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+)
