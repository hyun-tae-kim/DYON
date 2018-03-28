function [CCD_Be_1_0,CCD_Be_2_1,CCD_Be_3_2,CCD_Be_4_3]=CCD_Be(n_e,T_i);

global n_e_data_CCD_Be;
 
global T_e_data_CCD_Be;
 
global Table_CCD_Be_1_0;
 
global Table_CCD_Be_2_1;
 
global Table_CCD_Be_3_2;
 
global Table_CCD_Be_4_3;
 

CCD_Be_1_0=interp2(n_e_data_CCD_Be,T_e_data_CCD_Be,Table_CCD_Be_1_0,n_e,T_i,'spline');
CCD_Be_2_1=interp2(n_e_data_CCD_Be,T_e_data_CCD_Be,Table_CCD_Be_2_1,n_e,T_i,'spline');
CCD_Be_3_2=interp2(n_e_data_CCD_Be,T_e_data_CCD_Be,Table_CCD_Be_3_2,n_e,T_i,'spline');
CCD_Be_4_3=interp2(n_e_data_CCD_Be,T_e_data_CCD_Be,Table_CCD_Be_4_3,n_e,T_i,'spline');

%interpolation function for charge exchange coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)