function [Dn_He_0,Dn_He_1,Dn_He_2]=D_He_nse(n_e,T_e,T_i,n_H_0,n_He_0,n_He_1,n_He_2,Vp,Vv,VnD,VnHe,VnBe,VnC,VnN,VnO)
%time derivative matrix of Helium atom(or ion) density
Vv_coef_D=(Vv-Vp+VnD)/Vv;
Vv_coef_He=(Vv-Vp+VnHe)/Vv;
Vv_coef_Be=(Vv-Vp+VnBe)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;

[SCD_He_0_1,SCD_He_1_2]=SCD_He(n_e,T_e); % rate coefficient of ionization of beryllium atom
[ACD_He_1_0,ACD_He_2_1]=ACD_He(n_e,T_e); % rate coefficient of recombination of beryllium ion
[CCD_He_1_0,CCD_He_2_1]=CCD_He(n_e,T_i); % rate coefficient of charge exchange recombination of beryllium ion

n_He=[n_He_0,n_He_1,n_He_2] ;%Helium atom(or ion) density in each ionization stages(0, 1+, 2+)

coefM_He=[-(VnHe/(Vv_coef_He*Vv))*SCD_He_0_1,(Vp/(Vv_coef_He*Vv))*ACD_He_1_0+(VnD/(Vv_coef_He*Vv))*n_H_0/n_e*CCD_He_1_0,0;
     (VnHe/Vp)*SCD_He_0_1,-SCD_He_1_2-ACD_He_1_0-(VnD/Vp)*n_H_0/n_e*CCD_He_1_0,ACD_He_2_1+(VnD/Vp)*n_H_0/n_e*CCD_He_2_1;
     0,SCD_He_1_2,-ACD_He_2_1-(VnD/Vp)*n_H_0/n_e*CCD_He_2_1];
  %rate coefficient matrix including ionization, recombination, charge exchange of Helium atom(or ion) 
  %Hydrogen is considered as the only electron doner.

 Dn_He = n_e * coefM_He * n_He' ;%time derivative matrix of Helium atom(or ion) density
Dn_He_0=Dn_He(1);
Dn_He_1=Dn_He(2);
Dn_He_2=Dn_He(3);
end