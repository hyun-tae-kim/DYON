num_ne_data=24; %number of electron density in the ADAS data table
num_Te_data=35; %number of electron temperature in the ADAS data table

temp_n_e=dlmread('pec_n1_568nm.dat','','A3..H5'); %read n_e datas of which number of column is eight(A~H).
n_e_data_PEC(:) = (10^6)*[temp_n_e(1,:), temp_n_e(2,:), temp_n_e(3,:)];
%remove log10 in the data by mulitification of 10^. 
%unit change by multiplication of (10^6) : [#/cm3->#/m3]
%write all the electron density data in one row.
temp_T_e=dlmread('pec_n1_568nm.dat','','A6..H10'); %read T_e datas of which number of column is eight(A~H).  
T_e_data_PEC = [temp_T_e(1,:),temp_T_e(2,:),temp_T_e(3,:),temp_T_e(4,:),temp_T_e(5,1:num_Te_data-32)];
%remove log10 in the data by mulitiplication of 10^. 
%write all the electron temperature data in one row.

tempdata_1=dlmread('pec_n1_568nm.dat','','A11..H130'); %read coefficient datas of which number of column is eight(A~H).
for k=1:num_ne_data;
Table_PEC_N_1(k,:)=(10^-6)*[tempdata_1(5*k-4,:),tempdata_1(5*k-3,:),tempdata_1(k*5-2,:),tempdata_1(k*5-1,:),tempdata_1(k*5,1:num_Te_data-32)]; 
     %because every three rows have the same electron temperature in the raw data txt file, 
     %write all the coef datas whose Te is the same in the same one row.
     %remove log10 in the data by mulitiplication of 10^ 
     %unit change by multiplication of (10^-6) : [cm3/sec->m3/sec]
end

%save n_e_data_PEC
%save T_e_data_PEC
%save Table_PEC_C_2

