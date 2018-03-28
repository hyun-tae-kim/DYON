function P_rad_H_total=P_rad_H_nse(n_e, T_e,n_H_0,n_H_1,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%free electron power loss due to H radiation including excitation, recombination and bremsstrahlung.

[PLT_H_0]=PLT_H(n_e,T_e);
PLT_H_M=[PLT_H_0]; %H's line radiation power coefficient matrix
[PRB_H_1]=PRB_H(n_e,T_e);
PRB_H_M=[PRB_H_1] ;%H's recombination and bremsstrahlung radiation power coefficient matrix

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_H_0_1=1312*kjmol_ev*1.6*10^-19 ;%ionization energy for hydrogen atom
Eiz_H_M=[Eiz_H_0_1];

[ACD_H_1_0]=ACD_H(n_e,T_e);
ACD_H_M=[ACD_H_1_0]; %rate coefficient mairix for recombination of hydrogen

P_rad_H_total = sum(PLT_H_M *n_H_0 *n_e*(VnD/Vp) + PRB_H_M*n_H_1*n_e - ACD_H_M*Eiz_H_M * n_H_1 * n_e);
%electron power loss due to H radiation including excitation, recombination and bremsstrahlung.
%Since the amount of ionization potential in total radiation power is not from free electron's kinetic energy,
%ionization potential energy must be extracted from the total radiation power. 