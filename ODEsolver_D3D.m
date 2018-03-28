function Dy=ODEsolver_D3D(t,y);

%T_e : y(1)
%T_i : y(2)
%I_p : y(3)
%n_e : y(4) 
%n_i : y(5)

%n_H_0 : y(6)
%n_H_1 : y(7)

%n_Be_0 : y(8)
%n_Be_1 : y(9)
%n_Be_2 : y(10)
%n_Be_3 : y(11)
%n_Be_4 : y(12)

%n_C_0 : y(13)
%n_C_1 : y(14)
%n_C_2 : y(15)
%n_C_3 : y(16)
%n_C_4 : y(17)
%n_C_5 : y(18)
%n_C_6 : y(19)

%n_N_0 : y(20)
%n_N_1 : y(21)
%n_N_2 : y(22)
%n_N_3 : y(23)
%n_N_4 : y(24)
%n_N_5 : y(25)
%n_N_6 : y(26)
%n_N_7 : y(27)

%n_O_0 : y(28)
%n_O_1 : y(29)
%n_O_2 : y(30)
%n_O_3 : y(31)
%n_O_4 : y(32)
%n_O_5 : y(33)
%n_O_6 : y(34)
%n_O_7 : y(35)
%n_O_8 : y(36)
%Imk2 : y(37)



%% In this cell, the values indicate experimental datas and corresponding times in 77210 JET shot .

global W_coef1 W_coef2 t_Drecycling Gas_puffing Btoroidal Volume_Vacuum amu EM MU0 e0 Qe ln_lambda T_0 Lmk2 Rmk2 M_p_mk2
global t_D3D V_D3D Area_D3D R_D3D a_D3D P_ECH t_ECH Lp Iref %Bpoloidal_r Bpoloidal_z 

V_loop=interp1(t_D3D,V_D3D,t,'linear') ; %12.58512552; 
R_major=R_D3D; %interp1(t_D3D,R_D3D,t,'linear');
r_minor=a_D3D; %interp1(t_D3D,a_D3D,t,'linear');
Area=Area_D3D; %interp1(t_D3D,Area_D3D,t,'linear');
Vp=Area * 2 * pi * R_major;
Vv=Volume_Vacuum ;%vessel volume

%% sputtering yield and recycling coefficients


%t_Drecycling=0.1; %reference time in D recycling model
Sputtering_ObyO = 1.00 ;%recycling coefficient for oxygen atom per oxygen ion 
Sputtering_CbyO=1; %carbon sputtering yield due to oxygen ion bombardment
Sputtering_CbyD=0 ;%0.03; %carbon sputtering yield due to deuterium ion bombardment
Sputtering_DbyD = W_coef1-W_coef2*(1-exp(-t/t_Drecycling)); 
%rec_cor*tau_p_D/y(7)*(SXB_H(y(4),y(1))*10000*Dalpha*2/r_minor) ;
%recycling coefficient for deuterium atom per deuterium ion 
Sputtering_CbyC = 1;
Sputtering_NbyN = 1;

E_incident = 2*y(2)+3*y(1); % ion kinetic energy + sheath potential energy gain

%Be Yield factor calculation. Sublimation energy is assumed to be 3.38[eV]
%Q_BeD=3.38^(-2/3) *  1.633 *4^(2/3)*(1+4^(2/3))^(1/3) * (2^(5/6)*9^(1/6))/11*(0.15+0.05*4.5)/(1+0.05*4.5^1.6)
%Q_BeBe=3.38^(-2/3) *  1.633 *4^(2/3) *4^(2/3)*(4^(2/3)+4^(2/3))^(1/3)*0.5*0.2/1.05 

if E_incident >= 1e10%29 %BeO 29 Be 10;
E_TF_Be_D = 444; % BeO 444 Be 282;  %Thomas-Fermi energy for deuterium ion bombardment on beryllium wall
Q_yield_Be_D=0.13; %BeO 0.13 Be 0.22; % ;% yield factor for deuterium ion bombardment on beryllium wall
E_threshold_Be_D=29 ;% BeO 29 Be 10 %; %threshold energy for deuterium ion bombardment on beryllium wall
E_delta_Be_D=E_threshold_Be_D/E_incident;
E_reduced_Be_D = E_incident / E_TF_Be_D;
stopping_Be_D = (3.441*sqrt(E_reduced_Be_D)*log(E_reduced_Be_D+2.718))...
    /(1+6.355*sqrt(E_reduced_Be_D)+E_reduced_Be_D*(6.882*sqrt(E_reduced_Be_D)-1.708)) ;
