%Output results analysis

global W_coef1 W_coef2 t_Drecycling Gas_puffing Btoroidal Volume_Vacuum amu EM MU0 e0 Qe ln_lambda T_0 Lmk2 Rmk2 M_p_mk2
global t_D3D V_D3D Area_D3D R_D3D a_D3D P_ECH t_ECH Lp Iref %Bpoloidal_r Bpoloidal_z 

for k=1:length(y)  %calculaiton for power loss analysis

V_loop(k,1)=interp1(t_D3D,V_D3D ,t(k,1),'linear');
R_major(k,1)=R_D3D; %interp1(t_D3D,R_D3D,t(k,1),'linear');
r_minor(k,1)=a_D3D; %interp1(t_D3D,a_D3D,t(k,1),'linear');
Area(k,1)=Area_D3D; %interp1(t_D3D,Area_D3D,t(k,1),'linear');
Vp(k,1)=Area(k,1) .* 2 * pi .* R_major(k,1);
%Bp_r(k,1)=interp1(t_D3D,Bpoloidal_r,t(k,1),'linear');
%Bp_z(k,1)=interp1(t_D3D,Bpoloidal_z,t(k,1),'linear');
Bz(k,1)=8e-5;%sqrt(Bp_r(k,1).^2 +Bp_z(k,1).^2); %0.001; %vertical field due to PF coil current

Vv=Volume_Vacuum ;%vessel volume
L_connection(k,1)=0.25*r_minor(k,1)*Btoroidal/Bz(k,1)*exp(y(k,3)./Iref);
vBohm(k,1)=2/r_minor(k,1)/16*y(k,1)/Btoroidal;

vD0=(3*Qe*T_0/(2*amu))^0.5; %Deuterium atom velocity
vBe0=(3*Qe*T_0/(9*amu))^0.5; %Deuterium atom velocity
vC0=(3*Qe*T_0/(12*amu))^0.5; %Carbon atom velocity
vN0=(3*Qe*T_0/(14*amu))^0.5; %Carbon atom velocity
vO0=(3*Qe*T_0/(16*amu))^0.5; %Oxygen atom velocity
mfp_D(k,1)=vD0/(y(k,4)*SCD_H(y(k,4),y(k,1))); %mfp_D is Deuterium atom's mean free path for electron impact ionization. 
mfp_Be(k,1)=vBe0/(y(k,4)*SCD_Be(y(k,4),y(k,1))); %mfp_Be is Beryllium atom's mean free path for electron impact ionization. 
mfp_C(k,1)=vC0/(y(k,4)*SCD_C(y(k,4),y(k,1))); %mfp_C is Carbon atom's mean free path for electron impact ionization. 
mfp_N(k,1)=vN0/(y(k,4)*SCD_N(y(k,4),y(k,1))); %mfp_N is Nitrogen atom's mean free path for electron impact ionization. 
mfp_O(k,1)=vO0/(y(k,4)*SCD_O(y(k,4),y(k,1))); %mfp_O is Oxygen atom's mean free path for electron impact ionization. 

if mfp_D(k,1) >= r_minor(k,1);  %no neutral screening effect for deuterium atom
VnD(k,1) = Vp(k,1) ;
else %neutral screening effect if deuteriu atom is ionized before escaping from plasma volume
VnD(k,1) = Vp(k,1)*(1-(r_minor(k,1)-mfp_D(k,1))^2/r_minor(k,1)^2); 
end

if mfp_Be(k,1) >= r_minor(k,1);  %no neutral screening effect for beryllium atom
VnBe(k,1) = Vp(k,1) ;
else %neutral screening effect if beryllium atom is ionized before escaping from plasma volume
VnBe(k,1) = Vp(k,1)*(1-(r_minor(k,1)-mfp_Be(k,1))^2/r_minor(k,1)^2); 
end

if mfp_C(k,1) >= r_minor(k,1);  %no neutral screening effect for carbon atom
VnC(k,1) = Vp(k,1) ;
else %neutral screening effect if carbon atom is ionized before escaping from plasma volume
VnC(k,1) =Vp(k,1)*(1-(r_minor(k,1)-mfp_C(k,1))^2/r_minor(k,1)^2); 
end

