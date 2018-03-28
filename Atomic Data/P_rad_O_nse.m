function P_rad_O_total=P_rad_O_nse(n_e, T_e,n_O_0,n_O_1, n_O_2, n_O_3, n_O_4,n_O_5,n_O_6,n_O_7,n_O_8,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%free electron power loss due to O radiation including excitation, recombination and bremsstrahlung.

[PLT_O_0,PLT_O_1,PLT_O_2,PLT_O_3,PLT_O_4,PLT_O_5,PLT_O_6,PLT_O_7]=PLT_O(n_e,T_e);
PLT_O_M=[PLT_O_0,PLT_O_1,PLT_O_2,PLT_O_3,PLT_O_4,PLT_O_5,PLT_O_6,PLT_O_7]; %O's line radiation power coefficient matrix
[PRB_O_1,PRB_O_2,PRB_O_3,PRB_O_4,PRB_O_5,PRB_O_6,PRB_O_7,PRB_O_8]=PRB_O(n_e,T_e);
PRB_O_M=[PRB_O_1,PRB_O_2,PRB_O_3,PRB_O_4,PRB_O_5,PRB_O_6,PRB_O_7,PRB_O_8] ;%O's recombination and bremsstrahlung radiation power coefficient matrix

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_O_0_1=1313.9*kjmol_ev*1.6*10^-19; %ionization energy for oxygen atom
Eiz_O_1_2=3388.3 *kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (1+ -> 2+)
Eiz_O_2_3=5300.5*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (2+ -> 3+)
Eiz_O_3_4=7469.2 *kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (3+ -> 4+)
Eiz_O_4_5=10989.5*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (4+ -> 5+)
Eiz_O_5_6=13326.5*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (5+ -> 6+)
Eiz_O_6_7=71330*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (6+ -> 7+)
Eiz_O_7_8=84078.0*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (7+ -> 8+)
Eiz_O_M=[Eiz_O_0_1,Eiz_O_1_2,Eiz_O_2_3,Eiz_O_3_4,Eiz_O_4_5,Eiz_O_5_6,Eiz_O_6_7,Eiz_O_7_8]; %ionization energy matrix for oxygen

[ACD_O_1_0,ACD_O_2_1,ACD_O_3_2,ACD_O_4_3,ACD_O_5_4,ACD_O_6_5,ACD_O_7_6,ACD_O_8_7] = ACD_O(n_e,T_e);
ACD_O_M = [ACD_O_1_0,ACD_O_2_1,ACD_O_3_2,ACD_O_4_3,ACD_O_5_4,ACD_O_6_5,ACD_O_7_6,ACD_O_8_7]; %rate coefficient mairix for recombination of oxygen

P_rad_O_total = sum(PLT_O_M.*[(VnO/Vp)*n_O_0,n_O_1, n_O_2, n_O_3, n_O_4,n_O_5,n_O_6,n_O_7] * n_e + PRB_O_M.*[n_O_1, n_O_2, n_O_3, n_O_4,n_O_5,n_O_6,n_O_7,n_O_8] * n_e - ACD_O_M.*Eiz_O_M.*[n_O_1, n_O_2, n_O_3, n_O_4,n_O_5,n_O_6,n_O_7,n_O_8]  * n_e);
%electron power loss due to C radiation including excitation, recombination and bremsstrahlung.
%Since the amount of ionization potential in total radiation power is not from free electron's kinetic energy,
%ionization potential energy must be extracted from the total radiation power. 