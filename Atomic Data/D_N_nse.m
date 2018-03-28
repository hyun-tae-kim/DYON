function [Dn_N_0,Dn_N_1,Dn_N_2,Dn_N_3,Dn_N_4,Dn_N_5,Dn_N_6,Dn_N_7]...
    =D_N_nse(n_e,T_e,T_i,n_H_0,n_N_0,n_N_1,n_N_2,n_N_3,n_N_4,n_N_5,n_N_6,n_N_7,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%time derivative matrix of oxygen atom(or ion) density
Vv_coef_D=(Vv-Vp+VnD)/Vv;
Vv_coef_Be=(Vv-Vp+VnBe)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;

[SCD_N_0_1,SCD_N_1_2,SCD_N_2_3,SCD_N_3_4,SCD_N_4_5,SCD_N_5_6,SCD_N_6_7]=SCD_N(n_e,T_e); % rate coefficient of ionization of nitrogen atom
[ACD_N_1_0,ACD_N_2_1,ACD_N_3_2,ACD_N_4_3,ACD_N_5_4,ACD_N_6_5,ACD_N_7_6]=ACD_N(n_e,T_e); % rate coefficient of recombination of nitrogen ion
[CCD_N_1_0,CCD_N_2_1,CCD_N_3_2,CCD_N_4_3,CCD_N_5_4,CCD_N_6_5,CCD_N_7_6]=CCD_N(n_e,T_i); % rate coefficient of charge exchange recombination of nitrogen ion

 n_N=[n_N_0,n_N_1,n_N_2,n_N_3,n_N_4,n_N_5,n_N_6,n_N_7] ;%oxygen atom(or ion) density in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+, 7+, 8+)

coefM_N=[-VnN/(Vv_coef_N*Vv)*SCD_N_0_1,Vp/(Vv_coef_N*Vv)*ACD_N_1_0+(VnD/(Vv_coef_N*Vv))*n_H_0/n_e*CCD_N_1_0,0,0,0,0,0,0;
    (VnN/Vp)*SCD_N_0_1,-SCD_N_1_2-ACD_N_1_0-(VnD/Vp)*n_H_0/n_e*CCD_N_1_0,ACD_N_2_1+(VnD/Vp)*n_H_0/n_e*CCD_N_2_1,0,0,0,0,0;
    0, SCD_N_1_2,-SCD_N_2_3-ACD_N_2_1-(VnD/Vp)*n_H_0/n_e*CCD_N_2_1, ACD_N_3_2+(VnD/Vp)*n_H_0/n_e*CCD_N_3_2 0,0,0,0;
    0,0, SCD_N_2_3,-SCD_N_3_4-ACD_N_3_2-(VnD/Vp)*n_H_0/n_e*CCD_N_3_2, ACD_N_4_3+(VnD/Vp)*n_H_0/n_e*CCD_N_4_3,0,0,0;
    0,0,0, SCD_N_3_4,-SCD_N_4_5-ACD_N_4_3-(VnD/Vp)*n_H_0/n_e*CCD_N_4_3, ACD_N_5_4+(VnD/Vp)*n_H_0/n_e*CCD_N_5_4,0,0;
    0,0,0,0, SCD_N_4_5,-SCD_N_5_6-ACD_N_5_4-(VnD/Vp)*n_H_0/n_e*CCD_N_5_4, ACD_N_6_5+(VnD/Vp)*n_H_0/n_e*CCD_N_6_5,0;
    0,0,0,0,0, SCD_N_5_6,-SCD_N_6_7-ACD_N_6_5-(VnD/Vp)*n_H_0/n_e*CCD_N_6_5, ACD_N_7_6+(VnD/Vp)*n_H_0/n_e*CCD_N_7_6;
    0,0,0,0,0,0, SCD_N_6_7,-ACD_N_7_6-(VnD/Vp)*n_H_0/n_e*CCD_N_7_6];
%rate coefficient matrix including ionization, recombination, charge exchange of nitrogen atom(or ion).
%hydrogen is considered as the only electron doner.

 Dn_N = n_e * coefM_N * n_N' ;%time derivative matrix of oxygen atom(or ion) density
 Dn_N_0=Dn_N(1);
 Dn_N_1=Dn_N(2);
 Dn_N_2=Dn_N(3);
 Dn_N_3=Dn_N(4);
 Dn_N_4=Dn_N(5);
 Dn_N_5=Dn_N(6);
 Dn_N_6=Dn_N(7);
 Dn_N_7=Dn_N(8);

 
end