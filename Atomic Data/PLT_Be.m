function [PLT_Be_0,PLT_Be_1,PLT_Be_2,PLT_Be_3]=PLT_Be(n_e,T_e);

global n_e_data_PLT_Be;
 
global T_e_data_PLT_Be;
 
global Table_PLT_Be_0;
 
global Table_PLT_Be_1;
 
global Table_PLT_Be_2;
 
global Table_PLT_Be_3;
 

PLT_Be_0=interp2(n_e_data_PLT_Be,T_e_data_PLT_Be,Table_PLT_Be_0,n_e,T_e,'spline');
PLT_Be_1=interp2(n_e_data_PLT_Be,T_e_data_PLT_Be,Table_PLT_Be_1,n_e,T_e,'spline');
PLT_Be_2=interp2(n_e_data_PLT_Be,T_e_data_PLT_Be,Table_PLT_Be_2,n_e,T_e,'spline');
PLT_Be_3=interp2(n_e_data_PLT_Be,T_e_data_PLT_Be,Table_PLT_Be_3,n_e,T_e,'spline');

%interpolation function for total line radiation power coefficient of Be in each ionization stages(0, 1+, 2+, 3+, 4+)