%nuclear stoppiong cross section for deuterium ion bombardment on beryllium wall
gfunction_Be_D=(1-E_delta_Be_D^(2/3))*(1-E_delta_Be_D)^2;
Sputtering_BebyD =Q_yield_Be_D * stopping_Be_D * gfunction_Be_D; 
else
Sputtering_BebyD = 0;
end

if E_incident >=1e10%23;
E_TF_Be_Be = 2208; %Thomas-Fermi energy for beryllim ion bombardment on beryllium wall
Q_yield_Be_Be= 0.77; %; % 1.4; yield factor for beryllium ion bombardment on beryllium wall
E_threshold_Be_Be=23; %; %threshold energy for beryllium ion bombardment on beryllium wall
E_delta_Be_Be=E_threshold_Be_Be/E_incident;
E_reduced_Be_Be = E_incident / E_TF_Be_Be;
stopping_Be_Be =(3.441*sqrt(E_reduced_Be_Be)*log(E_reduced_Be_Be+2.718))...
    /(1+6.355*sqrt(E_reduced_Be_Be)+E_reduced_Be_Be*(6.882*sqrt(E_reduced_Be_Be)-1.708)) ;
%nuclear stoppiong cross section for beryllium ion bombardment on beryllium wall
gfunction_Be_Be=(1-E_delta_Be_Be^(2/3))*(1-E_delta_Be_Be)^2;
Sputtering_BebyBe = Q_yield_Be_Be * stopping_Be_Be * gfunction_Be_Be; 
else
  Sputtering_BebyBe=0;
end

if E_incident >=1e10%40;
E_TF_Be_C = 4152; %Thomas-Fermi energy for carbon ion bombardment on beryllium wall
Q_yield_Be_C= 1.6; %; % 1.4; yield factor for carbon ion bombardment on beryllium wall
E_threshold_Be_C=40; %; %threshold energy for carbon ion bombardment on beryllium wall
E_delta_Be_C=E_threshold_Be_C/E_incident;
E_reduced_Be_C = E_incident / E_TF_Be_C;
stopping_Be_C =(3.441*sqrt(E_reduced_Be_C)*log(E_reduced_Be_C+2.718))...
    /(1+6.355*sqrt(E_reduced_Be_C)+E_reduced_Be_C*(6.882*sqrt(E_reduced_Be_C)-1.708)) ;
%nuclear stoppiong cross section for carbon ion bombardment on beryllium wall
gfunction_Be_C=(1-E_delta_Be_C^(2/3))*(1-E_delta_Be_C)^2;
Sputtering_BebyC = Q_yield_Be_C * stopping_Be_C * gfunction_Be_C; 
else
  Sputtering_BebyC=0;
end



if E_incident >=  1e10%70; %BeO 67 Be 70
E_TF_Be_O = 6970; %BeO 9088 Be 6970; %Thomas-Fermi energy for oxygen ion bombardment on beryllium wall
Q_yield_Be_O=1.3; %BeO 1.25 Be 1.3 ; % yield factor for oxygen ion bombardment on beryllium wall
E_threshold_Be_O=70; %BeO 67 Be 70; %threshold energy for oxygen ion bombardment on beryllium wall
E_delta_Be_O=E_threshold_Be_O/E_incident;
E_reduced_Be_O = E_incident / E_TF_Be_O;
stopping_Be_O = (3.441*sqrt(E_reduced_Be_O)*log(E_reduced_Be_O+2.718))...
    /(1+6.355*sqrt(E_reduced_Be_O)+E_reduced_Be_O*(6.882*sqrt(E_reduced_Be_O)-1.708)) ;
%nuclear stoppiong cross section for oxygen ion bombardment on beryllium wall
gfunction_Be_O=(1-E_delta_Be_O^(2/3))*(1-E_delta_Be_O)^2;
Sputtering_BebyO = Q_yield_Be_O * stopping_Be_O * gfunction_Be_O; 
else
Sputtering_BebyO = 0;
end



%% confinement time

%Bp_r=interp1(t_D3D,Bpoloidal_r,t,'linear');
%Bp_z=interp1(t_D3D,Bpoloidal_z,t,'linear');
Bz=8e-5; %Tesla to match L_connection = 1000m  %sqrt(Bp_r^2 +Bp_z^2);%vertical field due to the P4 coil and eddy current
L_connection=0.25*r_minor*Btoroidal/Bz*exp(y(3)/Iref);%effective connection length