if mfp_N(k,1) >= r_minor(k,1);  %no neutral screening effect for oxygen atom
VnN(k,1) = Vp(k,1) ;
else %neutral screening effect if oxygen atom is ionized before escaping from plasma volume
VnN(k,1)= Vp(k,1)*(1-(r_minor(k,1)-mfp_N(k,1))^2/r_minor(k,1)^2); 
end

if mfp_O(k,1) >= r_minor(k,1);  %no neutral screening effect for oxygen atom
VnO(k,1) = Vp(k,1) ;
else %neutral screening effect if oxygen atom is ionized before escaping from plasma volume
VnO(k,1)= Vp(k,1)*(1-(r_minor(k,1)-mfp_O(k,1))^2/r_minor(k,1)^2); 
end

Vv_coef_D(k,1)=(Vv-Vp(k,1)+VnD(k,1))/Vv;
Vv_coef_Be(k,1)=(Vv-Vp(k,1)+VnD(k,1))/Vv;
Vv_coef_C(k,1)=(Vv-Vp(k,1)+VnC(k,1))/Vv;
Vv_coef_N(k,1)=(Vv-Vp(k,1)+VnN(k,1))/Vv;
Vv_coef_O(k,1)=(Vv-Vp(k,1)+VnO(k,1))/Vv;

Cs_D(k,1)=(Qe*(y(k,1)+y(k,2))/(2*amu))^0.5; %Hydrogen isotope ion sound speed

tau_p_D(k,1) = 1/((vBohm(k,1)/r_minor(k,1))+(Cs_D(k,1)/L_connection(k,1))); % Hydrogen isotope particle confinement time
tau_p_C(k,1) = tau_p_D(k,1); % Carbon ion confinement time
tau_p_Be(k,1)= tau_p_D(k,1); % Beryllium ion confinement time
tau_p_N(k,1)= tau_p_D(k,1); % Beryllium ion confinement time
tau_p_O(k,1)= tau_p_D(k,1); % Oxygen ion confinement time
tau_e(k,1) = tau_p_D(k,1);; %electron energy confinement time


%------------------------------------------------------------------------------------------

Zeff(k,1)=(y(k,7)+y(k,9)*1+y(k,10)*4+y(k,11)*9+y(k,12)*16 ...
    +y(k,14)+y(k,15)*4+y(k,16)*9+y(k,17)*16+y(k,18)*25+y(k,19)*36 ...
    +y(k,21)+y(k,22)*4+y(k,23)*9+y(k,24)*16+y(k,25)*25+y(k,26)*36+y(k,27)*49 ...
    +y(k,29)+y(k,30)*4+y(k,31)*9+y(k,32)*16+y(k,33)*25+y(k,34)*36+y(k,35)*49+y(k,36)*64)./y(k,4);

R_Spitzer(k,1)=(2.0*pi*R_major(k,1))/(Area(k,1))*(0.51*EM.^0.5*Qe.^2.0*ln_lambda)/(3*e0^2*(2*pi*Qe*y(k,1))^1.5)*Zeff(k,1);
%plasma resistance due to electron-ion collision(Spitzer-Harm resistivity)
P_oh(k,1) = y(k,3)^2* R_Spitzer(k,1)/ Vp(k,1); %ohmic heating power density
if t(k) < t_ECH
P_add(k,1)= P_ECH / Vp(k,1); %ech heating power density 
else
P_add(k,1)= 0;
end
P_equi(k,1) = 7.75*10^-34 * (y(k,1)-y(k,2)) * y(k,4) *  ln_lambda / y(k,1)^1.5 * (y(k,7)/2 + (1*y(k,9)+4*y(k,10)+9*y(k,11)+16*y(k,12))/9 ...
    + (1*y(k,14)+4*y(k,15)+9*y(k,16)+16*y(k,17)+25*y(k,18)+36*y(k,19))/12 ...
    + (1*y(k,21) + 4*y(k,22) + 9*y(k,23)+ 16*y(k,24)+25*y(k,25) + 36*y(k,26) + 49 * y(k,27))/14 ...
    + (1*y(k,29) + 4*y(k,30) + 9*y(k,31)+ 16*y(k,32)+25*y(k,33) + 36*y(k,34) + 49 * y(k,35)+ 64*y(k,36))/16); 

