function [PRB_N_1_0,PRB_N_2_1,PRB_N_3_2,PRB_N_4_3,PRB_N_5_4,PRB_N_6_5,PRB_N_7_6]=PRB_N(n_e,T_e);

global n_e_data_PRB_N;
 
global T_e_data_PRB_N;
 
global Table_PRB_N_1_0;
 
global Table_PRB_N_2_1;
 
global Table_PRB_N_3_2;
 
global Table_PRB_N_4_3;
 
global Table_PRB_N_5_4;
 
global Table_PRB_N_6_5;
 
global Table_PRB_N_7_6;
 

PRB_N_1_0=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_1_0,n_e,T_e,'spline');
PRB_N_2_1=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_2_1,n_e,T_e,'spline');
PRB_N_3_2=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_3_2,n_e,T_e,'spline');
PRB_N_4_3=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_4_3,n_e,T_e,'spline');
PRB_N_5_4=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_5_4,n_e,T_e,'spline');
PRB_N_6_5=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_6_5,n_e,T_e,'spline');
PRB_N_7_6=interp2(n_e_data_PRB_N,T_e_data_PRB_N,Table_PRB_N_7_6,n_e,T_e,'spline');

%interpolation function for recombination and bremsstrahlung power coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)
