%% Graph

global W_coef1 W_coef2 t_Drecycling Gas_puffing Btoroidal Volume_Vacuum amu EM MU0 e0 Qe ln_lambda T_0 Lmk2 Rmk2 M_p_mk2
global t_D3D V_D3D Area_D3D R_D3D a_D3D P_ECH t_ECH Lp Iref %Bpoloidal_r Bpoloidal_z 

linewidth=2 ;
fontsize=12 ;


figure(1)
AX1=subplot(6,1,2);
plot(t,y(:,3),'-b',t_Ip_D3D, Ip_D3D,'-r','LineWidth',linewidth)
title(['D3D simulation'])
ylabel(['Plasma',sprintf('\n'), 'current [A]'],'FontSize',fontsize)
legend('DYON plasma current', 'D3D measurement')
set(AX1,'FontSize',fontsize)
grid

text(0,max(y(:,3)*3),['V_{loop}^{max}=',num2str(max(V_loop)), '[V], P_{ECH}=', num2str(P_ECH),'[W]' ,  ...
      ', Prefill gas pressure =', num2str(pressure_Torr), '[Torr]',sprintf('\n'), ', Plasma inductance L_p=', num2str(Lp),'[uH]' ... 
      ', Gas Puffing  =', num2str(Gas_puffing) ,sprintf('\n'), ...
    'D recycling coef=', num2str(W_coef1), '\rightarrow', num2str(W_coef1-W_coef2), ' at \tau_{ref}=', num2str(t_Drecycling),sprintf('\n'), ...   
    'Be(0)=', num2str(Initial_Be),', C(0)=', num2str(Initial_C), ', O(0)=', ...
    num2str(Initial_O), ', N(0)=', num2str(Initial_N), sprintf('\n'), ...    
    'R_{major}(0)=',num2str(R_major(1,1)),'[m]', '  ', ...
    'r_{minor}(0)=', num2str(r_minor(1,1)), '[m]',sprintf('\n'), ...
    'L_{f}=0.25 \times r_{minor} B_{t}/B_{z} \times exp(I_{p}/I_{p}^{ref})', ...
     ' where B_{t}=',num2str(Btoroidal),'[T],', '  ', ...
    'B_{z}(0)=',num2str(Bz(1)*1000),'[mT],', '  ',...
    'I_{p}^{ref}=',num2str(Iref/1000),'[kA],',sprintf('\n'), ...
    'T_{e}(0)=1 [eV], ', 'T_{i}(0)=0.03 [eV],  ',sprintf('\n'), feature], ...
    'LineWidth',0.5,...
    'FontWeight','demi',...
    'FontSize',12 ,...
     'EdgeColor', [0 0 0])

AX2=subplot(6,1,3);
plot(t,V_loop,'-b',t,P_add.*Vp/1e6,'-r','LineWidth',linewidth)%/30000
ylabel('[V]','FontSize',fontsize)
legend('Loop voltage [V]','P_{RF}[MW]')
set(AX2,'FontSize',fontsize)
grid


AX3=subplot(6,1,4);
plot(t,PLT_total.*Vp+PRC_total.*VnD+PRB_total.*Vp,'-b','LineWidth',linewidth)
ylabel(['Total radiation', sprintf('\n'),'power loss[W]'],'FontSize',fontsize)
legend('Simulation')
set(AX3,'FontSize',fontsize)
grid

AX4=subplot(6,1,5);
plot(t,y(:,1),'-b','LineWidth',linewidth)
ylabel(['Electron', sprintf('\n'), 'temperature [eV]'],'FontSize',fontsize)
legend('Simulation')
set(AX4,'FontSize',fontsize)
grid


AX5=subplot(6,1,6);
plot(t,y(:,4),'-b','LineWidth',linewidth)
legend('Simulation')
ylabel(['Electron', sprintf('\n'), 'density [m^{-3}]'],'FontSize',fontsize)
xlabel('time[sec]','FontSize',fontsize)
set(AX5,'FontSize',fontsize)
grid

figure(2)
BX1=subplot(4,1,1);
plot(t,Be2line) 
set(get(BX1,'Ylabel'),'String',['Be^{1+} line', sprintf('\n'), '[p m^{-3} sec^{-1}]'],'Color','k','FontSize',fontsize)
set(BX1,'FontSize',fontsize)    
legend('Simulation')
grid

BX2=subplot(4,1,2);
plot(t,Dalpha.*VnD./Vp) 
set(get(BX2,'Ylabel'),'String',['D alpha line', sprintf('\n'), '[p m^{-3} sec^{-1}]'],'Color','k','FontSize',fontsize)
set(BX2,'FontSize',fontsize)
legend('Simulation')
grid

BX3=subplot(4,1,3);
plot(t,C3line)
set(get(BX3(1),'Ylabel'),'String',['C^{2+} line', sprintf('\n'), '[p m^{-3} sec^{-1}]'],'Color','k','FontSize',fontsize)
set(BX3,'FontSize',fontsize)
legend('Simulation')
grid