P_econ(k,1) = 1.5 * y(k,4) * Qe * y(k,1) / tau_e(k,1);  %electron power loss density for transport losses

P_icon_H(k,1) = 1.5 * y(k,7) * Qe * y(k,2)/ tau_p_D(k,1);%Hydrogen ion power loss for transport losses
P_icon_Be_1(k,1)=1.5 * y(k,9) * Qe * y(k,2)/ tau_p_Be(k,1);  %Beryllium 1+ ion power loss for transport losses
P_icon_Be_2(k,1)=1.5 * y(k,10) * Qe * y(k,2)/ tau_p_Be(k,1);  %Beryllium 2+ ion power loss for transport losses
P_icon_Be_3(k,1)=1.5 * y(k,11) * Qe * y(k,2)/ tau_p_Be(k,1);  %Beryllium 3+ ion power loss for transport losses
P_icon_Be_4(k,1)=1.5 * y(k,12) * Qe * y(k,2)/ tau_p_Be(k,1);  %Beryllium 4+ ion power loss for transport losses
P_icon_C_1(k,1)=1.5 * y(k,14) * Qe * y(k,2)/ tau_p_C(k,1);  %Carbon 1+ ion power loss for transport losses
P_icon_C_2(k,1)=1.5 * y(k,15) * Qe * y(k,2)/ tau_p_C(k,1); %Carbon 2+ ion power loss for transport losses
P_icon_C_3(k,1)=1.5 * y(k,16) * Qe * y(k,2)/ tau_p_C(k,1); %Carbon 3+ ion power loss for transport losses
P_icon_C_4(k,1)=1.5 * y(k,17) * Qe * y(k,2)/ tau_p_C(k,1); %Carbon 4+ ion power loss for transport losses
P_icon_C_5(k,1)=1.5 * y(k,18) * Qe * y(k,2)/ tau_p_C(k,1); %Carbon 5+ ion power loss for transport losses
P_icon_C_6(k,1)=1.5 * y(k,19) * Qe * y(k,2)/ tau_p_C(k,1); %Carbon 6+ ion power loss for transport losses
P_icon_N_1(k,1)=1.5 * y(k,21) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 1+ ion power loss for transport losses
P_icon_N_2(k,1)=1.5 * y(k,22) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 2+ ion power loss for transport losses
P_icon_N_3(k,1)=1.5 * y(k,23) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 3+ ion power loss for transport losses
P_icon_N_4(k,1)=1.5 * y(k,24) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 4+ ion power loss for transport losses
P_icon_N_5(k,1)=1.5 * y(k,25) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 5+ ion power loss for transport losses
P_icon_N_6(k,1)=1.5 * y(k,26) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 6+ ion power loss for transport losses
P_icon_N_7(k,1)=1.5 * y(k,27) * Qe * y(k,2)/ tau_p_N(k,1);  %Oxygen 7+ ion power loss for transport losses
P_icon_O_1(k,1)=1.5 * y(k,29) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 1+ ion power loss for transport losses
P_icon_O_2(k,1)=1.5 * y(k,30) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 2+ ion power loss for transport losses
P_icon_O_3(k,1)=1.5 * y(k,31) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 3+ ion power loss for transport losses
P_icon_O_4(k,1)=1.5 * y(k,32) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 4+ ion power loss for transport losses
P_icon_O_5(k,1)=1.5 * y(k,33) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 5+ ion power loss for transport losses
P_icon_O_6(k,1)=1.5 * y(k,34) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 6+ ion power loss for transport losses
P_icon_O_7(k,1)=1.5 * y(k,35) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 7+ ion power loss for transport losses
P_icon_O_8(k,1)=1.5 * y(k,36) * Qe * y(k,2)/ tau_p_O(k,1);  %Oxygen 8+ ion power loss for transport losses

