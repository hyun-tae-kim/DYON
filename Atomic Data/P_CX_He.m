function P_CX_He_total=P_CX_He(n_e, T_i,n_H_0,n_He_1, n_He_2);
%Helium ion power loss due to Helium charge exchange radiation 

[PRC_He_1_0,PRC_He_2_1]=PRC_He(n_e,T_i); %Helium's charge exchange power coefficient matrix (1+->0, 2+->1+)

P_CX_He_total = [PRC_He_1_0,PRC_He_2_1]*[n_He_1,n_He_2]' * n_H_0 ;
%Helium ion power loss due to Helium charge exchange radiation.
%hydrogen atom is considered as the only electron doner.