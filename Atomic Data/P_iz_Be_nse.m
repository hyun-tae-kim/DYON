function P_iz_Be_total=P_iz_Be_nse(n_e, T_e,n_Be_0,n_Be_1,n_Be_2,n_Be_3,Vp,Vv,VnD,VnBe,VnC,VnN,VnO); %The amount of power to ionize beryllium atom(or ion)

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]

Eiz_Be_0_1=899.5*kjmol_ev*1.6*10^-19; %ionization energy for beryllium atom
Eiz_Be_1_2=1757.1*kjmol_ev*1.6*10^-19; %ionization energy for beryllium ion (1+ -> 2+)
Eiz_Be_2_3=14848.7*kjmol_ev*1.6*10^-19; %ionization energy for beryllium ion (2+ -> 3+)
Eiz_Be_3_4=21006.6*kjmol_ev*1.6*10^-19; %ionization energy for beryllium ion (3+ -> 4+)


[SCD_Be_0_1,SCD_Be_1_2,SCD_Be_2_3,SCD_Be_3_4]=SCD_Be(n_e,T_e); %rate coefficient mairix for ionization of beryllium 

SCD_Be_M = [SCD_Be_0_1,SCD_Be_1_2,SCD_Be_2_3,SCD_Be_3_4];
Eiz_Be_M = [Eiz_Be_0_1,Eiz_Be_1_2,Eiz_Be_2_3,Eiz_Be_3_4]; %ionization energy matrix for beryllium
n_Be = [(VnBe./Vp).*n_Be_0,n_Be_1,n_Be_2,n_Be_3]; %number density matrix of beryllium (0, 1+, 2+, 3+)
P_iz_Be_total = sum(SCD_Be_M .* Eiz_Be_M .* n_Be * n_e) ;%The amount of power to ionize beryllium 