function P_iz_H_total=P_iz_H_nse(n_e,T_e,n_H_0,Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ;%The amount of power to ionize Hydrogen atom 

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
Eiz_H_0_1=1312*kjmol_ev*1.6*10^-19; %ionization energy for hydrogen atom


[SCD_H_0_1]=SCD_H(n_e,T_e); %rate coefficient for ionization of hydrogen atom 0+ > 1+

SCD_H_M = [SCD_H_0_1]; 
Eiz_H_M = [Eiz_H_0_1];
n_H = [n_H_0];%number density of hydrogen atom
P_iz_H_total = (VnD./Vp).*sum(SCD_H_M .* Eiz_H_M .* n_H .* n_e) ;%The amount of power to ionize Hydrogen atom 