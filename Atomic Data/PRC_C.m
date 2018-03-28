function [PRC_C_1_0,PRC_C_2_1,PRC_C_3_2,PRC_C_4_3,PRC_C_5_4,PRC_C_6_5]=PRC_C(n_e,T_i);

global n_e_data_PRC_C;
 
global T_e_data_PRC_C;
 
global Table_PRC_C_1_0;
 
global Table_PRC_C_2_1;
 
global Table_PRC_C_3_2;
 
global Table_PRC_C_4_3;
 
global Table_PRC_C_5_4;
 
global Table_PRC_C_6_5;
 


PRC_C_1_0=interp2(n_e_data_PRC_C,T_e_data_PRC_C,Table_PRC_C_1_0,n_e,T_i,'spline');
PRC_C_2_1=interp2(n_e_data_PRC_C,T_e_data_PRC_C,Table_PRC_C_2_1,n_e,T_i,'spline');
PRC_C_3_2=interp2(n_e_data_PRC_C,T_e_data_PRC_C,Table_PRC_C_3_2,n_e,T_i,'spline');
PRC_C_4_3=interp2(n_e_data_PRC_C,T_e_data_PRC_C,Table_PRC_C_4_3,n_e,T_i,'spline');
PRC_C_5_4=interp2(n_e_data_PRC_C,T_e_data_PRC_C,Table_PRC_C_5_4,n_e,T_i,'spline');
PRC_C_6_5=interp2(n_e_data_PRC_C,T_e_data_PRC_C,Table_PRC_C_6_5,n_e,T_i,'spline');


