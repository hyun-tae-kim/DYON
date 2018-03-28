function P_CX_H_total=P_CX_H(n_e, T_i,n_H_0,n_H_1);
%hydrogen ion power loss due to H charge exchange radiation 

PRC_H_1_0=PRC_H(n_e,T_i); 

P_CX_H_total = PRC_H_1_0 * n_H_1 * n_H_0 ;
%hydrogen ion power loss due to hydrogen charge exchange radiation.
%hydrogen atom is considered as the only electron doner.