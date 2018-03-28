function P_rad_C_total=P_rad_C_nse(n_e, T_e,n_C_0,n_C_1, n_C_2, n_C_3, n_C_4,n_C_5,n_C_6,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%free electron power loss due to C radiation including excitation, recombination and bremsstrahlung.

[PLT_C_0,PLT_C_1,PLT_C_2,PLT_C_3,PLT_C_4,PLT_C_5]=PLT_C(n_e,T_e);
PLT_C_M=[PLT_C_0,PLT_C_1,PLT_C_2,PLT_C_3,PLT_C_4,PLT_C_5] ;%C's line radiation power coefficient matrix 
[PRB_C_1,PRB_C_2,PRB_C_3,PRB_C_4,PRB_C_5,PRB_C_6]=PRB_C(n_e,T_e);
PRB_C_M=[PRB_C_1,PRB_C_2,PRB_C_3,PRB_C_4,PRB_C_5,PRB_C_6] ;%C's recombination and bremsstrahlung radiation power coefficient matrix


kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_C_0_1=1086.5*kjmol_ev*1.6*10^-19; %ionization energy for carbon atom
Eiz_C_1_2=2352.6*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (1+ -> 2+)
Eiz_C_2_3=4620.5*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (2+ -> 3+)
Eiz_C_3_4=6222.7*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (3+ -> 4+)
Eiz_C_4_5=37831*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (4+ -> 5+)
Eiz_C_5_6=47277*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (5+ -> 6+)
Eiz_C_M=[Eiz_C_0_1,Eiz_C_1_2,Eiz_C_2_3,Eiz_C_3_4,Eiz_C_4_5,Eiz_C_5_6] ; %ionization energy matrix for carbon

[ACD_C_1_0,ACD_C_2_1,ACD_C_3_2,ACD_C_4_3,ACD_C_5_4,ACD_C_6_5] = ACD_C(n_e,T_e);
ACD_C_M = [ACD_C_1_0,ACD_C_2_1,ACD_C_3_2,ACD_C_4_3,ACD_C_5_4,ACD_C_6_5] ;%rate coefficient mairix for recombination of carbon 

P_rad_C_total = sum(PLT_C_M.*[(VnC/Vp)*n_C_0,n_C_1, n_C_2, n_C_3, n_C_4,n_C_5] * n_e + PRB_C_M.*[n_C_1, n_C_2, n_C_3, n_C_4,n_C_5,n_C_6] * n_e - ACD_C_M.*Eiz_C_M.*[n_C_1, n_C_2, n_C_3, n_C_4,n_C_5,n_C_6]  * n_e);
%electron power loss due to C radiation including excitation, recombination and bremsstrahlung.
%Since the amount of ionization potential in total radiation power is not from free electron's kinetic energy,
%ionization potential energy must be extracted from the total radiation power. 