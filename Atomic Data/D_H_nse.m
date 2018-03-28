function [Dn_H_0,Dn_H_1]=D_H_nse(n_e ,T_e,T_i, n_H_0, n_H_1, ...
    n_Be_1, n_Be_2, n_Be_3, n_Be_4, ...
    n_C_1, n_C_2, n_C_3, n_C_4, n_C_5, n_C_6, ...
    n_N_1, n_N_2, n_N_3, n_N_4, n_N_5, n_N_6, n_N_7, ...
    n_O_1, n_O_2, n_O_3, n_O_4, n_O_5, n_O_6, n_O_7, n_O_8,...
    Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%time derivative matrix of hydrogen atom(or ion) density
Vv_coef_D=(Vv-Vp+VnD)/Vv;
Vv_coef_Be=(Vv-Vp+VnBe)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;


[SCD_H_0_1] = SCD_H(n_e,T_e); % rate coefficient of ionization of hydrogen atom
[ACD_H_1_0] = ACD_H(n_e,T_e); % rate coefficient of recombination of hydrogen ion
[CCD_H_1_0] = CCD_H(n_e,T_i); % rate coefficient of charge exchange recombination of hydrogen ion
 
[CCD_Be_1_0, CCD_Be_2_1, CCD_Be_3_2, CCD_Be_4_3] = CCD_Be(n_e,T_i); 
%rate coefficient of charge exchange recombination of beryllium (1+->0, 2+->1+, 3+->2+, 4+->3+)
N_CCD_Be = [n_Be_1,n_Be_2,n_Be_3,n_Be_4]*[CCD_Be_1_0, CCD_Be_2_1, CCD_Be_3_2, CCD_Be_4_3]' ;
%beryllium ion's density of each ionization stages times Be's CCD (in this case, hydrogen atom is only considered as electron doner.) 

[CCD_C_1_0, CCD_C_2_1, CCD_C_3_2, CCD_C_4_3, CCD_C_5_4, CCD_C_6_5] = CCD_C(n_e,T_i); 
%rate coefficient of charge exchange recombination of carbon (1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+)
N_CCD_C = [ n_C_1, n_C_2, n_C_3, n_C_4, n_C_5, n_C_6]*[CCD_C_1_0, CCD_C_2_1, CCD_C_3_2, CCD_C_4_3, CCD_C_5_4, CCD_C_6_5]' ;
%carbon ion's density of each ionization stages times C's CCD (in this case, hydrogen atom is only considered as electron doner.) 

[CCD_N_1_0, CCD_N_2_1, CCD_N_3_2, CCD_N_4_3, CCD_N_5_4, CCD_N_6_5,CCD_N_7_6] = CCD_N(n_e,T_i) ;
%rate coefficient of charge exchange recombination of nitrogen (1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+)
N_CCD_N = [ n_N_1, n_N_2, n_N_3, n_N_4, n_N_5, n_N_6, n_N_7] ...
    *[CCD_N_1_0, CCD_N_2_1, CCD_N_3_2, CCD_N_4_3, CCD_N_5_4, CCD_N_6_5, CCD_N_7_6]';
%nitrogen ion's density of each ionization stages times N's CCD 

[CCD_O_1_0, CCD_O_2_1, CCD_O_3_2, CCD_O_4_3, CCD_O_5_4, CCD_O_6_5,CCD_O_7_6,CCD_O_8_7] = CCD_O(n_e,T_i) ;
%rate coefficient of charge exchange recombination of oxygen (1+->0, 2+->1+, 3+->2+, 4+->3+, 5+->4+, 6+->5+, 7+->6+, 8+->7+)
N_CCD_O = [ n_O_1, n_O_2, n_O_3, n_O_4, n_O_5, n_O_6, n_O_7, n_O_8] ...
    *[CCD_O_1_0, CCD_O_2_1, CCD_O_3_2, CCD_O_4_3, CCD_O_5_4, CCD_O_6_5, CCD_O_7_6, CCD_O_8_7]';
%oxygen ion's density of each ionization stages times O's CCD 
%hydrogen atom is considered as the only electron doner.) 

coefM_H=[ -VnD/(Vv_coef_D*Vv)*(SCD_H_0_1+N_CCD_Be/n_e+N_CCD_C/n_e+N_CCD_N/n_e+N_CCD_O/n_e),Vp/(Vv_coef_D*Vv)*ACD_H_1_0; %
             (VnD/Vp)*(SCD_H_0_1+N_CCD_Be/n_e+N_CCD_C/n_e+N_CCD_N/n_e+N_CCD_O/n_e),-ACD_H_1_0] ;
         %rate coefficient matrix including ionization, recombination, charge exchange of hydrogen atom(or ion) 
 

 Dn_H = n_e * coefM_H * [n_H_0,n_H_1]'; %time derivative matrix of hydrogen atom(or ion) density
 Dn_H_0=Dn_H(1);
 Dn_H_1=Dn_H(2);
end