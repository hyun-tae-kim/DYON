function P_CX_N_total=P_CX_N(n_e, T_i,n_H_0,n_N_1, n_N_2, n_N_3, n_N_4, n_N_5, n_N_6, n_N_7);
%nitrogen ion power loss due to O ion charge exchange radiation 

[PRC_N_1_0,PRC_N_2_1,PRC_N_3_2, PRC_N_4_3, PRC_N_5_4, PRC_N_6_5, PRC_N_7_6]=PRC_N(n_e,T_i);
%N's charge exchange power coefficient matrix (1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

P_CX_N_total = [PRC_N_1_0,PRC_N_2_1,PRC_N_3_2, PRC_N_4_3, PRC_N_5_4, PRC_N_6_5, PRC_N_7_6]*[n_N_1,n_N_2, n_N_3, n_N_4, n_N_5, n_N_6, n_N_7]' * n_H_0 ;
%N ion power loss due to O ion charge exchange radiation.
%hydrogen atom is considered as the only electron doner.