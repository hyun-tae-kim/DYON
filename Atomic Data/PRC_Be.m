function [PRC_Be_1_0,PRC_Be_2_1,PRC_Be_3_2,PRC_Be_4_3]=PRC_Be(n_e,T_i);

global n_e_data_PRC_Be;
 
global T_e_data_PRC_Be;
 
global Table_PRC_Be_1_0;
 
global Table_PRC_Be_2_1;
 
global Table_PRC_Be_3_2;
 
global Table_PRC_Be_4_3;
  

PRC_Be_1_0=interp2(n_e_data_PRC_Be,T_e_data_PRC_Be,Table_PRC_Be_1_0,n_e,T_i,'spline');
PRC_Be_2_1=interp2(n_e_data_PRC_Be,T_e_data_PRC_Be,Table_PRC_Be_2_1,n_e,T_i,'spline');
PRC_Be_3_2=interp2(n_e_data_PRC_Be,T_e_data_PRC_Be,Table_PRC_Be_3_2,n_e,T_i,'spline');
PRC_Be_4_3=interp2(n_e_data_PRC_Be,T_e_data_PRC_Be,Table_PRC_Be_4_3,n_e,T_i,'spline');

%interpolation function for charge exchange power coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)