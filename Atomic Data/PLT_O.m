function [PLT_O_0,PLT_O_1,PLT_O_2,PLT_O_3,PLT_O_4,PLT_O_5,PLT_O_6,PLT_O_7]=PLT_O(n_e,T_e);

global n_e_data_PLT_O;
 
global T_e_data_PLT_O;
 
global Table_PLT_O_0;
 
global Table_PLT_O_1;
 
global Table_PLT_O_2;
 
global Table_PLT_O_3;
 
global Table_PLT_O_4;
 
global Table_PLT_O_5;
 
global Table_PLT_O_6;
 
global Table_PLT_O_7;
 

PLT_O_0=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_0,n_e,T_e,'spline');
PLT_O_1=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_1,n_e,T_e,'spline');
PLT_O_2=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_2,n_e,T_e,'spline');
PLT_O_3=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_3,n_e,T_e,'spline');
PLT_O_4=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_4,n_e,T_e,'spline');
PLT_O_5=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_5,n_e,T_e,'spline');
PLT_O_6=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_6,n_e,T_e,'spline');
PLT_O_7=interp2(n_e_data_PLT_O,T_e_data_PLT_O,Table_PLT_O_7,n_e,T_e,'spline');

    
%interpolation function for total line radiation powr coefficient of oxygen in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+, 7+)
