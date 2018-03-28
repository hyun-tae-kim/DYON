tic 
format short e    
clear
clear global

%% load ADAS atomic reaction coefficients
run ADASdata_CCD96.m %ADASdata.m %ADASdata_CCD96.m

%% Variables for DYON runs

global W_coef1 W_coef2 t_Drecycling Gas_puffing Btoroidal Volume_Vacuum amu EM MU0 e0 Qe ln_lambda T_0 Lmk2 Rmk2 M_p_mk2
global t_D3D V_D3D Area_D3D R_D3D a_D3D P_ECH t_ECH Lp Iref %Bpoloidal_r Bpoloidal_z 

load vloop_D3D %loop voltage input from D3D measurement
load Ip_D3D %measured Ip in D3D for comparison purpose

P_ECH = 0 ;% applied (total) ECH power [W]
t_ECH = 0 ;% ECH starting time [sec]
W_coef1=1 ;% parameter c1 for deuterium ion recycling coefficient. See eqn (2.17) in NV 52 2012 103016
W_coef2=0 ;% parameter c2 for deuterium ion recycling coefficient. See eqn (2.17) in NV 52 2012 103016
t_Drecycling = 0.1 ;% parameter c3 for deuterium ion recycling coefficient. See eqn (2.17) in NV 52 2012 103016
Gas_puffing=0 ;%Gas puffing in [total # of deuterium atoms / sec]

a_D3D=0.6 ;%minor radius of plasma [m]
R_D3D=1.7 ;%major radius of plasma [m]
Area_D3D=pi .* a_D3D.^2 ;%assuming circular crossection [m^2] 
Volume_Vacuum = 35 ;%vacuum vessel volume [m^3]
Btoroidal=1.58 ;%Toroidal magnetic field [Tesla]

%fraction of initial impurity atom density e.g. initial carbon atom density = Initial_C*n_d0
Initial_Be=0 ;%0.01
Initial_C=0 ;%0.005
Initial_N=0 ;%0.001
Initial_O=0 ;%0.001

%initial deuterium atom density
pressure_Torr= 6e-5 *0.5 ;  %7.2e-6[Torr] corresponds to n_d(0)=2e17 [m-3]. 5.4e-6 [Torr] = 1.5e17[m-3] 1.8e-5[Torr]=5e17[m-3] 5e-5[Torr]=1.3889[m-3]
n_d0=2.7778e22*pressure_Torr ;%initial neutral density assuming the prefill gas is at room temperature.
          
Ip0=0 ;%initial plasma current e.g. 1200*r_minor^2*V_loop/(2*pi*R_major) 

amu=1.66e-27;%atomic mass unit [kg]. 2 * amu is deutrerium mass in kg
EM=9.1094e-31;       %EM : Electron Mass [kg]
MU0=4.0*pi*1.0e-7;    % vacuum permeability for SI unit
e0=8.85*1.0e-12 ;     %vacuum permittivity for SI unit
Qe=1.60217646*1.0e-19; %electron charge
ln_lambda = 10; %coulomb logarithm is assumed for 2ev and 1e17 lab plasma.
T_0=300/11600;  %temperature of background neutral 
Lmk2=100;% 9.1e-6; %MK2 self-inductance[H]
Rmk2=100; %7.5e-4; %MK2 resistance[ohm]
M_p_mk2=0; %2.49e-6; %mutual inductance[H]
Lp=1.3e-6; %Plasma inductance in [H]. Or standard formula Lp=MU0*R_major*(log(8*R_major/r_minor)+li/2-2)
%li=0.5 % internal inductance in Lp=MU0*R_major*(log(8*R_major/r_minor)+li/2-2)
Iref=20e3; %reference plasma current for formation of closed flux surfaces




%% y information in each row
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
%I_mk2 : y(37)

%solving ordinary eqns by using ODE built-in solver  
                                             %T_e(0),T_i(0),I_p(0),n_e(0)   ,n_i(0)   ,n_H_0,n_H_1    
[t,y] = ode15s(@ODEsolver_D3D,[-0.0068,0.09],[1     ,0.03  ,Ip0   ,n_d0*2e-3,n_d0*2e-3,n_d0 ,n_d0*2e-3 ... %0.909~1.296 is the actual simulation time provided by F4E.
    ,Initial_Be*n_d0  ,0,0,0,0 ...
    ,Initial_C*n_d0   ,0,0,0,0,0,0 ...
    ,Initial_N*n_d0   ,0,0,0,0,0,0,0 ...
    ,Initial_O*n_d0   ,0,0,0,0,0,0,0,0,0]);
  % ,n_O_0            , , , , , , , , ,Ipmk2  

%% Data analysis with t and y 
run Output_analysis.m

%% Plot the analysing data
feature=['Note, D3D simulation (#147044)'] %Note in the text box in Figure 1.
run Output_plotting.m

%% save the analysed data
savefilename=['p(0)=',num2str(pressure_Torr*1e7),'e-7torr', ... %_c1=',num2str(W_coef1*100),'_c2=',num2str(W_coef2*100),'_t=',num2str(t_Drecycling*10), ...
'_V(t)=DIII-Ddata', ...
'_a=',num2str(a_D3D*100),'cm' ...
'_Lp=',num2str(Lp*1e7),'e-1uH_withCCD96']
%'_Be=',num2str(Initial_Be*1000), ...
%'_C=',num2str(Initial_C*1000), ...
%'_N=',num2str(Initial_N*1000), ...
%'_O=',num2str(Initial_O*1000), ...
%'_Pech=',num2str(P_ECH/1000),'kW' ...


save(savefilename)

toc



