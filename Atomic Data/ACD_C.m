function [ACD_C_1_0,ACD_C_2_1,ACD_C_3_2,ACD_C_4_3,ACD_C_5_4,ACD_C_6_5]=ACD_C(n_e,T_e);

global n_e_data_ACD_C 
global T_e_data_ACD_C 
global Table_ACD_C_1_0
global Table_ACD_C_2_1
global Table_ACD_C_3_2
global Table_ACD_C_4_3
global Table_ACD_C_5_4
global Table_ACD_C_6_5



ACD_C_1_0=interp2(n_e_data_ACD_C,T_e_data_ACD_C,Table_ACD_C_1_0,n_e,T_e,'spline');
ACD_C_2_1=interp2(n_e_data_ACD_C,T_e_data_ACD_C,Table_ACD_C_2_1,n_e,T_e,'spline');
ACD_C_3_2=interp2(n_e_data_ACD_C,T_e_data_ACD_C,Table_ACD_C_3_2,n_e,T_e,'spline');
ACD_C_4_3=interp2(n_e_data_ACD_C,T_e_data_ACD_C,Table_ACD_C_4_3,n_e,T_e,'spline');
ACD_C_5_4=interp2(n_e_data_ACD_C,T_e_data_ACD_C,Table_ACD_C_5_4,n_e,T_e,'spline');
ACD_C_6_5=interp2(n_e_data_ACD_C,T_e_data_ACD_C,Table_ACD_C_6_5,n_e,T_e,'spline');

%interpolation function for recombination coefficient of C in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)