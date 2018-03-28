function [PRC_N_1_0 , PRC_N_2_1,PRC_N_3_2,PRC_N_4_3,PRC_N_5_4,PRC_N_6_5,PRC_N_7_6] = PRC_N(n_e,T_i);

global n_e_data_PRC_N;
 
global T_e_data_PRC_N;
 
global Table_PRC_N_1_0;
 
global Table_PRC_N_2_1;
 
global Table_PRC_N_3_2;
 
global Table_PRC_N_4_3;
 
global Table_PRC_N_5_4;
 
global Table_PRC_N_6_5;
 
global Table_PRC_N_7_6;
 

 


PRC_N_1_0=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_1_0,n_e,T_i,'spline');
PRC_N_2_1=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_2_1,n_e,T_i,'spline');
PRC_N_3_2=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_3_2,n_e,T_i,'spline');
PRC_N_4_3=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_4_3,n_e,T_i,'spline');
PRC_N_5_4=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_5_4,n_e,T_i,'spline');
PRC_N_6_5=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_6_5,n_e,T_i,'spline');
PRC_N_7_6=interp2(n_e_data_PRC_N,T_e_data_PRC_N,Table_PRC_N_7_6,n_e,T_i,'spline');


%interpolation function for charge exchange power coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

