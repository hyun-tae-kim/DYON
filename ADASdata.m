%% Load ADAS coefficients
%---------------------------------------------------------------------------------------------
% Setting ADAS coefficient datas as global variable to reduce calculation time. 

%interpolation function for recombination coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)
num_ne_data=24; %number of electron density in the ADAS data table
num_Te_data=25; %number of electron temperature in the ADAS data table

temp_n_e=dlmread('acd96_be.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:), temp_n_e(2,:), temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('acd96_be.dat','','A6..H9'); %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('acd96_be.dat','','A11..H85'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data;
     Table_ACD_Be_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)]; 
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('acd96_be.dat','','A87..H161'); 
for k=1:num_Te_data;
     Table_ACD_Be_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('acd96_be.dat','','A163..H237'); 
for k=1:num_Te_data;
     Table_ACD_Be_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('acd96_be.dat','','A239..H313'); 
for k=1:num_Te_data;
     Table_ACD_Be_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

n_e_data_ACD_Be = n_e_data;
T_e_data_ACD_Be = T_e_data;
global n_e_data_ACD_Be T_e_data_ACD_Be Table_ACD_Be_1_0 Table_ACD_Be_2_1 Table_ACD_Be_3_2 Table_ACD_Be_4_3 ;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8
 
%interpolation function for recombination coefficient of C in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('acd96_c.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('acd96_c.dat','','A6..H9'); %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('acd96_c.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_ACD_C_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('acd96_c.dat','','A102..H191');
for k=1:num_Te_data
     Table_ACD_C_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end
tempdata_3=dlmread('acd96_c.dat','','A193..H282');
for k=1:num_Te_data
     Table_ACD_C_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end
tempdata_4=dlmread('acd96_c.dat','','A284..H373');
for k=1:num_Te_data
     Table_ACD_C_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end
tempdata_5=dlmread('acd96_c.dat','','A375..H464');
for k=1:num_Te_data
     Table_ACD_C_5_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end
tempdata_6=dlmread('acd96_c.dat','','A466..H555');
for k=1:num_Te_data
     Table_ACD_C_6_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

n_e_data_ACD_C = n_e_data;
T_e_data_ACD_C = T_e_data;
global n_e_data_ACD_C T_e_data_ACD_C Table_ACD_C_1_0 Table_ACD_C_2_1 Table_ACD_C_3_2 Table_ACD_C_4_3 Table_ACD_C_5_4 Table_ACD_C_6_5;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination coefficient of H (1+->0)

num_ne_data=24; %number of electron density in the data table
num_Te_data=29; %number of electron temperature in the data table

temp_n_e=dlmread('acd96_h.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).  
n_e_data =(10^6)*10.^ [temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('acd96_h.dat','','A6..H9'); %read T_e datas of which number of column is eight(A~H).     
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('acd96_h.dat','','A11..H97'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_ACD_H_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

n_e_data_ACD_H = n_e_data;
T_e_data_ACD_H = T_e_data;
global  n_e_data_ACD_H T_e_data_ACD_H Table_ACD_H_1_0;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('acd96_n.dat','','A4..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('acd96_n.dat','','A7..H10'); %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('acd96_n.dat','','A12..H101'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_ACD_N_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('acd96_n.dat','','A103..H192');
for k=1:num_Te_data
     Table_ACD_N_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('acd96_n.dat','','A194..H283');
for k=1:num_Te_data
     Table_ACD_N_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('acd96_n.dat','','A285..H374');
for k=1:num_Te_data
     Table_ACD_N_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('acd96_n.dat','','A376..H465');
for k=1:num_Te_data
     Table_ACD_N_5_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('acd96_n.dat','','A467..H556');
for k=1:num_Te_data
     Table_ACD_N_6_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('acd96_n.dat','','A558..H647');
for k=1:num_Te_data
     Table_ACD_N_7_6(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

n_e_data_ACD_N = n_e_data;
T_e_data_ACD_N = T_e_data;
global n_e_data_ACD_N T_e_data_ACD_N Table_ACD_N_1_0 Table_ACD_N_2_1 Table_ACD_N_3_2 Table_ACD_N_4_3 Table_ACD_N_5_4 Table_ACD_N_6_5 Table_ACD_N_7_6;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 

%interpolation function for recombination coefficient of oxygen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('acd96_o.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('acd96_o.dat','','A6..H9'); %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('acd96_o.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_ACD_O_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('acd96_o.dat','','A102..H191');
for k=1:num_Te_data
     Table_ACD_O_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('acd96_o.dat','','A193..H282');
for k=1:num_Te_data
     Table_ACD_O_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('acd96_o.dat','','A284..H373');
for k=1:num_Te_data
     Table_ACD_O_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('acd96_o.dat','','A375..H464');
for k=1:num_Te_data
     Table_ACD_O_5_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('acd96_o.dat','','A466..H555');
for k=1:num_Te_data
     Table_ACD_O_6_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('acd96_o.dat','','A557..H646');
for k=1:num_Te_data
     Table_ACD_O_7_6(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

tempdata_8=dlmread('acd96_o.dat','','A648..H737');
for k=1:num_Te_data
     Table_ACD_O_8_7(k,:)=(10^-6)*10.^[tempdata_8(3*k-2,:),tempdata_8(3*k-1,:),tempdata_8(k*3,:)];
end

n_e_data_ACD_O = n_e_data;
T_e_data_ACD_O = T_e_data;
global n_e_data_ACD_O T_e_data_ACD_O Table_ACD_O_1_0 Table_ACD_O_2_1 Table_ACD_O_3_2 Table_ACD_O_4_3 Table_ACD_O_5_4 Table_ACD_O_6_5 Table_ACD_O_7_6 Table_ACD_O_8_7;


clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)

num_ne_data=26; %number of electron density in the data table
num_Te_data=48; %number of electron temperature in the data table

temp_n_e=dlmread('ccd89_be.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('ccd89_be.dat','','A7..H12'); %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('ccd89_be.dat','','A14..H205'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_CCD_Be_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('ccd89_be.dat','','A207..H398');
for k=1:num_Te_data
     Table_CCD_Be_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('ccd89_be.dat','','A400..H591');
for k=1:num_Te_data
     Table_CCD_Be_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('ccd89_be.dat','','A593..H784');
for k=1:num_Te_data
     Table_CCD_Be_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

n_e_data_CCD_Be = n_e_data;
T_e_data_CCD_Be = T_e_data;
global n_e_data_CCD_Be T_e_data_CCD_Be Table_CCD_Be_1_0 Table_CCD_Be_2_1 Table_CCD_Be_3_2 Table_CCD_Be_4_3;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange coefficient of C in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)

num_ne_data=26; %numcr of electron density in the data table
num_Te_data=48; %numcr of electron temperature in the data table

temp_n_e=dlmread('ccd89_c.dat','','A3..H6');  %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('ccd89_c.dat','','A7..H12');    %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('ccd89_c.dat','','A14..H205'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_CCD_C_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('ccd89_c.dat','','A207..H398');
for k=1:num_Te_data
     Table_CCD_C_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('ccd89_c.dat','','A400..H591');
for k=1:num_Te_data
     Table_CCD_C_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('ccd89_c.dat','','A593..H784');
for k=1:num_Te_data
     Table_CCD_C_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

tempdata_5=dlmread('ccd89_c.dat','','A786..H977');
for k=1:num_Te_data
     Table_CCD_C_5_4(k,:)=(10^-6)*10.^[tempdata_5(k*4-3,:),tempdata_5(k*4-2,:),tempdata_5(k*4-1,:),tempdata_5(k*4,1:num_ne_data-24)];
end

tempdata_6=dlmread('ccd89_c.dat','','A979..H1170');
for k=1:num_Te_data
     Table_CCD_C_6_5(k,:)=(10^-6)*10.^[tempdata_6(k*4-3,:),tempdata_6(k*4-2,:),tempdata_6(k*4-1,:),tempdata_6(k*4,1:num_ne_data-24)];
end

n_e_data_CCD_C = n_e_data;
T_e_data_CCD_C = T_e_data;
global n_e_data_CCD_C T_e_data_CCD_C Table_CCD_C_1_0 Table_CCD_C_2_1 Table_CCD_C_3_2 Table_CCD_C_4_3 Table_CCD_C_5_4 Table_CCD_C_6_5;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange coefficient of H (1+->0)

num_ne_data=26; %numhr of electron density in the data table
num_Te_data=48; %numhr of electron temperature in the data table

temp_n_e=dlmread('ccd89_h.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H).  
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:2)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('ccd89_h.dat','','A7..H12');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('ccd89_h.dat','','A14..H205');%read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_CCD_H_1_0(k,:)=(10^-6)*10.^[tempdata_1(4*k-3,:),tempdata_1(4*k-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:2) ];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

n_e_data_CCD_H = n_e_data;
T_e_data_CCD_H = T_e_data;
global n_e_data_CCD_H T_e_data_CCD_H Table_CCD_H_1_0;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange coefficient of oxygen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=26; %numcr of electron density in the data table
num_Te_data=48; %numcr of electron temperature in the data table

temp_n_e=dlmread('ccd89_o.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data =(10^6)* 10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('ccd89_o.dat','','A7..H12');    %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('ccd89_o.dat','','A14..H205'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_CCD_O_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('ccd89_o.dat','','A207..H398');
for k=1:num_Te_data
     Table_CCD_O_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('ccd89_o.dat','','A400..H591');
for k=1:num_Te_data
     Table_CCD_O_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('ccd89_o.dat','','A593..H784');
for k=1:num_Te_data
     Table_CCD_O_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

tempdata_5=dlmread('ccd89_o.dat','','A786..H977');
for k=1:num_Te_data
     Table_CCD_O_5_4(k,:)=(10^-6)*10.^[tempdata_5(k*4-3,:),tempdata_5(k*4-2,:),tempdata_5(k*4-1,:),tempdata_5(k*4,1:num_ne_data-24)];
end

tempdata_6=dlmread('ccd89_o.dat','','A979..H1170');
for k=1:num_Te_data
     Table_CCD_O_6_5(k,:)=(10^-6)*10.^[tempdata_6(k*4-3,:),tempdata_6(k*4-2,:),tempdata_6(k*4-1,:),tempdata_6(k*4,1:num_ne_data-24)];
end

tempdata_7=dlmread('ccd89_o.dat','','A1172..H1363');
for k=1:num_Te_data
     Table_CCD_O_7_6(k,:)=(10^-6)*10.^[tempdata_7(k*4-3,:),tempdata_7(k*4-2,:),tempdata_7(k*4-1,:),tempdata_7(k*4,1:num_ne_data-24)];
end

tempdata_8=dlmread('ccd89_o.dat','','A1365..H1556');
for k=1:num_Te_data
     Table_CCD_O_8_7(k,:)=(10^-6)*10.^[tempdata_8(k*4-3,:),tempdata_8(k*4-2,:),tempdata_8(k*4-1,:),tempdata_8(k*4,1:num_ne_data-24)];
end

n_e_data_CCD_O = n_e_data;
T_e_data_CCD_O = T_e_data;
global n_e_data_CCD_O T_e_data_CCD_O Table_CCD_O_1_0 Table_CCD_O_2_1 Table_CCD_O_3_2 Table_CCD_O_4_3 Table_CCD_O_5_4 Table_CCD_O_6_5 Table_CCD_O_7_6 Table_CCD_O_8_7;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=26; %numcr of electron density in the data table
num_Te_data=48; %numcr of electron temperature in the data table

temp_n_e=dlmread('ccd89_n.dat','','A4..H7'); %read n_e datas of which number of column is eight(A~H).
n_e_data =(10^6)* 10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('ccd89_n.dat','','A8..H13');    %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('ccd89_n.dat','','A15..H206'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_CCD_N_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('ccd89_n.dat','','A208..H399');
for k=1:num_Te_data
     Table_CCD_N_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('ccd89_n.dat','','A401..H592');
for k=1:num_Te_data
     Table_CCD_N_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('ccd89_n.dat','','A594..H785');
for k=1:num_Te_data
     Table_CCD_N_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

tempdata_5=dlmread('ccd89_n.dat','','A787..H978');
for k=1:num_Te_data
     Table_CCD_N_5_4(k,:)=(10^-6)*10.^[tempdata_5(k*4-3,:),tempdata_5(k*4-2,:),tempdata_5(k*4-1,:),tempdata_5(k*4,1:num_ne_data-24)];
end

tempdata_6=dlmread('ccd89_n.dat','','A980..H1171');
for k=1:num_Te_data
     Table_CCD_N_6_5(k,:)=(10^-6)*10.^[tempdata_6(k*4-3,:),tempdata_6(k*4-2,:),tempdata_6(k*4-1,:),tempdata_6(k*4,1:num_ne_data-24)];
end

tempdata_7=dlmread('ccd89_n.dat','','A1173..H1364');
for k=1:num_Te_data
     Table_CCD_N_7_6(k,:)=(10^-6)*10.^[tempdata_7(k*4-3,:),tempdata_7(k*4-2,:),tempdata_7(k*4-1,:),tempdata_7(k*4,1:num_ne_data-24)];
end

n_e_data_CCD_N = n_e_data;
T_e_data_CCD_N = T_e_data;
global n_e_data_CCD_N T_e_data_CCD_N Table_CCD_N_1_0 Table_CCD_N_2_1 Table_CCD_N_3_2 Table_CCD_N_4_3 Table_CCD_N_5_4 Table_CCD_N_6_5 Table_CCD_N_7_6;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for total line radiation power coefficient of Be in each ionization stages(0, 1+, 2+, 3+)

num_ne_data=24; %number of electron density in the ADAS data table
num_Te_data=25; %number of electron temperature in the ADAS data table

temp_n_e=dlmread('plt96_be.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('plt96_be.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('plt96_be.dat','','A11..H85'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PLT_Be_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end
 tempdata_2=dlmread('plt96_be.dat','','A87..H161');
for k=1:num_Te_data
     Table_PLT_Be_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end
tempdata_3=dlmread('plt96_be.dat','','A163..H237');
for k=1:num_Te_data
     Table_PLT_Be_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end
tempdata_4=dlmread('plt96_be.dat','','A239..H313');
for k=1:num_Te_data
     Table_PLT_Be_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

n_e_data_PLT_Be = n_e_data;
T_e_data_PLT_Be = T_e_data;
global n_e_data_PLT_Be T_e_data_PLT_Be Table_PLT_Be_0 Table_PLT_Be_1 Table_PLT_Be_2 Table_PLT_Be_3;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for total line radiation power coefficient of C in each ionization stages(0, 1+, 2+, 3+, 4+, 5+)
num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('plt96_c.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data =(10^6)*10.^ [temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('plt96_c.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('plt96_c.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PLT_C_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('plt96_c.dat','','A102..H191');
for k=1:num_Te_data
     Table_PLT_C_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('plt96_c.dat','','A193..H282');
for k=1:num_Te_data
     Table_PLT_C_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('plt96_c.dat','','A284..H373');
for k=1:num_Te_data
     Table_PLT_C_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('plt96_c.dat','','A375..H464');
for k=1:num_Te_data
     Table_PLT_C_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('plt96_c.dat','','A466..H555');
for k=1:num_Te_data
     Table_PLT_C_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

n_e_data_PLT_C = n_e_data;
T_e_data_PLT_C = T_e_data;
global n_e_data_PLT_C T_e_data_PLT_C Table_PLT_C_0 Table_PLT_C_1 Table_PLT_C_2 Table_PLT_C_3 Table_PLT_C_4 Table_PLT_C_5;




clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for total line radiation power coefficient of H (1+)

num_ne_data=24; %numhr of electron density in the data table
num_Te_data=29; %numhr of electron temperature in the data table

temp_n_e=dlmread('plt96_h.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).  
n_e_data =(10^6)* 10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('plt96_h.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H).     
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('plt96_h.dat','','A11..H97'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PLT_H_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

global n_e_data_PLT_H;
n_e_data_PLT_H = n_e_data;
global T_e_data_PLT_H;
T_e_data_PLT_H = T_e_data;
global Table_PLT_H_0;
Table_PLT_H_0=Table_PLT_H_0;


clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for total line radiation powr coefficient of nitrogen in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+, 7+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('plt96_n.dat','','A4..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('plt96_n.dat','','A7..H10');  %read T_e datas of which number of column is eight(A~H) 
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('plt96_n.dat','','A12..H101'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PLT_N_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('plt96_n.dat','','A103..H192');
for k=1:num_Te_data
     Table_PLT_N_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('plt96_n.dat','','A194..H283');
for k=1:num_Te_data
     Table_PLT_N_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('plt96_n.dat','','A285..H374');
for k=1:num_Te_data
     Table_PLT_N_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('plt96_n.dat','','A376..H465');
for k=1:num_Te_data
     Table_PLT_N_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('plt96_n.dat','','A467..H556');
for k=1:num_Te_data
     Table_PLT_N_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('plt96_n.dat','','A558..H647');
for k=1:num_Te_data
     Table_PLT_N_6(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

n_e_data_PLT_N = n_e_data;
T_e_data_PLT_N = T_e_data;
global n_e_data_PLT_N T_e_data_PLT_N Table_PLT_N_0 Table_PLT_N_1 Table_PLT_N_2 Table_PLT_N_3 Table_PLT_N_4 Table_PLT_N_5 Table_PLT_N_6;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for total line radiation powr coefficient of oxygen in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+, 7+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('plt96_o.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('plt96_o.dat','','A6..H9');  %read T_e datas of which number of column is eight(A~H) 
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('plt96_o.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PLT_O_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('plt96_o.dat','','A102..H191');
for k=1:num_Te_data
     Table_PLT_O_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('plt96_o.dat','','A193..H282');
for k=1:num_Te_data
     Table_PLT_O_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('plt96_o.dat','','A284..H373');
for k=1:num_Te_data
     Table_PLT_O_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('plt96_o.dat','','A375..H464');
for k=1:num_Te_data
     Table_PLT_O_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('plt96_o.dat','','A466..H555');
for k=1:num_Te_data
     Table_PLT_O_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('plt96_o.dat','','A557..H646');
for k=1:num_Te_data
     Table_PLT_O_6(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

tempdata_8=dlmread('plt96_o.dat','','A648..H737');
for k=1:num_Te_data
     Table_PLT_O_7(k,:)=(10^-6)*10.^[tempdata_8(3*k-2,:),tempdata_8(3*k-1,:),tempdata_8(k*3,:)];
end


n_e_data_PLT_O = n_e_data;
T_e_data_PLT_O = T_e_data;
global n_e_data_PLT_O T_e_data_PLT_O Table_PLT_O_0 Table_PLT_O_1 Table_PLT_O_2 Table_PLT_O_3 Table_PLT_O_4 Table_PLT_O_5 Table_PLT_O_6 Table_PLT_O_7;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination and bremsstrahlung power coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=25; %number of electron temperature in the data table

temp_n_e=dlmread('prb96_be.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prb96_be.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prb96_be.dat','','A11..H85'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRB_Be_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prb96_be.dat','','A87..H161');
for k=1:num_Te_data
     Table_PRB_Be_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('prb96_be.dat','','A163..H237');
for k=1:num_Te_data
     Table_PRB_Be_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('prb96_be.dat','','A239..H313');
for k=1:num_Te_data
     Table_PRB_Be_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

n_e_data_PRB_Be = n_e_data;
T_e_data_PRB_Be = T_e_data;
global n_e_data_PRB_Be T_e_data_PRB_Be Table_PRB_Be_1_0 Table_PRB_Be_2_1 Table_PRB_Be_3_2 Table_PRB_Be_4_3;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination and bremsstrahlung power coefficient of C in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('prb96_c.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prb96_c.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prb96_c.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRB_C_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prb96_c.dat','','A102..H191');
for k=1:num_Te_data
     Table_PRB_C_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('prb96_c.dat','','A193..H282');
for k=1:num_Te_data
     Table_PRB_C_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('prb96_c.dat','','A284..H373');
for k=1:num_Te_data
     Table_PRB_C_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('prb96_c.dat','','A375..H464');
for k=1:num_Te_data
     Table_PRB_C_5_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('prb96_c.dat','','A466..H555');
for k=1:num_Te_data
     Table_PRB_C_6_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

n_e_data_PRB_C = n_e_data;
T_e_data_PRB_C = T_e_data;
global n_e_data_PRB_C T_e_data_PRB_C Table_PRB_C_1_0 Table_PRB_C_2_1 Table_PRB_C_3_2 Table_PRB_C_4_3 Table_PRB_C_5_4 Table_PRB_C_6_5;

clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination and bremsstrahlung power coefficient of H (1+->0)

num_ne_data=24; %numhr of electron density in the data table
num_Te_data=29; %numhr of electron temperature in the data table

temp_n_e=dlmread('prb96_h.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prb96_h.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H). 
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prb96_h.dat','','A11..H97');%read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRB_H_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

n_e_data_PRB_H = n_e_data;
T_e_data_PRB_H = T_e_data;
global n_e_data_PRB_H T_e_data_PRB_H Table_PRB_H_1_0;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination and bremsstrahlung power coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('prb96_n.dat','','A4..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prb96_n.dat','','A7..H10');   %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prb96_n.dat','','A12..H101'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRB_N_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prb96_n.dat','','A103..H192');
for k=1:num_Te_data
     Table_PRB_N_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('prb96_n.dat','','A194..H283');
for k=1:num_Te_data
     Table_PRB_N_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('prb96_n.dat','','A285..H374');
for k=1:num_Te_data
     Table_PRB_N_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('prb96_n.dat','','A376..H465');
for k=1:num_Te_data
     Table_PRB_N_5_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('prb96_n.dat','','A467..H556');
for k=1:num_Te_data
     Table_PRB_N_6_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('prb96_n.dat','','A558..H647');
for k=1:num_Te_data
     Table_PRB_N_7_6(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

n_e_data_PRB_N = n_e_data;
T_e_data_PRB_N = T_e_data;
global n_e_data_PRB_N T_e_data_PRB_N Table_PRB_N_1_0 Table_PRB_N_2_1 Table_PRB_N_3_2 Table_PRB_N_4_3 Table_PRB_N_5_4 Table_PRB_N_6_5 Table_PRB_N_7_6;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for recombination and bremsstrahlung power coefficient of oxygen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('prb96_o.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prb96_o.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prb96_o.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRB_O_1_0(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prb96_o.dat','','A102..H191');
for k=1:num_Te_data
     Table_PRB_O_2_1(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('prb96_o.dat','','A193..H282');
for k=1:num_Te_data
     Table_PRB_O_3_2(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('prb96_o.dat','','A284..H373');
for k=1:num_Te_data
     Table_PRB_O_4_3(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('prb96_o.dat','','A375..H464');
for k=1:num_Te_data
     Table_PRB_O_5_4(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('prb96_o.dat','','A466..H555');
for k=1:num_Te_data
     Table_PRB_O_6_5(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('prb96_o.dat','','A557..H646');
for k=1:num_Te_data
     Table_PRB_O_7_6(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

tempdata_8=dlmread('prb96_o.dat','','A648..H737');
for k=1:num_Te_data
     Table_PRB_O_8_7(k,:)=(10^-6)*10.^[tempdata_8(3*k-2,:),tempdata_8(3*k-1,:),tempdata_8(k*3,:)];
end

n_e_data_PRB_O = n_e_data;
T_e_data_PRB_O = T_e_data;
global n_e_data_PRB_O T_e_data_PRB_O Table_PRB_O_1_0 Table_PRB_O_2_1 Table_PRB_O_3_2 Table_PRB_O_4_3 Table_PRB_O_5_4 Table_PRB_O_6_5 Table_PRB_O_7_6 Table_PRB_O_8_7;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange power coefficient of Be in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+)

num_ne_data=26; %number of electron density in the data table
num_Te_data=48; %number of electron temperature in the data table

temp_n_e=dlmread('prc89_be.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.

temp_T_e=dlmread('prc89_be.dat','','A7..H12');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prc89_be.dat','','A14..H205'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRC_Be_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prc89_be.dat','','A207..H398');
for k=1:num_Te_data
     Table_PRC_Be_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('prc89_be.dat','','A400..H591');
for k=1:num_Te_data
     Table_PRC_Be_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('prc89_be.dat','','A593..H784');
for k=1:num_Te_data
     Table_PRC_Be_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

n_e_data_PRC_Be = n_e_data;
T_e_data_PRC_Be = T_e_data;
global n_e_data_PRC_Be T_e_data_PRC_Be Table_PRC_Be_1_0 Table_PRC_Be_2_1 Table_PRC_Be_3_2 Table_PRC_Be_4_3;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange power coefficient of C in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)

num_ne_data=26; %numcr of electron density in the data table
num_Te_data=48; %numcr of electron temperature in the data table

temp_n_e=dlmread('prc89_c.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prc89_c.dat','','A7..H12');  %read T_e datas of which number of column is eight(A~H).   
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prc89_c.dat','','A14..H205');%read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRC_C_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every four rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prc89_c.dat','','A207..H398');
for k=1:num_Te_data
     Table_PRC_C_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('prc89_c.dat','','A400..H591');
for k=1:num_Te_data
     Table_PRC_C_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('prc89_c.dat','','A593..H784');
for k=1:num_Te_data
     Table_PRC_C_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

tempdata_5=dlmread('prc89_c.dat','','A786..H977');
for k=1:num_Te_data
     Table_PRC_C_5_4(k,:)=(10^-6)*10.^[tempdata_5(k*4-3,:),tempdata_5(k*4-2,:),tempdata_5(k*4-1,:),tempdata_5(k*4,1:num_ne_data-24)];
end

tempdata_6=dlmread('prc89_c.dat','','A979..H1170');
for k=1:num_Te_data
     Table_PRC_C_6_5(k,:)=(10^-6)*10.^[tempdata_6(k*4-3,:),tempdata_6(k*4-2,:),tempdata_6(k*4-1,:),tempdata_6(k*4,1:num_ne_data-24)];
end

n_e_data_PRC_C = n_e_data;
T_e_data_PRC_C = T_e_data;
global n_e_data_PRC_C T_e_data_PRC_C Table_PRC_C_1_0 Table_PRC_C_2_1 Table_PRC_C_3_2 Table_PRC_C_4_3 Table_PRC_C_5_4 Table_PRC_C_6_5;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange power coefficient of H (1+->0)

num_ne_data=26; %numhr of electron density in the data table
num_Te_data=48; %numhr of electron temperature in the data table

temp_n_e=dlmread('prc89_h.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H). 
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:2)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('prc89_h.dat','','A7..H12');   %read T_e datas of which number of column is eight(A~H).  
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prc89_h.dat','','A14..H205');%read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRC_H_1_0(k,:)=(10^-6)*10.^[tempdata_1(4*k-3,:),tempdata_1(4*k-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:2) ];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

n_e_data_PRC_H = n_e_data;
T_e_data_PRC_H = T_e_data;
global n_e_data_PRC_H T_e_data_PRC_H Table_PRC_H_1_0;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange power coefficient of nitrogen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=26; %numcr of electron density in the data table
num_Te_data=48; %numcr of electron temperature in the data table

temp_n_e=dlmread('prc89_n.dat','','A4..H7'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitification of 10^. 
%write all the electron density data in one row.
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
temp_T_e=dlmread('prc89_n.dat','','A8..H13');   %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prc89_n.dat','','A15..H206'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRC_N_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prc89_n.dat','','A208..H399');
for k=1:num_Te_data
     Table_PRC_N_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('prc89_n.dat','','A401..H592');
for k=1:num_Te_data
     Table_PRC_N_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('prc89_n.dat','','A594..H785');
for k=1:num_Te_data
     Table_PRC_N_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

tempdata_5=dlmread('prc89_n.dat','','A787..H978');
for k=1:num_Te_data
     Table_PRC_N_5_4(k,:)=(10^-6)*10.^[tempdata_5(k*4-3,:),tempdata_5(k*4-2,:),tempdata_5(k*4-1,:),tempdata_5(k*4,1:num_ne_data-24)];
end

tempdata_6=dlmread('prc89_n.dat','','A980..H1171');
for k=1:num_Te_data
     Table_PRC_N_6_5(k,:)=(10^-6)*10.^[tempdata_6(k*4-3,:),tempdata_6(k*4-2,:),tempdata_6(k*4-1,:),tempdata_6(k*4,1:num_ne_data-24)];
end

tempdata_7=dlmread('prc89_n.dat','','A1173..H1364');
for k=1:num_Te_data
     Table_PRC_N_7_6(k,:)=(10^-6)*10.^[tempdata_7(k*4-3,:),tempdata_7(k*4-2,:),tempdata_7(k*4-1,:),tempdata_7(k*4,1:num_ne_data-24)];
end

n_e_data_PRC_N = n_e_data;
T_e_data_PRC_N = T_e_data;
global n_e_data_PRC_N T_e_data_PRC_N Table_PRC_N_1_0 Table_PRC_N_2_1 Table_PRC_N_3_2 Table_PRC_N_4_3 Table_PRC_N_5_4 Table_PRC_N_6_5 Table_PRC_N_7_6;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for charge exchange power coefficient of oxygen in each ionization stages(1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

num_ne_data=26; %numcr of electron density in the data table
num_Te_data=48; %numcr of electron temperature in the data table

temp_n_e=dlmread('prc89_o.dat','','A3..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:),temp_n_e(4,1:num_ne_data-24)];
%remove log10 in the data by mulitification of 10^. 
%write all the electron density data in one row.
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
temp_T_e=dlmread('prc89_o.dat','','A7..H12');   %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,:),temp_T_e(6,:)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('prc89_o.dat','','A14..H205'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_PRC_O_1_0(k,:)=(10^-6)*10.^[tempdata_1(k*4-3,:),tempdata_1(k*4-2,:),tempdata_1(k*4-1,:),tempdata_1(k*4,1:num_ne_data-24)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('prc89_o.dat','','A207..H398');
for k=1:num_Te_data
     Table_PRC_O_2_1(k,:)=(10^-6)*10.^[tempdata_2(k*4-3,:),tempdata_2(k*4-2,:),tempdata_2(k*4-1,:),tempdata_2(k*4,1:num_ne_data-24)];
end

tempdata_3=dlmread('prc89_o.dat','','A400..H591');
for k=1:num_Te_data
     Table_PRC_O_3_2(k,:)=(10^-6)*10.^[tempdata_3(k*4-3,:),tempdata_3(k*4-2,:),tempdata_3(k*4-1,:),tempdata_3(k*4,1:num_ne_data-24)];
end

tempdata_4=dlmread('prc89_o.dat','','A593..H784');
for k=1:num_Te_data
     Table_PRC_O_4_3(k,:)=(10^-6)*10.^[tempdata_4(k*4-3,:),tempdata_4(k*4-2,:),tempdata_4(k*4-1,:),tempdata_4(k*4,1:num_ne_data-24)];
end

tempdata_5=dlmread('prc89_o.dat','','A786..H977');
for k=1:num_Te_data
     Table_PRC_O_5_4(k,:)=(10^-6)*10.^[tempdata_5(k*4-3,:),tempdata_5(k*4-2,:),tempdata_5(k*4-1,:),tempdata_5(k*4,1:num_ne_data-24)];
end

tempdata_6=dlmread('prc89_o.dat','','A979..H1170');
for k=1:num_Te_data
     Table_PRC_O_6_5(k,:)=(10^-6)*10.^[tempdata_6(k*4-3,:),tempdata_6(k*4-2,:),tempdata_6(k*4-1,:),tempdata_6(k*4,1:num_ne_data-24)];
end

tempdata_7=dlmread('prc89_o.dat','','A1172..H1363');
for k=1:num_Te_data
     Table_PRC_O_7_6(k,:)=(10^-6)*10.^[tempdata_7(k*4-3,:),tempdata_7(k*4-2,:),tempdata_7(k*4-1,:),tempdata_7(k*4,1:num_ne_data-24)];
end

tempdata_8=dlmread('prc89_o.dat','','A1365..H1556');
for k=1:num_Te_data
     Table_PRC_O_8_7(k,:)=(10^-6)*10.^[tempdata_8(k*4-3,:),tempdata_8(k*4-2,:),tempdata_8(k*4-1,:),tempdata_8(k*4,1:num_ne_data-24)];
end

n_e_data_PRC_O = n_e_data;
T_e_data_PRC_O = T_e_data;
global n_e_data_PRC_O T_e_data_PRC_O Table_PRC_O_1_0 Table_PRC_O_2_1 Table_PRC_O_3_2 Table_PRC_O_4_3 Table_PRC_O_5_4 Table_PRC_O_6_5 Table_PRC_O_7_6 Table_PRC_O_8_7;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8

%interpolation function for ionization coefficient of Be in each ionization stages(0->1+,1+->2+,2+->3+,3+->4+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=25; %number of electron temperature in the data table

temp_n_e=dlmread('scd96_be.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('scd96_be.dat','','A6..H9');  %read T_e datas of which number of column is eight(A~H).   
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('scd96_be.dat','','A11..H85'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_SCD_Be_0_1(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
      %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
      %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

tempdata_2=dlmread('scd96_be.dat','','A87..H161');
for k=1:num_Te_data
     Table_SCD_Be_1_2(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('scd96_be.dat','','A163..H237');
for k=1:num_Te_data
     Table_SCD_Be_2_3(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('scd96_be.dat','','A239..H313');
for k=1:num_Te_data
     Table_SCD_Be_3_4(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

n_e_data_SCD_Be = n_e_data;
T_e_data_SCD_Be = T_e_data;
global n_e_data_SCD_Be T_e_data_SCD_Be Table_SCD_Be_0_1 Table_SCD_Be_1_2 Table_SCD_Be_2_3 Table_SCD_Be_3_4;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 

%interpolation function for ionization coefficient of C in each ionization stages(0->1+,1+->2+,2+->3+,3+->4+,4+->5+,5+->6+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('scd96_c.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data =(10^6)* 10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('scd96_c.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H).  
T_e_data =10.^ [temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('scd96_c.dat','','A11..H100'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_SCD_C_0_1(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('scd96_c.dat','','A102..H191');
for k=1:num_Te_data
     Table_SCD_C_1_2(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('scd96_c.dat','','A193..H282');
for k=1:num_Te_data
     Table_SCD_C_2_3(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('scd96_c.dat','','A284..H373');
for k=1:num_Te_data
     Table_SCD_C_3_4(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('scd96_c.dat','','A375..H464');
for k=1:num_Te_data
     Table_SCD_C_4_5(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('scd96_c.dat','','A466..H555');
for k=1:num_Te_data
     Table_SCD_C_5_6(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

n_e_data_SCD_C = n_e_data;
T_e_data_SCD_C = T_e_data;
global n_e_data_SCD_C T_e_data_SCD_C Table_SCD_C_0_1 Table_SCD_C_1_2 Table_SCD_C_2_3 Table_SCD_C_3_4 Table_SCD_C_4_5 Table_SCD_C_5_6;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 

%interpolation function for ionization coefficient of H (0->1+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=29; %number of electron temperature in the data table

temp_n_e=dlmread('scd96_h.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).  
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitiplication of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('scd96_h.dat','','A6..H9');    %read T_e datas of which number of column is eight(A~H). 
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('scd96_h.dat','','A11..H97'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_SCD_H_0_1(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

n_e_data_SCD_H = n_e_data;
T_e_data_SCD_H = T_e_data;
global n_e_data_SCD_H T_e_data_SCD_H Table_SCD_H_0_1;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1

%interpolation function for ionization coefficient of nitrogen in each ionization stages(0+->1+, 1+->2+, 2+->3+, 3+->4+, 4+->5+, 5+->6+, 6+->7+, 7+->8+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('scd96_n.dat','','A4..H6'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('scd96_n.dat','','A7..H10');   %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('scd96_n.dat','','A12..H101');  %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_SCD_N_0_1(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('scd96_n.dat','','A103..H192');
for k=1:num_Te_data
     Table_SCD_N_1_2(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('scd96_n.dat','','A194..H283');
for k=1:num_Te_data
     Table_SCD_N_2_3(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('scd96_n.dat','','A285..H374');
for k=1:num_Te_data
     Table_SCD_N_3_4(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('scd96_n.dat','','A376..H465');
for k=1:num_Te_data
     Table_SCD_N_4_5(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('scd96_n.dat','','A467..H556');
for k=1:num_Te_data
     Table_SCD_N_5_6(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('scd96_n.dat','','A558..H647');
for k=1:num_Te_data
     Table_SCD_N_6_7(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

n_e_data_SCD_N = n_e_data;
T_e_data_SCD_N = T_e_data;
global n_e_data_SCD_N T_e_data_SCD_N Table_SCD_N_0_1 Table_SCD_N_1_2 Table_SCD_N_2_3 Table_SCD_N_3_4 Table_SCD_N_4_5 Table_SCD_N_5_6 Table_SCD_N_6_7;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 

%interpolation function for ionization coefficient of oxygen in each ionization stages(0+->1+, 1+->2+, 2+->3+, 3+->4+, 4+->5+, 5+->6+, 6+->7+, 7+->8+)

num_ne_data=24; %number of electron density in the data table
num_Te_data=30; %number of electron temperature in the data table

temp_n_e=dlmread('scd96_o.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data = (10^6)*10.^[temp_n_e(1,:),temp_n_e(2,:),temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('scd96_o.dat','','A6..H9');   %read T_e datas of which number of column is eight(A~H)
T_e_data = 10.^[temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,1:num_Te_data-24)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('scd96_o.dat','','A11..H100');  %read coefficient datas of which number of column is eight(A~H).
for k=1:num_Te_data
     Table_SCD_O_0_1(k,:)=(10^-6)*10.^[tempdata_1(3*k-2,:),tempdata_1(3*k-1,:),tempdata_1(k*3,:)];
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

 tempdata_2=dlmread('scd96_o.dat','','A102..H191');
for k=1:num_Te_data
     Table_SCD_O_1_2(k,:)=(10^-6)*10.^[tempdata_2(3*k-2,:),tempdata_2(3*k-1,:),tempdata_2(k*3,:)];
end

tempdata_3=dlmread('scd96_o.dat','','A193..H282');
for k=1:num_Te_data
     Table_SCD_O_2_3(k,:)=(10^-6)*10.^[tempdata_3(3*k-2,:),tempdata_3(3*k-1,:),tempdata_3(k*3,:)];
end

tempdata_4=dlmread('scd96_o.dat','','A284..H373');
for k=1:num_Te_data
     Table_SCD_O_3_4(k,:)=(10^-6)*10.^[tempdata_4(3*k-2,:),tempdata_4(3*k-1,:),tempdata_4(k*3,:)];
end

tempdata_5=dlmread('scd96_o.dat','','A375..H464');
for k=1:num_Te_data
     Table_SCD_O_4_5(k,:)=(10^-6)*10.^[tempdata_5(3*k-2,:),tempdata_5(3*k-1,:),tempdata_5(k*3,:)];
end

tempdata_6=dlmread('scd96_o.dat','','A466..H555');
for k=1:num_Te_data
     Table_SCD_O_5_6(k,:)=(10^-6)*10.^[tempdata_6(3*k-2,:),tempdata_6(3*k-1,:),tempdata_6(k*3,:)];
end

tempdata_7=dlmread('scd96_o.dat','','A557..H646');
for k=1:num_Te_data
     Table_SCD_O_6_7(k,:)=(10^-6)*10.^[tempdata_7(3*k-2,:),tempdata_7(3*k-1,:),tempdata_7(k*3,:)];
end

tempdata_8=dlmread('scd96_o.dat','','A648..H737');
for k=1:num_Te_data
     Table_SCD_O_7_8(k,:)=(10^-6)*10.^[tempdata_8(3*k-2,:),tempdata_8(3*k-1,:),tempdata_8(k*3,:)];
end

n_e_data_SCD_O = n_e_data;
T_e_data_SCD_O = T_e_data;
global n_e_data_SCD_O T_e_data_SCD_O Table_SCD_O_0_1 Table_SCD_O_1_2 Table_SCD_O_2_3 Table_SCD_O_3_4 Table_SCD_O_4_5 Table_SCD_O_5_6 Table_SCD_O_6_7 Table_SCD_O_7_8;
clear num_ne_data num_Te_data temp_n_e n_e_data temp_T_e T_e_data tempdata_1 tempdata_2 tempdata_3 tempdata_4 tempdata_5 tempdata_6 tempdata_7 tempdata_8