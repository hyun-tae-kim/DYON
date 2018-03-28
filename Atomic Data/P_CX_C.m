function P_CX_C_total=P_CX_C(n_e, T_i,n_H_0,n_C_1, n_C_2, n_C_3, n_C_4, n_C_5, n_C_6);
%carbon ion power loss due to C ion charge exchange radiation 

[PRC_C_1_0,PRC_C_2_1,PRC_C_3_2,PRC_C_4_3, PRC_C_5_4, PRC_C_6_5]=PRC_C(n_e,T_i); %C's charge exchange power coefficient matrix (1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)

P_CX_C_total = [PRC_C_1_0,PRC_C_2_1,PRC_C_3_2,PRC_C_4_3, PRC_C_5_4, PRC_C_6_5]*[n_C_1, n_C_2, n_C_3, n_C_4, n_C_5, n_C_6]' * n_H_0 ;
%C ion power loss due to C ion charge exchange radiation.
%hydrogen atom is considered as the only electron doner.