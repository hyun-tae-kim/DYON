function [PRB_Be_1_0,PRB_Be_2_1,PRB_Be_3_2,PRB_Be_4_3]=PRB_Be(n_e,T_e);

global n_e_data_PRB_Be;
 
global T_e_data_PRB_Be;
 
global Table_PRB_Be_1_0;
 
global Table_PRB_Be_2_1;
 
global Table_PRB_Be_3_2;
 
global Table_PRB_Be_4_3;
 

PRB_Be_1_0=interp2(n_e_data_PRB_Be,T_e_data_PRB_Be,Table_PRB_Be_1_0,n_e,T_e,'spline');
PRB_Be_2_1=interp2(n_e_data_PRB_Be,T_e_data_PRB_Be,Table_PRB_Be_2_1,n_e,T_e,'spline');
PRB_Be_3_2=interp2(n_e_data_PRB_Be,T_e_data_PRB_Be,Table_PRB_Be_3_2,n_e,T_e,'spline');
PRB_Be_4_3=interp2(n_e_data_PRB_Be,T_e_data_PRB_Be,Table_PRB_Be_4_3,n_e,T_e,'spline');

    
%interpolation function for recombination and bremsstrahlung power coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)
