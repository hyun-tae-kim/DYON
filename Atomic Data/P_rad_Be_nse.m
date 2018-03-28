function P_rad_Be_total=P_rad_Be_nse(n_e, T_e,n_Be_0,n_Be_1, n_Be_2, n_Be_3, n_Be_4,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%free electron power loss due to Be radiation including excitation, recombination and bremsstrahlung.

[PLT_Be_0,PLT_Be_1,PLT_Be_2,PLT_Be_3]=PLT_Be(n_e,T_e);

PLT_Be_M=[PLT_Be_0,PLT_Be_1,PLT_Be_2,PLT_Be_3] ;%Be's line radiation power coefficient matrix 

[PRB_Be_1,PRB_Be_2,PRB_Be_3,PRB_Be_4]=PRB_Be(n_e,T_e);

PRB_Be_M=[PRB_Be_1,PRB_Be_2,PRB_Be_3,PRB_Be_4]; %Be's recombination and bremsstrahlung radiation power coefficient matrix


kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_Be_0_1=899.5*kjmol_ev*1.6*10^-19; %ionization energy for beryllium atom
Eiz_Be_1_2=1757.1*kjmol_ev*1.6*10^-19; %ionization energy for beryllium ion (1+ -> 2+)
Eiz_Be_2_3=14848.7*kjmol_ev*1.6*10^-19; %ionization energy for beryllium ion (2+ -> 3+)
Eiz_Be_3_4=21006.6*kjmol_ev*1.6*10^-19; %ionization energy for beryllium ion (3+ -> 4+)
Eiz_Be_M=[Eiz_Be_0_1,Eiz_Be_1_2,Eiz_Be_2_3,Eiz_Be_3_4] ;%ionization energy matrix for beryllium

[ACD_Be_1_0,ACD_Be_2_1,ACD_Be_3_2,ACD_Be_4_3] = ACD_Be(n_e,T_e);
ACD_Be_M = [ACD_Be_1_0,ACD_Be_2_1,ACD_Be_3_2,ACD_Be_4_3]; %rate coefficient mairix for recombination of beryllium 

P_rad_Be_total = sum(PLT_Be_M.*[(VnBe/Vp)*n_Be_0,n_Be_1, n_Be_2, n_Be_3] * n_e + PRB_Be_M.*[n_Be_1, n_Be_2, n_Be_3, n_Be_4]  * n_e - ACD_Be_M.*Eiz_Be_M.*[n_Be_1, n_Be_2, n_Be_3, n_Be_4]  * n_e);
%electron power loss due to Be radiation including excitation, recombination and bremsstrahlung.
%Since the amount of ionization potential in total radiation power is not from free electron's kinetic energy,
%ionization potential energy must be extracted from the total radiation power. 