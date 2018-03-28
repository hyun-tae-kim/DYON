function [Dn_C_0,Dn_C_1,Dn_C_2,Dn_C_3,Dn_C_4,Dn_C_5,Dn_C_6]=D_C_nse(n_e,T_e,T_i,n_H_0,n_C_0,n_C_1,n_C_2,n_C_3,n_C_4,n_C_5,n_C_6,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%time derivative matrix of carbon atom(or ion) density
Vv_coef_D=(Vv-Vp+VnD)/Vv;
Vv_coef_Be=(Vv-Vp+VnBe)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;

[SCD_C_0_1,SCD_C_1_2,SCD_C_2_3,SCD_C_3_4, SCD_C_4_5,SCD_C_5_6]=SCD_C(n_e,T_e); % rate coefficient of ionization of carbon atom
[ACD_C_1_0,ACD_C_2_1,ACD_C_3_2,ACD_C_4_3, ACD_C_5_4,ACD_C_6_5]=ACD_C(n_e,T_e); % rate coefficient of recombination of carbon ion
[CCD_C_1_0,CCD_C_2_1,CCD_C_3_2,CCD_C_4_3, CCD_C_5_4,CCD_C_6_5]=CCD_C(n_e,T_i); % rate coefficient of charge exchange recombination of carbon ion
    
n_C=[n_C_0,n_C_1,n_C_2,n_C_3,n_C_4,n_C_5,n_C_6] ;%beryllium atom(or ion) density in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+)

coefM_C=[ -(VnC/(Vv_coef_C*Vv))*SCD_C_0_1   , (Vp/(Vv_coef_C*Vv))*ACD_C_1_0+(VnD/(Vv_coef_C*Vv))*n_H_0/n_e*CCD_C_1_0,0,0,0,0,0;
    (VnC/Vp)*SCD_C_0_1, -SCD_C_1_2-ACD_C_1_0-(VnD/Vp)*n_H_0/n_e*CCD_C_1_0, ACD_C_2_1+(VnD/Vp)*n_H_0/n_e*CCD_C_2_1,0,0,0,0;
    0, SCD_C_1_2,-SCD_C_2_3-ACD_C_2_1-(VnD/Vp)*n_H_0/n_e*CCD_C_2_1, ACD_C_3_2+(VnD/Vp)*n_H_0/n_e*CCD_C_3_2, 0,0,0;
    0,0, SCD_C_2_3,-SCD_C_3_4-ACD_C_3_2-(VnD/Vp)*n_H_0/n_e*CCD_C_3_2, ACD_C_4_3+(VnD/Vp)*n_H_0/n_e*CCD_C_4_3,0,0;
    0,0,0, SCD_C_3_4,-SCD_C_4_5-ACD_C_4_3-(VnD/Vp)*n_H_0/n_e*CCD_C_4_3, ACD_C_5_4+(VnD/Vp)*n_H_0/n_e*CCD_C_5_4,0;
    0,0,0,0, SCD_C_4_5,-SCD_C_5_6-ACD_C_5_4-(VnD/Vp)*n_H_0/n_e*CCD_C_5_4, ACD_C_6_5+(VnD/Vp)*n_H_0/n_e*CCD_C_6_5;
    0,0,0,0,0, SCD_C_5_6,-ACD_C_6_5-(VnD/Vp)*n_H_0/n_e*CCD_C_6_5];
%rate coefficient matrix including ionization, recombination, charge exchange of carbon atom(or ion).
%hydrogen is considered as the only electron doner.
  
 Dn_C = n_e * coefM_C * n_C' ;%time derivative matrix of carbon atom(or ion) density
 Dn_C_0=Dn_C(1);
 Dn_C_1=Dn_C(2);
 Dn_C_2=Dn_C(3);
 Dn_C_3=Dn_C(4);
 Dn_C_4=Dn_C(5);
 Dn_C_5=Dn_C(6);
 Dn_C_6=Dn_C(7);
end