vBohm=2/r_minor/16*y(1)/Btoroidal;% mean speed for Bohm diffusion 
%lambda_ii=1e16*y(2)^2/y(5);%mean free path for ion-ion collision 
Cs_D=(Qe*(y(1)+y(2))/(2*amu))^0.5; %Hydrogen isotope ion sound speed

tau_p_D = 1/((vBohm/r_minor)+(Cs_D/L_connection)); % Hydrogen isotope particle confinement time
tau_p_C = tau_p_D; % Carbon ion confinement time
tau_p_Be= tau_p_D; % Beryllium ion confinement time
tau_p_N= tau_p_D; % Nitrogen ion confinement time
tau_p_O= tau_p_D; % Oxygen ion confinement time
tau_e = tau_p_D;  %electron energy confinement time

%% neutral screening effect
vD0=(3*Qe*T_0/(2*amu))^0.5; %Deuterium atom velocity
vBe0=(3*Qe*T_0/(9*amu))^0.5; %Deuterium atom velocity
vC0=(3*Qe*T_0/(12*amu))^0.5; %Carbon atom velocity
vN0=(3*Qe*T_0/(14*amu))^0.5; %Nitrogen atom velocity
vO0=(3*Qe*T_0/(16*amu))^0.5; %Oxygen atom velocity
mfp_D=vD0/(y(4)*SCD_H(y(4),y(1))); %mfp_D is Deuterium atom's mean free path for electron impact ionization. 
mfp_Be=vBe0/(y(4)*SCD_Be(y(4),y(1))); %mfp_Be is Beryllium atom's mean free path for electron impact ionization. 
mfp_C=vC0/(y(4)*SCD_C(y(4),y(1))); %mfp_C is Carbon atom's mean free path for electron impact ionization. 
mfp_N=vN0/(y(4)*SCD_N(y(4),y(1))); %mfp_C is Oxygen atom's mean free path for electron impact ionization. 
mfp_O=vO0/(y(4)*SCD_O(y(4),y(1))); %mfp_C is Oxygen atom's mean free path for electron impact ionization. 

if mfp_D >= r_minor;  %no neutral screening effect for deuterium atom
VnD = Vp ;
else %neutral screening effect if deuteriu atom is ionized before escaping from plasma volume
VnD = Vp*(1-(r_minor-mfp_D)^2/r_minor^2); 
end

if mfp_Be >= r_minor;  %no neutral screening effect for beryllium atom
VnBe = Vp ;
else %neutral screening effect if beryllium atom is ionized before escaping from plasma volume
VnBe = Vp*(1-(r_minor-mfp_Be)^2/r_minor^2); 
    %VnBe = 2 *mfp_Be*Vp/r_minor; 
end

if mfp_C >= r_minor;  %no neutral screening effect for carbon atom
VnC = Vp ;
else %neutral screening effect if carbon atom is ionized before escaping from plasma volume
VnC = Vp*(1-(r_minor-mfp_C)^2/r_minor^2);
end

if mfp_N >= r_minor;  %no neutral screening effect for nitrogen atom
VnN = Vp ;
else %neutral screening effect if nitrogen atom is ionized before escaping from plasma volume
VnN = Vp*(1-(r_minor-mfp_N)^2/r_minor^2);
end

if mfp_O >= r_minor;  %no neutral screening effect for oxygen atom
VnO = Vp ;
else %neutral screening effect if oxygen atom is ionized before escaping from plasma volume
VnO = Vp*(1-(r_minor-mfp_O)^2/r_minor^2);
end

Vv_coef_D=(Vv-Vp+VnD)/Vv; 
Vv_coef_Be=(Vv-Vp+VnD)/Vv;
Vv_coef_C=(Vv-Vp+VnC)/Vv;
Vv_coef_N=(Vv-Vp+VnN)/Vv;
Vv_coef_O=(Vv-Vp+VnO)/Vv;
%Neutral volume coefficient. Vv*Vv_coef indicates the total neutral volume including the neutral volume within plasma volume

%% plasma resistance, inductance, and z effective
Zeff=(y(7)+y(9)*1+y(10)*4+y(11)*9+y(12)*16 ...
    +y(14)+y(15)*4+y(16)*9+y(17)*16+y(18)*25+y(19)*36 ...
    +y(21)+y(22)*4+y(23)*9+y(24)*16+y(25)*25+y(26)*36+y(27)*49 ...
    +y(29)+y(30)*4+y(31)*9+y(32)*16+y(33)*25+y(34)*36+y(35)*49+y(36)*64)/y(4);
