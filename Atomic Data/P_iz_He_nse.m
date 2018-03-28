function P_iz_He_total=P_iz_He_nse(n_e, T_e,n_He_0,n_He_1,Vp,Vv,VnD,VnHe,VnBe,VnC,VnN,VnO) %The amount of power to ionize Helium atom(or ion)

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]

Eiz_He_0_1=2372.3*kjmol_ev*1.6*10^-19; %ionization energy for Helium atom
Eiz_He_1_2=5250.5*kjmol_ev*1.6*10^-19; %ionization energy for Helium ion (1+ -> 2+)

[SCD_He_0_1,SCD_He_1_2]=SCD_He(n_e,T_e); %rate coefficient mairix for ionization of Helium 

SCD_He_M = [SCD_He_0_1,SCD_He_1_2];
Eiz_He_M = [Eiz_He_0_1,Eiz_He_1_2]; %ionization energy matrix for Helium
n_He = [(VnHe./Vp).*n_He_0, n_He_1]; %number density matrix of Helium (0, 1+)
P_iz_He_total = sum(SCD_He_M .* Eiz_He_M .* n_He * n_e) ;%The amount of power to ionize Helium 