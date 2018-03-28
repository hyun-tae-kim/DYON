function P_iz_O_total=P_iz_O_nse(n_e, T_e,n_O_0,n_O_1,n_O_2,n_O_3,n_O_4,n_O_5,n_O_6,n_O_7,Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ;%The amount of power to ionize oxygen 

kjmol_ev=1.0368e-002; %coefficient for energy unit correction [kj/mol-> eV]
 

Eiz_O_0_1=1313.9*kjmol_ev*1.6*10^-19; %ionization energy for oxygen atom
Eiz_O_1_2=3388.3 *kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (1+ -> 2+)
Eiz_O_2_3=5300.5*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (2+ -> 3+)
Eiz_O_3_4=7469.2 *kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (3+ -> 4+)
Eiz_O_4_5=10989.5*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (4+ -> 5+)
Eiz_O_5_6=13326.5*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (5+ -> 6+)
Eiz_O_6_7=71330*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (6+ -> 7+)
Eiz_O_7_8=84078.0*kjmol_ev*1.6*10^-19; %ionization energy for oxygen ion (7+ -> 8+)

[SCD_O_0_1,SCD_O_1_2,SCD_O_2_3,SCD_O_3_4,SCD_O_4_5,SCD_O_5_6,SCD_O_6_7,SCD_O_7_8]=SCD_O(n_e,T_e); %rate coefficient mairix for ionization of oxygen 

SCD_O_M = [SCD_O_0_1,SCD_O_1_2,SCD_O_2_3,SCD_O_3_4,SCD_O_4_5,SCD_O_5_6,SCD_O_6_7,SCD_O_7_8];
Eiz_O_M = [Eiz_O_0_1,Eiz_O_1_2,Eiz_O_2_3,Eiz_O_3_4,Eiz_O_4_5,Eiz_O_5_6,Eiz_O_6_7,Eiz_O_7_8]; %ionization energy matrix for oxygen
n_O = [(VnO/Vp)*n_O_0,n_O_1,n_O_2,n_O_3,n_O_4,n_O_5,n_O_6,n_O_7]; %number density matrix of oxygen (0, 1+, 2+, 3+, 4+, 5+, 6+, 7+)
P_iz_O_total = sum(SCD_O_M .* Eiz_O_M .* n_O * n_e);%The amount of power to ionize oxygen 