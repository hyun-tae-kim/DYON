function [CCD_C_1_0,CCD_C_2_1,CCD_C_3_2,CCD_C_4_3,CCD_C_5_4,CCD_C_6_5]=CCD_C(n_e,T_i);

global n_e_data_CCD_C;
 
global T_e_data_CCD_C;
 
global Table_CCD_C_1_0;
 
global Table_CCD_C_2_1;
 
global Table_CCD_C_3_2;
 
global Table_CCD_C_4_3;
 
global Table_CCD_C_5_4;
 
global Table_CCD_C_6_5;
 

CCD_C_1_0=interp2(n_e_data_CCD_C,T_e_data_CCD_C,Table_CCD_C_1_0,n_e,T_i,'spline');
CCD_C_2_1=interp2(n_e_data_CCD_C,T_e_data_CCD_C,Table_CCD_C_2_1,n_e,T_i,'spline');
CCD_C_3_2=interp2(n_e_data_CCD_C,T_e_data_CCD_C,Table_CCD_C_3_2,n_e,T_i,'spline');
CCD_C_4_3=interp2(n_e_data_CCD_C,T_e_data_CCD_C,Table_CCD_C_4_3,n_e,T_i,'spline');
CCD_C_5_4=interp2(n_e_data_CCD_C,T_e_data_CCD_C,Table_CCD_C_5_4,n_e,T_i,'spline');
CCD_C_6_5=interp2(n_e_data_CCD_C,T_e_data_CCD_C,Table_CCD_C_6_5,n_e,T_i,'spline');

%interpolation function for charge exchange coefficient of C in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)

