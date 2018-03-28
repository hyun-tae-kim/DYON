function P_rad_N_total=P_rad_N_nse(n_e, T_e,n_N_0,n_N_1, n_N_2, n_N_3, n_N_4,n_N_5,n_N_6,n_N_7,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%free electron power loss due to N radiation including excitation, recombination and bremsstrahlung.

[PLT_N_0,PLT_N_1,PLT_N_2,PLT_N_3,PLT_N_4,PLT_N_5,PLT_N_6]=PLT_N(n_e,T_e);
PLT_N_M=[PLT_N_0,PLT_N_1,PLT_N_2,PLT_N_3,PLT_N_4,PLT_N_5,PLT_N_6]; %N's line radiation power coefficient matrix
[PRB_N_1,PRB_N_2,PRB_N_3,PRB_N_4,PRB_N_5,PRB_N_6,PRB_N_7]=PRB_N(n_e,T_e);
PRB_N_M=[PRB_N_1,PRB_N_2,PRB_N_3,PRB_N_4,PRB_N_5,PRB_N_6,PRB_N_7] ;%N's recombination and bremsstrahlung radiation power coefficient matrix

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_N_0_1=1402.3*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen atom
Eiz_N_1_2=2856 *kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (1+ -> 2+)
Eiz_N_2_3=4578.1*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (2+ -> 3+)
Eiz_N_3_4=7475 *kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (3+ -> 4+)
Eiz_N_4_5=9444.9*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (4+ -> 5+)
Eiz_N_5_6=53266.6*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (5+ -> 6+)
Eiz_N_6_7=64360*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (6+ -> 7+)
Eiz_N_M=[Eiz_N_0_1,Eiz_N_1_2,Eiz_N_2_3,Eiz_N_3_4,Eiz_N_4_5,Eiz_N_5_6,Eiz_N_6_7]; %ionization energy matrix for oxygen

[ACD_N_1_0,ACD_N_2_1,ACD_N_3_2,ACD_N_4_3,ACD_N_5_4,ACD_N_6_5,ACD_N_7_6] = ACD_N(n_e,T_e);
ACD_N_M = [ACD_N_1_0,ACD_N_2_1,ACD_N_3_2,ACD_N_4_3,ACD_N_5_4,ACD_N_6_5,ACD_N_7_6]; %rate coefficient mairix for recombination of oxygen

P_rad_N_total = sum(PLT_N_M.*[(VnN/Vp)*n_N_0,n_N_1, n_N_2, n_N_3, n_N_4,n_N_5,n_N_6] * n_e + PRB_N_M.*[n_N_1, n_N_2, n_N_3, n_N_4,n_N_5,n_N_6,n_N_7] * n_e - ACD_N_M.*Eiz_N_M.*[n_N_1, n_N_2, n_N_3, n_N_4,n_N_5,n_N_6,n_N_7]  * n_e);
%electron power loss due to C radiation including excitation, recombination and bremsstrahlung.
%Since the amount of ionization potential in total radiation power is not from free electron's kinetic energy,
%ionization potential energy must be extracted from the total radiation power. 