function P_CX_Be_total=P_CX_Be(n_e, T_i,n_H_0,n_Be_1, n_Be_2, n_Be_3, n_Be_4);
%beryllium ion power loss due to Be charge exchange radiation 

[PRC_Be_1_0,PRC_Be_2_1,PRC_Be_3_2,PRC_Be_4_3]=PRC_Be(n_e,T_i); %Be's charge exchange power coefficient matrix (1+->0, 2+->1+, 3+->2+, 4+->3+)

P_CX_Be_total = [PRC_Be_1_0,PRC_Be_2_1,PRC_Be_3_2,PRC_Be_4_3]*[n_Be_1,n_Be_2, n_Be_3, n_Be_4]' * n_H_0 ;
%beryllium ion power loss due to Be charge exchange radiation.
%hydrogen atom is considered as the only electron doner.