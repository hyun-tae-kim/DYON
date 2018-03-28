function [ACD_N_1_0,ACD_N_2_1,ACD_N_3_2,ACD_N_4_3,ACD_N_5_4,ACD_N_6_5,ACD_N_7_6]=ACD_N(n_e,T_e);

global n_e_data_ACD_N;
global T_e_data_ACD_N;
global Table_ACD_N_1_0;
global Table_ACD_N_2_1;
global Table_ACD_N_3_2;
global Table_ACD_N_4_3;
global Table_ACD_N_5_4;
global Table_ACD_N_6_5;
global Table_ACD_N_7_6;



ACD_N_1_0=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_1_0,n_e,T_e,'spline');
ACD_N_2_1=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_2_1,n_e,T_e,'spline');
ACD_N_3_2=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_3_2,n_e,T_e,'spline');
ACD_N_4_3=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_4_3,n_e,T_e,'spline');
ACD_N_5_4=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_5_4,n_e,T_e,'spline');
ACD_N_6_5=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_6_5,n_e,T_e,'spline');
ACD_N_7_6=interp2(n_e_data_ACD_N,T_e_data_ACD_N,Table_ACD_N_7_6,n_e,T_e,'spline');


%interpolation function for recombination coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)


