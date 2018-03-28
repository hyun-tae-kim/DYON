function [ACD_O_1_0,ACD_O_2_1,ACD_O_3_2,ACD_O_4_3,ACD_O_5_4,ACD_O_6_5,ACD_O_7_6,ACD_O_8_7]=ACD_O(n_e,T_e);

global n_e_data_ACD_O;
global T_e_data_ACD_O;
global Table_ACD_O_1_0;
global Table_ACD_O_2_1;
global Table_ACD_O_3_2;
global Table_ACD_O_4_3;
global Table_ACD_O_5_4;
global Table_ACD_O_6_5;
global Table_ACD_O_7_6;
global Table_ACD_O_8_7;


ACD_O_1_0=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_1_0,n_e,T_e,'spline');
ACD_O_2_1=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_2_1,n_e,T_e,'spline');
ACD_O_3_2=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_3_2,n_e,T_e,'spline');
ACD_O_4_3=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_4_3,n_e,T_e,'spline');
ACD_O_5_4=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_5_4,n_e,T_e,'spline');
ACD_O_6_5=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_6_5,n_e,T_e,'spline');
ACD_O_7_6=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_7_6,n_e,T_e,'spline');
ACD_O_8_7=interp2(n_e_data_ACD_O,T_e_data_ACD_O,Table_ACD_O_8_7,n_e,T_e,'spline');

%interpolation function for recombination coefficient of oxygen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)


