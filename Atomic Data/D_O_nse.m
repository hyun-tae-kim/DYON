function [Dn_O_0,Dn_O_1,Dn_O_2,Dn_O_3,Dn_O_4,Dn_O_5,Dn_O_6,Dn_O_7,Dn_O_8]...
    =D_O_nse(n_e,T_e,T_i,n_H_0,n_O_0,n_O_1,n_O_2,n_O_3,n_O_4,n_O_5,n_O_6,n_O_7,n_O_8,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%time derivative matrix of oxygen atom(or ion) density
Vv_coef_D=(Vv-Vp+VnD)/Vv;
Vv_coef_Be=(Vv-Vp+VnBe)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;

[SCD_O_0_1,SCD_O_1_2,SCD_O_2_3,SCD_O_3_4, SCD_O_4_5,SCD_O_5_6,SCD_O_6_7,SCD_O_7_8]=SCD_O(n_e,T_e);% rate coefficient of ionization of oxygen atom
[ACD_O_1_0,ACD_O_2_1,ACD_O_3_2,ACD_O_4_3, ACD_O_5_4,ACD_O_6_5,ACD_O_7_6,ACD_O_8_7]=ACD_O(n_e,T_e);% rate coefficient of recombination of oxygen ion
[CCD_O_1_0,CCD_O_2_1,CCD_O_3_2,CCD_O_4_3, CCD_O_5_4,CCD_O_6_5,CCD_O_7_6,CCD_O_8_7]=CCD_O(n_e,T_i);
% rate coefficient of charge exchange recombination of oxygen ion

 n_O=[n_O_0,n_O_1,n_O_2,n_O_3,n_O_4,n_O_5,n_O_6,n_O_7,n_O_8] ;
 %oxygen atom(or ion) density in each ionization stages(0, 1+, 2+, 3+, 4+, 5+, 6+, 7+, 8+)

coefM_O=[-VnO/(Vv_coef_O*Vv)*SCD_O_0_1,Vp/(Vv_coef_O*Vv)*ACD_O_1_0+(VnD/(Vv_coef_O*Vv))*n_H_0/n_e*CCD_O_1_0,0,0,0,0,0,0,0;
    (VnO/Vp)*SCD_O_0_1,-SCD_O_1_2-ACD_O_1_0-(VnD/Vp)*n_H_0/n_e*CCD_O_1_0,ACD_O_2_1+(VnD/Vp)*n_H_0/n_e*CCD_O_2_1,0,0,0,0,0,0;
    0,SCD_O_1_2,-SCD_O_2_3-ACD_O_2_1-(VnD/Vp)*n_H_0/n_e*CCD_O_2_1,ACD_O_3_2+(VnD/Vp)*n_H_0/n_e*CCD_O_3_2,0,0,0,0,0;
    0,0,SCD_O_2_3,-SCD_O_3_4-ACD_O_3_2-(VnD/Vp)*n_H_0/n_e*CCD_O_3_2,ACD_O_4_3+(VnD/Vp)*n_H_0/n_e*CCD_O_4_3,0,0,0,0;
    0,0,0,SCD_O_3_4,-SCD_O_4_5-ACD_O_4_3-(VnD/Vp)*n_H_0/n_e*CCD_O_4_3,ACD_O_5_4+(VnD/Vp)*n_H_0/n_e*CCD_O_5_4,0,0,0;
    0,0,0,0,SCD_O_4_5,-SCD_O_5_6-ACD_O_5_4-(VnD/Vp)*n_H_0/n_e*CCD_O_5_4,ACD_O_6_5+(VnD/Vp)*n_H_0/n_e*CCD_O_6_5,0,0;
    0,0,0,0,0,SCD_O_5_6,-SCD_O_6_7-ACD_O_6_5-(VnD/Vp)*n_H_0/n_e*CCD_O_6_5,ACD_O_7_6+(VnD/Vp)*n_H_0/n_e*CCD_O_7_6,0;
    0,0,0,0,0,0,SCD_O_6_7,-SCD_O_7_8-ACD_O_7_6-(VnD/Vp)*n_H_0/n_e*CCD_O_7_6,ACD_O_8_7+(VnD/Vp)*n_H_0/n_e*CCD_O_8_7;
    0,0,0,0,0,0,0,SCD_O_7_8,-ACD_O_8_7-(VnD/Vp)*n_H_0/n_e*CCD_O_8_7];
%rate coefficient matrix including ionization, recombination, charge exchange of oxygen atom(or ion).
%hydrogen is considered as the only electron doner.

 Dn_O = n_e * coefM_O * n_O' ;%time derivative matrix of oxygen atom(or ion) density
 Dn_O_0=Dn_O(1);
 Dn_O_1=Dn_O(2);
 Dn_O_2=Dn_O(3);
 Dn_O_3=Dn_O(4);
 Dn_O_4=Dn_O(5);
 Dn_O_5=Dn_O(6);
 Dn_O_6=Dn_O(7);
 Dn_O_7=Dn_O(8);
 Dn_O_8=Dn_O(9);
 
end