Rp=(2.0*pi*R_major)/(Area)*(0.51*EM^0.5*Qe^2.0*ln_lambda)/(3*e0^2*(2*pi*Qe*y(1))^1.5)*Zeff;
%plasma resistance due to electron-ion collision(Spitzer-Harm resistivity)  


%% Ohmic heating power density and electron power loss densities

P_oh = y(3)^2 * Rp / Vp; %ohmic power input
 
P_iz = P_iz_H_nse(y(4), y(1),y(6),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_iz_Be_nse(y(4), y(1),y(8),y(9),y(10),y(11),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_iz_C_nse(y(4), y(1),y(13),y(14),y(15),y(16),y(17),y(18),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_iz_N_nse(y(4), y(1),y(20),y(21),y(22),y(23),y(24),y(25),y(26),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...;
    + P_iz_O_nse(y(4), y(1),y(28),y(29),y(30),y(31),y(32),y(33),y(34),y(35),Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%P_iz is electron power loss due to ionization.

P_rad = P_rad_H_nse(y(4), y(1),y(6),y(7),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_rad_Be_nse(y(4), y(1),y(8),y(9), y(10), y(11), y(12),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_rad_C_nse(y(4), y(1),y(13),y(14), y(15), y(16), y(17),y(18),y(19),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_rad_N_nse(y(4), y(1),y(20),y(21), y(22), y(23), y(24),y(25),y(26),y(27),Vp,Vv,VnD,VnBe,VnC,VnN,VnO) ...
    + P_rad_O_nse(y(4), y(1),y(28),y(29), y(30), y(31), y(32),y(33),y(34),y(35),y(36),Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
%P_rad is total electron power loss due to radiation including excitation, recombination, and bremstrahlung.

P_equi = 7.75*10^-34 * (y(1)-y(2)) * y(4) *  ln_lambda / y(1)^1.5 * (y(7)/2 ...
    + (1*y(9)  + 4*y(10) + 9*y(11)+ 16*y(12))/9 ...
    + (1*y(14) + 4*y(15) + 9*y(16)+ 16*y(17)+25*y(18) + 36*y(19))/12 ...
    + (1*y(21) + 4*y(22) + 9*y(23)+ 16*y(24)+25*y(25) + 36*y(26) + 49 * y(27))/14 ...
    + (1*y(29) + 4*y(30) + 9*y(31)+ 16*y(32)+25*y(33) + 36*y(34) + 49 * y(35)+ 64*y(36))/16); 
%electron power loss for equilibration

P_econ = 3 / 2  *y(4) * Qe * y(1) / tau_e ; 
%electron power loss for transport losses. energy confinement time is the same with that of electron

%ECH power, which start at t=t_ECH

if t < t_ECH
P_add= P_ECH    ;
else
P_add = 0;
end
P_e = P_oh + P_add/Vp - P_iz - P_rad - P_equi - P_econ ; %net electorn power  

%% ion power loss densities
[CCD_H_1_0]=CCD_H(y(4),y(2));
[CCD_Be_1_0,CCD_Be_2_1,CCD_Be_3_2,CCD_Be_4_3]=CCD_Be(y(4),y(2));
CCD_Be_M=[CCD_Be_1_0,CCD_Be_2_1,CCD_Be_3_2,CCD_Be_4_3];
[CCD_C_1_0,CCD_C_2_1,CCD_C_3_2,CCD_C_4_3,CCD_C_5_4,CCD_C_6_5]=CCD_C(y(4),y(2));
CCD_C_M=[CCD_C_1_0,CCD_C_2_1,CCD_C_3_2,CCD_C_4_3,CCD_C_5_4,CCD_C_6_5];
[CCD_N_1_0,CCD_N_2_1,CCD_N_3_2,CCD_N_4_3,CCD_N_5_4,CCD_N_6_5,CCD_N_7_6]=CCD_N(y(4),y(2));
CCD_N_M=[CCD_N_1_0,CCD_N_2_1,CCD_N_3_2,CCD_N_4_3,CCD_N_5_4,CCD_N_6_5,CCD_N_7_6];
[CCD_O_1_0,CCD_O_2_1,CCD_O_3_2,CCD_O_4_3,CCD_O_5_4,CCD_O_6_5,CCD_O_7_6,CCD_O_8_7]=CCD_O(y(4),y(2));
CCD_O_M=[CCD_O_1_0,CCD_O_2_1,CCD_O_3_2,CCD_O_4_3,CCD_O_5_4,CCD_O_6_5,CCD_O_7_6,CCD_O_8_7];
%charge exchange reaction rate

P_CX = (VnD/Vp)*(1.5*Qe*(y(2)-T_0)*y(6)*(CCD_H_1_0*y(7)+CCD_Be_1_0*y(9)+CCD_C_1_0*y(14)+CCD_N_1_0*y(21)+CCD_O_1_0*y(29)));
%ion power loss due to charge exchange between hydrogen atom and ions.
%Radiation power loss and the fast ion's kinetic energy are included. 
%Fast ion and slow atom are exchanged. The slow atom's energy is ignored.

P_icon_H = 1.5 .* y(7) .* Qe .* y(2)./ tau_p_D;%Hydrogen ion power loss for transport losses
P_icon_Be_1=1.5 .* y(9) .* Qe .* y(2)./ tau_p_Be;  %Beryllium 1+ ion power loss for transport losses
P_icon_Be_2=1.5 .* y(10) .* Qe .* y(2)./ tau_p_Be;  %Beryllium 2+ ion power loss for transport losses
P_icon_Be_3=1.5 .* y(11) .* Qe .* y(2)./ tau_p_Be;  %Beryllium 3+ ion power loss for transport losses
P_icon_Be_4=1.5 .* y(12) .* Qe .* y(2)./ tau_p_Be;  %Beryllium 4+ ion power loss for transport losses
P_icon_C_1=1.5 .* y(14) .* Qe .* y(2)./ tau_p_C;  %Carbon 1+ ion power loss for transport losses
P_icon_C_2=1.5 .* y(15) .* Qe .* y(2)./ tau_p_C; %Carbon 2+ ion power loss for transport losses
P_icon_C_3=1.5 .* y(16) .* Qe .* y(2)./ tau_p_C; %Carbon 3+ ion power loss for transport losses
P_icon_C_4=1.5 .* y(17) .* Qe .* y(2)./ tau_p_C; %Carbon 4+ ion power loss for transport losses
P_icon_C_5=1.5 .* y(18) .* Qe .* y(2)./ tau_p_C; %Carbon 5+ ion power loss for transport losses
P_icon_C_6=1.5 .* y(19) .* Qe .* y(2)./ tau_p_C; %Carbon 6+ ion power loss for transport losses
P_icon_N_1=1.5 .* y(21) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 1+ ion power loss for transport losses
P_icon_N_2=1.5 .* y(22) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 2+ ion power loss for transport losses
P_icon_N_3=1.5 .* y(23) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 3+ ion power loss for transport losses
P_icon_N_4=1.5 .* y(24) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 4+ ion power loss for transport losses
P_icon_N_5=1.5 .* y(25) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 5+ ion power loss for transport losses
P_icon_N_6=1.5 .* y(26) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 6+ ion power loss for transport losses
P_icon_N_7=1.5 .* y(27) .* Qe .* y(2)./ tau_p_N;  %Nitrogen 7+ ion power loss for transport losses
P_icon_O_1=1.5 .* y(29) .* Qe .* y(2)./ tau_p_O;  %Oxygen 1+ ion power loss for transport losses
P_icon_O_2=1.5 .* y(30) .* Qe .* y(2)./ tau_p_O;  %Oxygen 2+ ion power loss for transport losses
P_icon_O_3=1.5 .* y(31) .* Qe .* y(2)./ tau_p_O;  %Oxygen 3+ ion power loss for transport losses
P_icon_O_4=1.5 .* y(32) .* Qe .* y(2)./ tau_p_O;  %Oxygen 4+ ion power loss for transport losses
P_icon_O_5=1.5 .* y(33) .* Qe .* y(2)./ tau_p_O;  %Oxygen 5+ ion power loss for transport losses
P_icon_O_6=1.5 .* y(34) .* Qe .* y(2)./ tau_p_O;  %Oxygen 6+ ion power loss for transport losses
P_icon_O_7=1.5 .* y(35) .* Qe .* y(2)./ tau_p_O;  %Oxygen 7+ ion power loss for transport losses
P_icon_O_8=1.5 .* y(36) .* Qe .* y(2)./ tau_p_O;  %Oxygen 8+ ion power loss for transport losses

P_icon=P_icon_H ...
    +P_icon_Be_1+P_icon_Be_2+P_icon_Be_3 +P_icon_Be_4 ...
    +P_icon_C_1+P_icon_C_2+P_icon_C_3+P_icon_C_4+P_icon_C_5+P_icon_C_6 ...
    +P_icon_N_1+P_icon_N_2+P_icon_N_3+P_icon_N_4+P_icon_N_5+P_icon_N_6+P_icon_N_7 ...
    +P_icon_O_1+P_icon_O_2+P_icon_O_3+P_icon_O_4+P_icon_O_5+P_icon_O_6+P_icon_O_7+P_icon_O_8;
%ion power loss for transport losses. energy confinement time is the same with that of electron

P_i = P_equi - P_CX - P_icon ; %net ion power

%% particle balance

[Dn_H_0,Dn_H_1] = D_H_nse(y(4) ,y(1), y(2),y(6), y(7), ...
    y(9), y(10), y(11), y(12), ...
    y(14), y(15), y(16), y(17), y(18),y(19), ...
    y(21),y(22),y(23),y(24),y(25),y(26),y(27), ...
    y(29),y(30),y(31),y(32),y(33),y(34),y(35),y(36), ...
    Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
Dn_H_M = [Dn_H_0,Dn_H_1];
%Dn_H_M(1) is time derivative of hydrogen atom density and Dn_H(2) is time derivative of hydrogen ion density in coronal equilibrium.

[Dn_Be_0,Dn_Be_1,Dn_Be_2,Dn_Be_3,Dn_Be_4] ...
    = D_Be_nse(y(4),y(1),y(2),y(6), y(8),y(9),y(10),y(11),y(12),Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
Dn_Be_M = [Dn_Be_0,Dn_Be_1,Dn_Be_2,Dn_Be_3,Dn_Be_4];
%Dn_Be_M(1) is time derivative of beryllium atom density 
%and Dn_Be_M(2) is time derivative of beryllium 1+ ion density, and so on,in coronal equilibrium. 

[Dn_C_0,Dn_C_1,Dn_C_2,Dn_C_3,Dn_C_4,Dn_C_5,Dn_C_6] ...
    = D_C_nse(y(4),y(1),y(2),y(6),y(13),y(14),y(15),y(16),y(17),y(18),y(19),Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
Dn_C_M = [Dn_C_0,Dn_C_1,Dn_C_2,Dn_C_3,Dn_C_4,Dn_C_5,Dn_C_6];
%Dn_C_M(1) is time derivative of carbon atom density 
%and Dn_C_M(2) is time derivative of carbon 1+ ion density, and so on, in coronal equilibrium.

[Dn_N_0,Dn_N_1,Dn_N_2,Dn_N_3,Dn_N_4,Dn_N_5,Dn_N_6,Dn_N_7] ...
    = D_N_nse(y(4),y(1),y(2),y(6),y(20),y(21),y(22),y(23),y(24),y(25),y(26),y(27),Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
Dn_N_M = [Dn_N_0,Dn_N_1,Dn_N_2,Dn_N_3,Dn_N_4,Dn_N_5,Dn_N_6,Dn_N_7];
%Dn_N_M(1) is time derivative of nitrogen atom density 
%and Dn_N_M(2) is time derivative of nitrogen 1+ ion density, and so on, in coronal equilibrium.

[Dn_O_0,Dn_O_1,Dn_O_2,Dn_O_3,Dn_O_4,Dn_O_5,Dn_O_6,Dn_O_7,Dn_O_8]...
    = D_O_nse(y(4),y(1),y(2),y(6),y(28),y(29),y(30),y(31),y(32),y(33),y(34),y(35),y(36),Vp,Vv,VnD,VnBe,VnC,VnN,VnO);
Dn_O_M = [Dn_O_0,Dn_O_1,Dn_O_2,Dn_O_3,Dn_O_4,Dn_O_5,Dn_O_6,Dn_O_7,Dn_O_8];
%Dn_O_M(1) is time derivative of oxygen atom density 
%and Dn_O_M(2) is time derivative of oxygen 1+ ion density, and so on, in coronal equilibrium.

Dn_H_M_tr=[Dn_H_M(1) + Vp/(Vv_coef_D*Vv)*(Sputtering_DbyD*y(7)/tau_p_D)+ Gas_puffing/(Vv_coef_D*Vv);
Dn_H_M(2) - y(7)/tau_p_D ]; %Differentiation matrix of deuterium atom and ion in transport influenced coronal equilibrium.

Dn_Be_M_tr = [Dn_Be_M(1) + Vp/(Vv_coef_Be*Vv)*Sputtering_BebyD*y(7)/tau_p_D ...
    + Vp/(Vv_coef_Be*Vv)*Sputtering_BebyBe*(y(9)+y(10)+y(11)+y(12))/tau_p_Be ...
    + Vp/(Vv_coef_Be*Vv)*Sputtering_BebyC*(y(14)+y(15)+y(16)+y(17)+y(18)+y(19))/tau_p_C ...
    + Vp/(Vv_coef_Be*Vv)*Sputtering_BebyO*(y(29)+y(30)+y(31)+y(32)+y(33)+y(34)+y(35)+y(36))/tau_p_O; 
Dn_Be_M(2) - y(9)/tau_p_Be;
Dn_Be_M(3) - y(10)/tau_p_Be;
Dn_Be_M(4) - y(11)/tau_p_Be;
Dn_Be_M(5) - y(12)/tau_p_Be];%Differentiation matrix of carbon atom and ion in transport influenced coronal equilibrium.

Dn_C_M_tr=[Dn_C_M(1)+ Vp/(Vv_coef_C*Vv)*Sputtering_CbyC*(y(14)+y(15)+y(16)+y(17)+y(18)+y(19))/tau_p_C ;
Dn_C_M(2) - y(14)/tau_p_C;
Dn_C_M(3) - y(15)/tau_p_C;
Dn_C_M(4) - y(16)/tau_p_C;
Dn_C_M(5) - y(17)/tau_p_C;
Dn_C_M(6) - y(18)/tau_p_C;
Dn_C_M(7) - y(19)/tau_p_C];%Differentiation matrix of carbon atom and ion in transport influenced coronal equilibrium.

Dn_N_M_tr=[Dn_N_M(1)+ Vp/(Vv_coef_N*Vv)*Sputtering_NbyN*(y(21)+y(22)+y(23)+y(24)+y(25)+y(26)+y(27))/tau_p_N;
Dn_N_M(2) - y(21)/tau_p_N;
Dn_N_M(3) - y(22)/tau_p_N;
Dn_N_M(4) - y(23)/tau_p_N;
Dn_N_M(5) - y(24)/tau_p_N;
Dn_N_M(6) - y(25)/tau_p_N;
Dn_N_M(7) - y(26)/tau_p_N;
Dn_N_M(8) - y(27)/tau_p_N]; %Differentiation matrix of nitrogen atom and ion in transport influenced coronal equilibrium.

Dn_O_M_tr=[Dn_O_M(1)+ Vp/(Vv_coef_O*Vv)*Sputtering_ObyO*(y(29)+y(30)+y(31)+y(32)+y(33)+y(34)+y(35)+y(36))/tau_p_O;
Dn_O_M(2) - y(29)/tau_p_O;
Dn_O_M(3) - y(30)/tau_p_O;
Dn_O_M(4) - y(31)/tau_p_O;
Dn_O_M(5) - y(32)/tau_p_O;
Dn_O_M(6) - y(33)/tau_p_O;
Dn_O_M(7) - y(34)/tau_p_O;
Dn_O_M(8) - y(35)/tau_p_O;
Dn_O_M(9) - y(36)/tau_p_O];%Differentiation matrix of oxygen atom and ion in transport influenced coronal equilibrium.

%% ordinary differential equations

Dy(1) = (2 / 3 * P_e / (y(4) * Qe) - y(1) / y(4) * ([0,1]*Dn_H_M_tr + [0,1,2,3,4]*Dn_Be_M_tr +[0,1,2,3,4,5,6]*Dn_C_M_tr ...
    + [0,1,2,3,4,5,6,7]*Dn_N_M_tr + [0,1,2,3,4,5,6,7,8]*Dn_O_M_tr));  %electron temperature balance
Dy(2) = 2 / 3 * P_i / (y(5) * Qe) - y(2) / y(5) * ([0,1]*Dn_H_M_tr + [0,1,1,1,1]*Dn_Be_M_tr+[0,1,1,1,1,1,1]*Dn_C_M_tr ...
    +[0,1,1,1,1,1,1,1]*Dn_N_M_tr +[0,1,1,1,1,1,1,1,1]*Dn_O_M_tr);  %ion temperature balance
Dy(3)=1/(M_p_mk2^2 - Lp*Lmk2)*(M_p_mk2*V_loop-Lmk2*V_loop-M_p_mk2*y(37)*Rmk2+Lmk2*y(3)*Rp); %plasma current
Dy(4) = [0,1]*Dn_H_M_tr + [0,1,2,3,4] * Dn_Be_M_tr + [0,1,2,3,4,5,6] * Dn_C_M_tr ...
    + [0,1,2,3,4,5,6,7] * Dn_N_M_tr+ [0,1,2,3,4,5,6,7,8]*Dn_O_M_tr ; %electron density balance
Dy(5) = [0,1]*Dn_H_M_tr + [0,1,1,1,1] * Dn_Be_M_tr + [0,1,1,1,1,1,1] * Dn_C_M_tr ...
    + [0,1,1,1,1,1,1,1] * Dn_N_M_tr + [0,1,1,1,1,1,1,1,1]*Dn_O_M_tr ; %ion density balance
Dy(6) = Dn_H_M_tr(1) ; %deuterium atom density balance
Dy(7) = Dn_H_M_tr(2) ; %deuterium ion density balance 

Dy(8) = Dn_Be_M_tr(1) ;%beryllium atom density balance
Dy(9) = Dn_Be_M_tr(2) ;%beryllium ion 1+ density balance
Dy(10) = Dn_Be_M_tr(3) ;%beryllium ion 2+ density balance
Dy(11) = Dn_Be_M_tr(4) ;%beryllium ion 3+ density balance
Dy(12) = Dn_Be_M_tr(5) ;%beryllium ion 4+ density balance

Dy(13) = Dn_C_M_tr(1) ;%Carbon atom density balance
Dy(14) = Dn_C_M_tr(2) ;%Carbon ion 1+ density balance
Dy(15) = Dn_C_M_tr(3) ;%Carbon ion 2+ density balance
Dy(16) = Dn_C_M_tr(4) ;%Carbon ion 3+ density balance
Dy(17) = Dn_C_M_tr(5) ;%Carbon ion 4+ density balance
Dy(18) = Dn_C_M_tr(6) ;%Carbon ion 5+ density balance
Dy(19) = Dn_C_M_tr(7) ;%Carbon ion 6+ density balance

Dy(20) = Dn_N_M_tr(1); %Nitrogen atom density balance
Dy(21) = Dn_N_M_tr(2); %Nitrogen ion 1+ density balance
Dy(22) = Dn_N_M_tr(3); %Nitrogen ion 2+ density balance 
Dy(23) = Dn_N_M_tr(4); %Nitrogen ion 3+ density balance
Dy(24) = Dn_N_M_tr(5); %Nitrogen ion 4+ density balance
Dy(25) = Dn_N_M_tr(6); %Nitrogen ion 5+ density balance
Dy(26) = Dn_N_M_tr(7); %Nitrogen ion 6+ density balance
Dy(27) = Dn_N_M_tr(8); %Nitrogen ion 7+ density balance

Dy(28) = Dn_O_M_tr(1); %Oxygen atom density balance
Dy(29) = Dn_O_M_tr(2); %Oxygen ion 1+ density balance
Dy(30) = Dn_O_M_tr(3); %Oxygen ion 2+ density balance 
Dy(31) = Dn_O_M_tr(4); %Oxygen ion 3+ density balance
Dy(32) = Dn_O_M_tr(5); %Oxygen ion 4+ density balance
Dy(33) = Dn_O_M_tr(6); %Oxygen ion 5+ density balance
Dy(34) = Dn_O_M_tr(7); %Oxygen ion 6+ density balance
Dy(35) = Dn_O_M_tr(8); %Oxygen ion 7+ density balance
Dy(36) = Dn_O_M_tr(9); %Oxygen ion 8+ density balance

Dy(37)=1/(M_p_mk2^2 - Lp*Lmk2)*(M_p_mk2*V_loop-Lp*V_loop-M_p_mk2*y(3)*Rp+Lp*y(37)*Rmk2); %Eddy current on Mark 2
disp(['t [sec] = ',num2str(max(t))])
Dy=[Dy(1);Dy(2);Dy(3);Dy(4);Dy(5);Dy(6);Dy(7);Dy(8);Dy(9);Dy(10);Dy(11);Dy(12);Dy(13);Dy(14);Dy(15);Dy(16);Dy(17);Dy(18);Dy(19); ...
    Dy(20);Dy(21);Dy(22);Dy(23);Dy(24);Dy(25);Dy(26);Dy(27);Dy(28);Dy(29);Dy(30);Dy(31);Dy(32);Dy(33);Dy(34);Dy(35);Dy(36);Dy(37)];
