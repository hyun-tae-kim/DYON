function P_rad_He_total=P_rad_He_nse(n_e, T_e,n_He_0,n_He_1, n_He_2,Vp,Vv,VnD,VnHe,VnBe,VnC,VnN,VnO);
%free electron power loss due to He radiation including excitation, recombination and bremsstrahlung.

[PLT_He_0,PLT_He_1]=PLT_He(n_e,T_e);

PLT_He_M=[PLT_He_0,PLT_He_1] ;%He's line radiation power coefficient matrix 

[PRB_He_1,PRB_He_2]=PRB_He(n_e,T_e);

PRB_He_M=[PRB_He_1,PRB_He_2]; %He's recombination and bremsstrahlung radiation power coefficient matrix


kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_He_0_1=2372.3*kjmol_ev*1.6*10^-19; %ionization energy for Helium atom
Eiz_He_1_2=5250.5*kjmol_ev*1.6*10^-19; %ionization energy for Helium ion (1+ -> 2+)
Eiz_He_M=[Eiz_He_0_1,Eiz_He_1_2] ;%ionization energy matrix for Helium
[ACD_He_1_0,ACD_He_2_1] = ACD_He(n_e,T_e);
ACD_He_M = [ACD_He_1_0,ACD_He_2_1]; %rate coefficient mairix for recombination of Helium 

P_rad_He_total = sum(PLT_He_M.*[(VnHe/Vp)*n_He_0,n_He_1] * n_e + PRB_He_M.*[n_He_1, n_He_2]  * n_e - ACD_He_M.*Eiz_He_M.*[n_He_1, n_He_2]  * n_e);
%electron power loss due to He radiation including excitation, recombination and bremsstrahlung.
%Since the amount of ionization potential in total radiation power is not from free electron's kinetic energy,
%ionization potential energy must be extracted from the total radiation power. 