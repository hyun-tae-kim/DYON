function [CCD_O_1_0,CCD_O_2_1,CCD_O_3_2,CCD_O_4_3,CCD_O_5_4,CCD_O_6_5,CCD_O_7_6,CCD_O_8_7]=CCD_O(n_e,T_i);

global n_e_data_CCD_O;
 
global T_e_data_CCD_O;
 
global Table_CCD_O_1_0;
 
global Table_CCD_O_2_1;
 
global Table_CCD_O_3_2;
 
global Table_CCD_O_4_3;
 
global Table_CCD_O_5_4;
 
global Table_CCD_O_6_5;
 
global Table_CCD_O_7_6;
 
global Table_CCD_O_8_7;


CCD_O_1_0=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_1_0,n_e,T_i,'spline');
CCD_O_2_1=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_2_1,n_e,T_i,'spline');
CCD_O_3_2=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_3_2,n_e,T_i,'spline');
CCD_O_4_3=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_4_3,n_e,T_i,'spline');
CCD_O_5_4=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_5_4,n_e,T_i,'spline');
CCD_O_6_5=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_6_5,n_e,T_i,'spline');
CCD_O_7_6=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_7_6,n_e,T_i,'spline');
CCD_O_8_7=interp2(n_e_data_CCD_O,T_e_data_CCD_O,Table_CCD_O_8_7,n_e,T_i,'spline');

%interpolation function for charge exchange coefficient of oxygen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