BX4=subplot(4,1,4);
plot(t,N2line) 
set(get(BX4(1),'Ylabel'),'String',['N^{1+} line', sprintf('\n'), '[p m^{-3} sec^{-1}]'],'Color','k','FontSize',fontsize)
set(BX4,'FontSize',fontsize)
xlabel('time[sec]','FontSize',fontsize)
legend('Simulation')
grid


figure(3)
CX1=subplot(6,1,1);
plot(t,y(:,3),t,y(:,37),'LineWidth',linewidth)
title(['D3D simulation'],'FontSize',fontsize)
ylabel('[A]','FontSize',fontsize)
legend('Plasma current','MK2 current')
ylim(CX1,[0,max(y(:,3))])
set(CX1,'FontSize',fontsize)
grid

CX2=subplot(6,1,2);
plot(t,y(:,1),'-b',t,y(:,2),'-r','LineWidth',linewidth)
ylabel('[eV]','FontSize',fontsize)
legend('Electron temperature','Ion temperature')
ylim(CX2,[0,max(y(:,1))])
set(CX2,'FontSize',fontsize)
grid

CX3=subplot(6,1,3);
plot(t,100*Vp(:).*y(:,5)./(Vp.*y(:,5)+VnD.*y(:,6)+VnBe.*y(:,8)+VnC.*y(:,13)+VnN.*y(:,20)+VnO.*y(:,28)),'-k','LineWidth',linewidth)
ylabel('[%]','FontSize',fontsize)
legend('Degree of ionization')
set(CX3,'FontSize',fontsize)
grid

CX4=subplot(6,1,4);
plot(t',P_oh.*Vp,'-r',t',P_add.*Vp,'--r',t',(P_equi+P_rad+P_econ+P_iz).*Vp,'-b',t',(P_oh+P_add-P_equi-P_rad-P_econ-P_iz).*Vp,'-k','LineWidth',linewidth)
ylabel('[W]','FontSize',fontsize)
ylim(CX4,[0,max(P_oh.*Vp)])
legend('Ohmic heating','ECH heating','Total Electron Power loss','Net Electron Heating Power')
set(CX4,'FontSize',fontsize)
grid

CX5=subplot(6,1,5);
plot(t,(P_equi+P_rad+P_econ+P_iz).*Vp,':k',t,P_equi.*Vp,'-.k',t,(P_rad+P_iz).*Vp,'-b',t,P_econ.*Vp,'--k','LineWidth',linewidth)
ylabel('[W]')
legend('Total Electron Power loss','Electron power loss due to Equilibration',...
    'Electron power loss due to Radiation+Ionization','Electron power loss due to Electron Transport')
ylim(CX5,[0,max((P_equi+P_rad+P_econ+P_iz).*Vp)])
set(CX5,'FontSize',fontsize)
grid

CX6=subplot(6,1,6);
plot(t,P_equi.*Vp,'-r',t,P_icon.*Vp,'-b',t,P_CX.*VnD,'--b','LineWidth',linewidth)
xlabel('time [sec]','FontSize',fontsize)
ylabel('[W]','FontSize',fontsize)
legend('Ion heating due to Equilibration','Ion power loss due to Ion Transport','Ion power loss due to Charge Exchange')
ylim(CX6,[0,max(P_equi.*Vp)])
set(CX6,'FontSize',fontsize)
grid

figure(4)
DX1=subplot(2,1,1);
semilogy(t,y(:,8),'-.r',t,y(:,9),'-or',t,y(:,10),'-xr',t,y(:,11),'-+r',t,y(:,12),'-*r' ...
    ,t,y(:,13),':.k',t,y(:,14),':ok',t,y(:,15),':xk',t,y(:,16),':+k',t,y(:,17),':*k',t,y(:,18),':sk',t,y(:,19),':dk' ...
    ,t,y(:,20),'--.c',t,y(:,21),'--oc',t,y(:,22),'--xc',t,y(:,23),'--+c',t,y(:,24),'--*c',t,y(:,25),'--sc',t,y(:,26),'--dc',t,y(:,27),'--vc' ...
    ,t,y(:,28),'--.b',t,y(:,29),'--ob',t,y(:,30),'--xb',t,y(:,31),'--+b',t,y(:,32),'--*b',t,y(:,33),'--sb',t,y(:,34),'--db',t,y(:,35),'--vb',t,y(:,36),'--^b')
title(['D3D simulation'],'FontSize',fontsize)
xlabel('time [sec]','FontSize',fontsize)
ylabel('density[m^{-3}]','FontSize',fontsize)
legend('Be atom','Be 1+','Be 2+', 'Be 3+', 'Be 4+'...
    ,'C atom', 'C 1+', 'C 2+', 'C 3+', 'C 4+', 'C 5+', 'C 6+' ...
    ,'N atom','N 1+','N 2+','N 3+','N 4+','N 5+','N 6+','N 7+' ...
    ,'O atom','O 1+','O 2+','O 3+','O 4+','O 5+','O 6+','O 7+','O 8+')
ylim(DX1,[1e+13,1e+18])
set(DX1,'FontSize',fontsize)


