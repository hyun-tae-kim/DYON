function [CCD_N_1_0,CCD_N_2_1,CCD_N_3_2,CCD_N_4_3,CCD_N_5_4,CCD_N_6_5,CCD_N_7_6]=CCD_N(n_e,T_i);

global n_e_data_CCD_N;
 
global T_e_data_CCD_N;
 
global Table_CCD_N_1_0;
 
global Table_CCD_N_2_1;
 
global Table_CCD_N_3_2;
 
global Table_CCD_N_4_3;
 
global Table_CCD_N_5_4;
 
global Table_CCD_N_6_5;
 
global Table_CCD_N_7_6;
 



CCD_N_1_0=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_1_0,n_e,T_i,'spline');
CCD_N_2_1=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_2_1,n_e,T_i,'spline');
CCD_N_3_2=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_3_2,n_e,T_i,'spline');
CCD_N_4_3=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_4_3,n_e,T_i,'spline');
CCD_N_5_4=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_5_4,n_e,T_i,'spline');
CCD_N_6_5=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_6_5,n_e,T_i,'spline');
CCD_N_7_6=interp2(n_e_data_CCD_N,T_e_data_CCD_N,Table_CCD_N_7_6,n_e,T_i,'spline');

%interpolation function for charge exchange coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