P_icon(k,1)=P_icon_H(k,1)+P_icon_C_1(k,1)+P_icon_C_2(k,1)+P_icon_C_3(k,1)+P_icon_C_4(k,1)+P_icon_C_5(k,1)+P_icon_C_6(k,1) ...
    +P_icon_Be_1(k,1)+P_icon_Be_2(k,1)+P_icon_Be_3(k,1)+P_icon_Be_4(k,1) ...
    +P_icon_N_1(k,1)+P_icon_N_2(k,1)+P_icon_N_3(k,1)+P_icon_N_4(k,1)+P_icon_N_5(k,1)+P_icon_N_6(k,1)+P_icon_N_7(k,1)...
    +P_icon_O_1(k,1)+P_icon_O_2(k,1)+P_icon_O_3(k,1)+P_icon_O_4(k,1)+P_icon_O_5(k,1)+P_icon_O_6(k,1)+P_icon_O_7(k,1)+P_icon_O_8(k,1); 
%ion power loss density for transport losses. energy confinement time is the same with that of electron

P_iz(k,1) = P_iz_H_nse(y(k,4), y(k,1),y(k,6),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1))...
    +P_iz_Be_nse(y(k,4), y(k,1),y(k,8),y(k,9),y(k,10),y(k,11),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1))...
    + P_iz_C_nse(y(k,4), y(k,1),y(k,13),y(k,14),y(k,15),y(k,16),y(k,17),y(k,18),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1))...
    + P_iz_N_nse(y(k,4), y(k,1),y(k,20),y(k,21),y(k,22),y(k,23),y(k,24),y(k,25),y(k,26),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1))...
    + P_iz_O_nse(y(k,4), y(k,1),y(k,28),y(k,29),y(k,30),y(k,31),y(k,32),y(k,33),y(k,34),y(k,35),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1));
%P_iz is electron power loss density due to ionization.

P_rad(k,1) = P_rad_H_nse(y(k,4), y(k,1),y(k,6),y(k,7),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1)) ...
    + P_rad_Be_nse(y(k,4), y(k,1),y(k,8),y(k,9), y(k,10), y(k,11), y(k,12),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1)) ...
    + P_rad_C_nse(y(k,4), y(k,1),y(k,13),y(k,14), y(k,15), y(k,16), y(k,17),y(k,18),y(k,19),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1)) ...
    + P_rad_N_nse(y(k,4), y(k,1),y(k,20),y(k,21), y(k,22), y(k,23), y(k,24),y(k,25),y(k,26),y(k,27),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1)) ...
    + P_rad_O_nse(y(k,4), y(k,1),y(k,28),y(k,29), y(k,30), y(k,31), y(k,32),y(k,33),y(k,34),y(k,35),y(k,36),Vp(k,1),Vv,VnD(k,1),VnBe(k,1),VnC(k,1),VnN(k,1),VnO(k,1));
%P_rad is total electron power loss density due to radiation including excitation, recombination, and bremstrahlung.

