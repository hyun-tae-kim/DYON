function P_CX_O_total=P_CX_O(n_e, T_i,n_H_0,n_O_1, n_O_2, n_O_3, n_O_4, n_O_5, n_O_6, n_O_7, n_O_8);
%oxygen ion power loss due to O ion charge exchange radiation 

[PRC_O_1_0,PRC_O_2_1,PRC_O_3_2, PRC_O_4_3, PRC_O_5_4, PRC_O_6_5, PRC_O_7_6, PRC_O_8_7]=PRC_O(n_e,T_i);
%O's charge exchange power coefficient matrix (1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)

P_CX_O_total = [PRC_O_1_0,PRC_O_2_1,PRC_O_3_2, PRC_O_4_3, PRC_O_5_4, PRC_O_6_5, PRC_O_7_6, PRC_O_8_7]*[n_O_1,n_O_2, n_O_3, n_O_4, n_O_5, n_O_6, n_O_7, n_O_8]' * n_H_0 ;
%O ion power loss due to O ion charge exchange radiation.
%hydrogen atom is considered as the only electron doner.