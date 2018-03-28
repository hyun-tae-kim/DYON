function [Dn_Be_0,Dn_Be_1,Dn_Be_2,Dn_Be_3,Dn_Be_4]=D_Be_nse(n_e,T_e,T_i,n_H_0,n_Be_0,n_Be_1,n_Be_2,n_Be_3,n_Be_4,Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%time derivative matrix of beryllium atom(or ion) density
Vv_coef_D=(Vv-Vp+VnD)/Vv;
Vv_coef_Be=(Vv-Vp+VnBe)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;

[SCD_Be_0_1,SCD_Be_1_2,SCD_Be_2_3,SCD_Be_3_4]=SCD_Be(n_e,T_e); % rate coefficient of ionization of beryllium atom
[ACD_Be_1_0,ACD_Be_2_1,ACD_Be_3_2,ACD_Be_4_3]=ACD_Be(n_e,T_e); % rate coefficient of recombination of beryllium ion
[CCD_Be_1_0,CCD_Be_2_1,CCD_Be_3_2,CCD_Be_4_3]=CCD_Be(n_e,T_i); % rate coefficient of charge exchange recombination of beryllium ion

n_Be=[n_Be_0,n_Be_1,n_Be_2,n_Be_3,n_Be_4] ;%beryllium atom(or ion) density in each ionization stages(0, 1+, 2+, 3+, 4+)

coefM_Be=[-(VnBe/(Vv_coef_Be*Vv))*SCD_Be_0_1,(Vp/(Vv_coef_Be*Vv))*ACD_Be_1_0+(VnD/(Vv_coef_Be*Vv))*n_H_0/n_e*CCD_Be_1_0,0,0,0;
     (VnBe/Vp)*SCD_Be_0_1,-SCD_Be_1_2-ACD_Be_1_0-(VnD/Vp)*n_H_0/n_e*CCD_Be_1_0,ACD_Be_2_1+(VnD/Vp)*n_H_0/n_e*CCD_Be_2_1,0,0;
     0,SCD_Be_1_2,-SCD_Be_2_3-ACD_Be_2_1-(VnD/Vp)*n_H_0/n_e*CCD_Be_2_1,ACD_Be_3_2+(VnD/Vp)*n_H_0/n_e*CCD_Be_3_2,0;
     0,0,SCD_Be_2_3,- SCD_Be_3_4-ACD_Be_3_2-(VnD/Vp)*n_H_0/n_e*CCD_Be_3_2,ACD_Be_4_3+(VnD/Vp)*n_H_0/n_e*CCD_Be_4_3;
     0,0,0,SCD_Be_3_4,- ACD_Be_4_3-(VnD/Vp)*n_H_0/n_e*CCD_Be_4_3];
  %rate coefficient matrix including ionization, recombination, charge exchange of beryllium atom(or ion) 
  %Hydrogen is considered as the only electron doner.

 Dn_Be = n_e * coefM_Be * n_Be' ;%time derivative matrix of beryllium atom(or ion) density
Dn_Be_0=Dn_Be(1);
Dn_Be_1=Dn_Be(2);
Dn_Be_2=Dn_Be(3);
Dn_Be_3=Dn_Be(4);
Dn_Be_4=Dn_Be(5);
end