DX2=subplot(2,1,2);
plot(t,PLT_total.*Vp+PRB_total.*Vp+PRC_total.*VnD,':' ...
    ,t,PLT_H_total.*Vp+PRB_H_total.*Vp+P_CX_H_total.*VnD,'-k' ...
    ,t,PLT_Be_total.*Vp+PRB_Be_total.*Vp+P_CX_Be_total.*VnD,'--r' ...
    ,t,PLT_C_total.*Vp+PRB_C_total.*Vp+P_CX_C_total.*VnD,'--k' ...
    ,t,PLT_N_total.*Vp+PRB_N_total.*Vp+P_CX_N_total.*VnD,'--c' ...
    ,t,PLT_O_total.*Vp+PRB_O_total.*Vp+P_CX_O_total.*VnD,'--b','LineWidth',linewidth)
title('Imputiry Radiation Power Loss','FontSize',fontsize)
xlabel('time [sec]','FontSize',fontsize)
ylabel('[W]','FontSize',fontsize)
legend('Total power loss','Deuterium','Beryllium','Carbon','Nigtrogen','Oxygen' )
set(DX2,'FontSize',fontsize)
grid

figure(5)
EX1=subplot(4,1,1);
plot(t,Sputtering_DbyD, t,Sputtering_BebyBe,t,Sputtering_BebyD, t, Sputtering_BebyO,'LineWidth',linewidth)
title(['D3D simulation'],'FontSize',fontsize)
ylabel('Y','FontSize',fontsize)
legend('D recycling coef','Be recycling coef', 'Be sputtering yield due to D','Be sputtering yield due to O')
set(EX1,'FontSize',fontsize)
grid

EX2=subplot(4,1,2);
plot(t,tau_p_D,'LineWidth',linewidth)
ylabel('[sec]','FontSize',fontsize)
legend('Particle confinement time')
set(EX2,'FontSize',fontsize)
grid

EX3=subplot(4,1,3);
semilogy(t,L_connection,'LineWidth',linewidth)
ylabel('[m]','FontSize',fontsize)
legend('Effective Connection Length')
set(EX3,'FontSize',fontsize)
grid

figure(6)
FX1=subplot(6,1,1);
plot(t,PLT_total.*Vp, t, PRB_total.*Vp,t,PRC_total.*VnD,'LineWidth',linewidth)
title(['D3D simulation'],'FontSize',fontsize)
legend('total line radiation','total rec+brem radiation','total CX radiation')
ylabel('[W]','FontSize',fontsize)
ylim(FX1,[0,max(PLT_total.*Vp)])
set(FX1,'FontSize',fontsize)
grid

FX2=subplot(6,1,2);
plot(t,PLT_H_total.*Vp, t, PRB_H_total.*Vp, t,P_CX_H_total.*VnD,'LineWidth',linewidth)
legend('D line radiation','D rec+brem radiation','D CX radiation')
ylabel('[W]','FontSize',fontsize)
ylim(FX2,[0,max(PLT_total.*Vp)])
set(FX2,'FontSize',fontsize)
grid

FX3=subplot(6,1,3);
plot(t,PLT_Be_total.*Vp,t,PRB_Be_total.*Vp,t,P_CX_Be_total.*VnD,'LineWidth',linewidth)
legend('Be line radiation','Be rec+brem radiation','Be CX radiation')
ylabel('[W]','FontSize',fontsize)
ylim(FX3,[0,max(PLT_total.*Vp)])
set(FX3,'FontSize',fontsize)
grid

FX4=subplot(6,1,4);
plot(t,PLT_C_total.*Vp,t,PRB_C_total.*Vp,t,P_CX_C_total.*VnD,'LineWidth',linewidth)
legend('C line radiation','C rec+brem radiation','C CX radiation')
ylabel('[W]','FontSize',fontsize)
ylim(FX4,[0,max(PLT_total.*Vp)])
set(FX4,'FontSize',fontsize)
grid

FX5=subplot(6,1,5);
plot(t,PLT_N_total.*Vp,t,PRB_N_total.*Vp,t,P_CX_N_total.*VnD,'LineWidth',linewidth)
legend('N line radiation','N rec+brem radiation','N CX radiation')
ylabel('[W]','FontSize',fontsize)
ylim(FX5,[0,max(PLT_total.*Vp)])
set(FX5,'FontSize',fontsize)
grid

FX6=subplot(6,1,6);
plot(t,PLT_O_total.*Vp,t,PRB_O_total.*Vp,t,P_CX_O_total.*VnD,'LineWidth',linewidth)
legend('O line radiation','O rec+brem radiation','O CX radiation')
ylabel('[W]','FontSize',fontsize)
xlabel('time[sec]','FontSize',fontsize)
ylim(FX6,[0,max(PLT_total.*Vp)])
set(FX6,'FontSize',fontsize)
grid

linkaxes([AX1,AX2,AX3,AX4,AX5, ...
    BX1,BX2,BX3,BX4,...
    CX1,CX2,CX3,CX4,CX5,CX6,...
    DX1,DX2,...
    EX1,EX2,EX3,... %EX4
    FX1,FX2,FX3,FX4,FX5,FX6],'x');
