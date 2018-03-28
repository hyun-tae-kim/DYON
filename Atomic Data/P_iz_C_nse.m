function P_iz_C_total=P_iz_C_nse(n_e, T_e,n_C_0,n_C_1,n_C_2,n_C_3,n_C_4,n_C_5,Vp,Vv,VnD,VnBe,VnC,VnN,VnO); %The amount of power to ionize carbon 

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]


Eiz_C_0_1=1086.5*kjmol_ev*1.6*10^-19; %ionization energy for carbon atom
Eiz_C_1_2=2352.6*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (1+ -> 2+)
Eiz_C_2_3=4620.5*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (2+ -> 3+)
Eiz_C_3_4=6222.7*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (3+ -> 4+)
Eiz_C_4_5=37831*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (4+ -> 5+)
Eiz_C_5_6=47277*kjmol_ev*1.6*10^-19; %ionization energy for carbon ion (5+ -> 6+)


[SCD_C_0_1,SCD_C_1_2,SCD_C_2_3,SCD_C_3_4,SCD_C_4_5,SCD_C_5_6]=SCD_C(n_e,T_e); %rate coefficient mairix for ionization of carbon 

SCD_C_M = [SCD_C_0_1,SCD_C_1_2,SCD_C_2_3,SCD_C_3_4,SCD_C_4_5,SCD_C_5_6];
Eiz_C_M = [Eiz_C_0_1,Eiz_C_1_2,Eiz_C_2_3,Eiz_C_3_4,Eiz_C_4_5,Eiz_C_5_6]; %ionization energy matrix for carbon 
n_C = [(VnC/Vp)*n_C_0,n_C_1,n_C_2,n_C_3,n_C_4,n_C_5]; %number density matrix of beryllium (0, 1+, 2+, 3+, 4+, 5+)
P_iz_C_total = sum(SCD_C_M .* Eiz_C_M .* n_C * n_e) ;%The amount of power to ionize carbon 
