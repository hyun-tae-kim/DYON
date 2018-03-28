function [PLT_C_0,PLT_C_1,PLT_C_2,PLT_C_3,PLT_C_4,PLT_C_5]=PLT_C(n_e,T_e);

global n_e_data_PLT_C;
 
global T_e_data_PLT_C;
 
global Table_PLT_C_0;
 
global Table_PLT_C_1;
 
global Table_PLT_C_2;
 
global Table_PLT_C_3;
 
global Table_PLT_C_4;
 
global Table_PLT_C_5;
 

PLT_C_0=interp2(n_e_data_PLT_C,T_e_data_PLT_C,Table_PLT_C_0,n_e,T_e,'spline');
PLT_C_1=interp2(n_e_data_PLT_C,T_e_data_PLT_C,Table_PLT_C_1,n_e,T_e,'spline');
PLT_C_2=interp2(n_e_data_PLT_C,T_e_data_PLT_C,Table_PLT_C_2,n_e,T_e,'spline');
PLT_C_3=interp2(n_e_data_PLT_C,T_e_data_PLT_C,Table_PLT_C_3,n_e,T_e,'spline');
PLT_C_4=interp2(n_e_data_PLT_C,T_e_data_PLT_C,Table_PLT_C_4,n_e,T_e,'spline');
PLT_C_5=interp2(n_e_data_PLT_C,T_e_data_PLT_C,Table_PLT_C_5,n_e,T_e,'spline');

%interpolation function for total line radiation power coefficient of C in each ionization stages(0, 1+, 2+, 3+, 4+, 5+)