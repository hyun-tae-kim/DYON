function P_iz_N_total=P_iz_N_nse(n_e, T_e,n_N_0,n_N_1,n_N_2,n_N_3,n_N_4,n_N_5,n_N_6,Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ;%The amount of power to ionize nitrogen 

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]

Eiz_N_0_1=1402.3*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen atom
Eiz_N_1_2=2856 *kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (1+ -> 2+)
Eiz_N_2_3=4578.1*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (2+ -> 3+)
Eiz_N_3_4=7475 *kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (3+ -> 4+)
Eiz_N_4_5=9444.9*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (4+ -> 5+)
Eiz_N_5_6=53266.6*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (5+ -> 6+)
Eiz_N_6_7=64360*kjmol_ev*1.6*10^-19; %ionization energy for nitrogen ion (6+ -> 7+)

[SCD_N_0_1,SCD_N_1_2,SCD_N_2_3,SCD_N_3_4,SCD_N_4_5,SCD_N_5_6,SCD_N_6_7]=SCD_N(n_e,T_e); %rate coefficient mairix for ionization of nitrogen 

SCD_N_M = [SCD_N_0_1,SCD_N_1_2,SCD_N_2_3,SCD_N_3_4,SCD_N_4_5,SCD_N_5_6,SCD_N_6_7];
Eiz_N_M = [Eiz_N_0_1,Eiz_N_1_2,Eiz_N_2_3,Eiz_N_3_4,Eiz_N_4_5,Eiz_N_5_6,Eiz_N_6_7]; %ionization energy matrix for nitrogen
n_N = [(VnN/Vp)*n_N_0 , n_N_1 , n_N_2 , n_N_3 , n_N_4 , n_N_5 , n_N_6]; %number density matrix of nitrogen (0, 1+, 2+, 3+, 4+, 5+, 6+)
P_iz_N_total = sum(SCD_N_M .* Eiz_N_M .* n_N * n_e);%The amount of power to ionize nitrogen 