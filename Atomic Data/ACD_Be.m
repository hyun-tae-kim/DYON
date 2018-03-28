function [ACD_Be_1_0,ACD_Be_2_1,ACD_Be_3_2,ACD_Be_4_3]=ACD_Be(n_e,T_e); 
%interpolation function for recombination coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)

global n_e_data_ACD_Be
global T_e_data_ACD_Be
global Table_ACD_Be_1_0
global Table_ACD_Be_2_1
global Table_ACD_Be_3_2
global Table_ACD_Be_4_3


ACD_Be_1_0=interp2(n_e_data_ACD_Be,T_e_data_ACD_Be,Table_ACD_Be_1_0,n_e,T_e,'spline'); 
ACD_Be_2_1=interp2(n_e_data_ACD_Be,T_e_data_ACD_Be,Table_ACD_Be_2_1,n_e,T_e,'spline');
ACD_Be_3_2=interp2(n_e_data_ACD_Be,T_e_data_ACD_Be,Table_ACD_Be_3_2,n_e,T_e,'spline');
ACD_Be_4_3=interp2(n_e_data_ACD_Be,T_e_data_ACD_Be,Table_ACD_Be_4_3,n_e,T_e,'spline');

    
%interpolation function for recombination coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)