[CCD_H_1_0]=CCD_H(y(k,4),y(k,2));
[CCD_Be_1_0,CCD_Be_2_1,CCD_Be_3_2,CCD_Be_4_3]=CCD_Be(y(k,4),y(k,2));
CCD_Be_M=[CCD_Be_1_0,CCD_Be_2_1,CCD_Be_3_2,CCD_Be_4_3];
[CCD_C_1_0,CCD_C_2_1,CCD_C_3_2,CCD_C_4_3,CCD_C_5_4,CCD_C_6_5]=CCD_C(y(k,4),y(k,2));
CCD_C_M=[CCD_C_1_0,CCD_C_2_1,CCD_C_3_2,CCD_C_4_3,CCD_C_5_4,CCD_C_6_5];
[CCD_N_1_0,CCD_N_2_1,CCD_N_3_2,CCD_N_4_3,CCD_N_5_4,CCD_N_6_5,CCD_N_7_6]=CCD_N(y(k,4),y(k,2));
CCD_N_M=[CCD_N_1_0,CCD_N_2_1,CCD_N_3_2,CCD_N_4_3,CCD_N_5_4,CCD_N_6_5,CCD_N_7_6];
[CCD_O_1_0,CCD_O_2_1,CCD_O_3_2,CCD_O_4_3,CCD_O_5_4,CCD_O_6_5,CCD_O_7_6,CCD_O_8_7]=CCD_O(y(k,4),y(k,2));
CCD_O_M=[CCD_O_1_0,CCD_O_2_1,CCD_O_3_2,CCD_O_4_3,CCD_O_5_4,CCD_O_6_5,CCD_O_7_6,CCD_O_8_7];
P_CX(k,1) = (VnD(k,1)/Vp(k,1))*(1.5*Qe*(y(k,2)-T_0)*y(k,6)*(CCD_H_1_0*y(k,7)+CCD_Be_1_0*y(k,9)+CCD_C_1_0*y(k,14)+CCD_N_1_0*y(k,21)+CCD_O_1_0*y(k,29)));
%+y(k,6)*(PRC_H_1_0*y(k,7)+PRC_Be_M*[y(k,9),y(k,10),y(k,11),y(k,12)]'+PRC_C_M*[y(k,14),y(k,15),y(k,16),y(k,17),y(k,18),y(k,19)]'+PRC_O_M*[y(k,21),y(k,22),y(k,23),y(k,24),y(k,25),y(k,26),y(k,27),y(k,28)]') ); 
%ion power loss density due to charge exchange between hydrogen atom and ions

[PLT_H_0]=PLT_H(y(k,4),y(k,1));
PLT_H_total(k,1)=y(k,4)*[PLT_H_0]*y(k,6)*(VnD(k,1)/Vp(k,1));
[PLT_Be_0,PLT_Be_1,PLT_Be_2,PLT_Be_3]=PLT_Be(y(k,4),y(k,1));
PLT_Be_total(k,1)=y(k,4)*[PLT_Be_0,PLT_Be_1,PLT_Be_2,PLT_Be_3]*[y(k,8)*(VnBe(k,1)/Vp(k,1)),y(k,9),y(k,10),y(k,11)]';
[PLT_C_0,PLT_C_1,PLT_C_2,PLT_C_3,PLT_C_4,PLT_C_5]=PLT_C(y(k,4),y(k,1));
PLT_C_total(k,1)=y(k,4)*[PLT_C_0,PLT_C_1,PLT_C_2,PLT_C_3,PLT_C_4,PLT_C_5]*[y(k,13)*(VnC(k,1)/Vp(k,1)),y(k,14),y(k,15),y(k,16),y(k,17),y(k,18)]';
[PLT_N_0,PLT_N_1,PLT_N_2,PLT_N_3,PLT_N_4,PLT_N_5,PLT_N_6]=PLT_N(y(k,4),y(k,1));
PLT_N_total(k,1) = y(k,4)*[PLT_N_0,PLT_N_1,PLT_N_2,PLT_N_3,PLT_N_4,PLT_N_5,PLT_N_6]*[y(k,20)*(VnN(k,1)/Vp(k,1)),y(k,21),y(k,22),y(k,23),y(k,24),y(k,25),y(k,26)]';
[PLT_O_0,PLT_O_1,PLT_O_2,PLT_O_3,PLT_O_4,PLT_O_5,PLT_O_6,PLT_O_7]=PLT_O(y(k,4),y(k,1));
PLT_O_total(k,1) = y(k,4)*[PLT_O_0,PLT_O_1,PLT_O_2,PLT_O_3,PLT_O_4,PLT_O_5,PLT_O_6,PLT_O_7]*[y(k,28)*(VnO(k,1)/Vp(k,1)),y(k,29),y(k,30),y(k,31),y(k,32),y(k,33),y(k,34),y(k,35)]';
PLT_total(k,1)=PLT_H_total(k,1)+PLT_Be_total(k,1)+PLT_C_total(k,1)+PLT_N_total(k,1)+PLT_O_total(k,1); %line radiation power loss density

PRB_H_total(k,1)=y(k,4)*PRB_H(y(k,4),y(k,1))*y(k,7);
[PRB_Be_1_0,PRB_Be_2_1,PRB_Be_3_2,PRB_Be_4_3]=PRB_Be(y(k,4),y(k,1));
PRB_Be_total(k,1) = y(k,4).*[PRB_Be_1_0,PRB_Be_2_1,PRB_Be_3_2,PRB_Be_4_3]*[y(k,9),y(k,10),y(k,11),y(k,12)]';
[PRB_C_1_0,PRB_C_2_1,PRB_C_3_2,PRB_C_4_3,PRB_C_5_4,PRB_C_6_5]=PRB_C(y(k,4),y(k,1));
PRB_C_total(k,1) = y(k,4).*[PRB_C_1_0,PRB_C_2_1,PRB_C_3_2,PRB_C_4_3,PRB_C_5_4,PRB_C_6_5]*[y(k,14),y(k,15),y(k,16),y(k,17),y(k,18),y(k,19)]';
[PRB_N_1_0,PRB_N_2_1,PRB_N_3_2,PRB_N_4_3,PRB_N_5_4,PRB_N_6_5,PRB_N_7_6]=PRB_N(y(k,4),y(k,1));
PRB_N_total(k,1) = y(k,4).*[PRB_N_1_0,PRB_N_2_1,PRB_N_3_2,PRB_N_4_3,PRB_N_5_4,PRB_N_6_5,PRB_N_7_6]*[y(k,21),y(k,22),y(k,23),y(k,24),y(k,25),y(k,26),y(k,27)]';
[PRB_O_1_0,PRB_O_2_1,PRB_O_3_2,PRB_O_4_3,PRB_O_5_4,PRB_O_6_5,PRB_O_7_6,PRB_O_8_7]=PRB_O(y(k,4),y(k,1));
PRB_O_total(k,1) = y(k,4).*[PRB_O_1_0,PRB_O_2_1,PRB_O_3_2,PRB_O_4_3,PRB_O_5_4,PRB_O_6_5,PRB_O_7_6,PRB_O_8_7]*[y(k,29),y(k,30),y(k,31),y(k,32),y(k,33),y(k,34),y(k,35),y(k,36)]';
PRB_total(k,1)=PRB_H_total(k,1) + PRB_Be_total(k,1)  + PRB_C_total(k,1) + PRB_N_total(k,1)+ PRB_O_total(k,1);%radiation power loss density due to recombination + Bremstrahlung 

P_CX_H_total(k,1)=P_CX_H(y(k,4),y(k,2),y(k,6),y(k,7));
P_CX_Be_total(k,1)=P_CX_Be(y(k,4),y(k,2),y(k,6),y(k,9),y(k,10),y(k,11),y(k,12));
P_CX_C_total(k,1)=P_CX_C(y(k,4),y(k,2),y(k,6),y(k,14),y(k,15),y(k,16),y(k,17),y(k,18),y(k,19));
P_CX_N_total(k,1)=P_CX_N(y(k,4),y(k,2),y(k,6),y(k,21),y(k,22),y(k,23),y(k,24),y(k,25),y(k,26),y(k,27));
P_CX_O_total(k,1)=P_CX_O(y(k,4),y(k,2),y(k,6),y(k,29),y(k,30),y(k,31),y(k,32),y(k,33),y(k,34),y(k,35),y(k,36));
PRC_total(k,1)=P_CX_H_total(k,1)+P_CX_Be_total(k,1)+P_CX_C_total(k,1)+P_CX_N_total(k,1)+P_CX_O_total(k,1); %radiation power loss density due to charge exchange 

Dalpha(k,1)=PEC_H(y(k,4),y(k,1))*y(k,4)*y(k,6);%*1e-6%*VnD(k,1)/Vp(k,1);
Be2line(k,1)=PEC_Be1(y(k,4),y(k,1))*y(k,4)*y(k,9);%*1e-6*r_minor(k,1)*100/3;
C3line(:,1)=PEC_C2(y(:,4),y(:,1)).*y(:,4).*y(:,15);
N2line(:,1)=PEC_N1(y(:,4),y(:,1)).*y(:,4).*y(:,21);

E_incident =  2*y(k,2)+3*y(k,1); %ion kinetic energy + sheath potential energy gain;

%Be Yield factor calculation. Sublimation energy is assumed to be 3.38[eV]
%Q_BeD=3.38^(-2/3) *  1.633 *4^(2/3)*(1+4^(2/3))^(1/3) * (2^(5/6)*9^(1/6))/11*(0.15+0.05*4.5)/(1+0.05*4.5^1.6)
%Q_BeBe=3.38^(-2/3) *  1.633 *4^(2/3) *4^(2/3)*(4^(2/3)+4^(2/3))^(1/3)*0.5*0.2/1.05 

if E_incident >= 29 %BeO 29 Be 10;
E_TF_Be_D = 444; % BeO 444 Be 282; %Thomas-Fermi energy for deuterium ion bombardment on beryllium wall
Q_yield_Be_D= 0.13; %BeO 0.13 Be 0.22; %yield factor for deuterium ion bombardment on beryllium wall
E_threshold_Be_D=29; % BeO 29 Be 10 ; %threshold energy for deuterium ion bombardment on beryllium wall
E_delta_Be_D=E_threshold_Be_D/E_incident;
E_reduced_Be_D = E_incident / E_TF_Be_D;
stopping_Be_D = (3.441*sqrt(E_reduced_Be_D)*log(E_reduced_Be_D+2.718))/(1+6.355*sqrt(E_reduced_Be_D)+E_reduced_Be_D*(6.882*sqrt(E_reduced_Be_D)-1.708)) ;
%nuclear stoppiong cross section for deuterium ion bombardment on beryllium wall
gfunction_Be_D=(1-E_delta_Be_D^(2/3))*(1-E_delta_Be_D)^2;
Sputtering_BebyD(k) = Q_yield_Be_D * stopping_Be_D * gfunction_Be_D;
else
Sputtering_BebyD(k) = 0;
end

if E_incident >= 23% 25
E_TF_Be_Be = 2208; %Thomas-Fermi energy for beryllim ion bombardment on beryllium wall
Q_yield_Be_Be=0.77; %0.7517; %yield factor for beryllium ion bombardment on beryllium wall
E_threshold_Be_Be=23;% 25; %threshold energy for beryllium ion bombardment on beryllium wall
E_delta_Be_Be=E_threshold_Be_Be/E_incident;
E_reduced_Be_Be = E_incident / E_TF_Be_Be;
stopping_Be_Be =(3.441*sqrt(E_reduced_Be_Be)*log(E_reduced_Be_Be+2.718))/(1+6.355*sqrt(E_reduced_Be_Be)+E_reduced_Be_Be*(6.882*sqrt(E_reduced_Be_Be)-1.708)) ;
%nuclear stoppiong cross section for beryllium ion bombardment on beryllium wall
gfunction_Be_Be=(1-E_delta_Be_Be^(2/3))*(1-E_delta_Be_Be)^2;
Sputtering_BebyBe(k) = Q_yield_Be_Be * stopping_Be_Be * gfunction_Be_Be ;
else
  Sputtering_BebyBe(k)=0;
end

if E_incident >=40;
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

if E_incident >= 70 %BeO 67 Be 70
E_TF_Be_O = 6970; %BeO 9088 Be 6970; %Thomas-Fermi energy for oxygen ion bombardment on beryllium wall
Q_yield_Be_O=1.3; %BeO 1.25 Be 1.3; %yield factor for oxygen ion bombardment on beryllium wall
E_threshold_Be_O=70; %BeO 67 Be 70; %threshold energy for oxygen ion bombardment on beryllium wall
E_delta_Be_O=E_threshold_Be_O/E_incident;
E_reduced_Be_O = E_incident / E_TF_Be_O;
stopping_Be_O = (3.441*sqrt(E_reduced_Be_O)*log(E_reduced_Be_O+2.718))/(1+6.355*sqrt(E_reduced_Be_O)+E_reduced_Be_O*(6.882*sqrt(E_reduced_Be_O)-1.708)) ;
%nuclear stoppiong cross section for oxygen ion bombardment on beryllium wall
gfunction_Be_O=(1-E_delta_Be_O^(2/3))*(1-E_delta_Be_O)^2;
Sputtering_BebyO(k) = Q_yield_Be_O * stopping_Be_O * gfunction_Be_O; %0.5 is a arbitrary coefficient.
else
Sputtering_BebyO(k) = 0;
end

Sputtering_DbyD(k) = W_coef1-W_coef2*(1-exp(-t(k)/t_Drecycling));

%Gas_puffing_density(k)=Gas_puffing(k)./(Vv-Vp(k,1)+Vv_coef_D(k,1)*Vv);

%disp(k)
end
%Dalpha(:,1)=PEC_H(y(:,4),y(:,1)).*y(:,4).*y(:,6)*1e-6%.*VnD(:,1)./Vp(:,1).*r_minor/3;
%C3line(:,1)=PEC_C2(y(:,4),y(:,1)).*y(:,4).*y(:,15)*1e-6.*r_minor(:,1)*100/3;