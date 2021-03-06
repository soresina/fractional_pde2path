% 1D steady state fractional Allen-Cahn problem :
% G(u;mu) = (-Delta)^s u +mu*u + u^3 - gamma*u^5 = 0
% with homogeneous Dirichlet boundary conditions

% Stores the bifurcation diagrams for fractional orders s = 0.9, s= 0.5, s=0.2 
% as well as selected solutions at mu=2 in the folder './figures' (corresponding to Fig. 8 and 9 of the paper) 


%% Fractional order s = 0.9
close all; keep pphome; 
system('rm -rf b1/*');
system('rm -rf b2/*');
system('rm -rf b3/*');
system('rm -rf tr/*');

% set parameters and initialize the simulation
p=[]; par=[1 -0.3 1 0 0 0.9]; % par(2)= initial value of mu; par(3)=gamma; par(6)=s
p=acinit(p,5,150,par); p=setfn(p,'tr'); 
% first continuation call 
p=cont(p,4000); 
% switch to first 3 bifurcating branches
p=swibra('tr','bpt1','b1',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000);  
p=swibra('tr','bpt2','b2',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000); 
p=swibra('tr','bpt3','b3',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000);
% final figures
close all
% bifurcation
f1 = figure(1); f=1; c=0;
plotbra('tr', f, c,'cl','k','lsw',0);
plotbra('b1', f, c,'cl','b','lsw',0);
plotbra('b2', f, c,'cl','r','lsw',0);
plotbra('b3', f, c,'cl','m','lsw',0);
xlim([-0.3 2.5]);
ylim([0 4.5]);
ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/AC-bifurcation-s0p9.eps')
% % solutions

 f2 = figure(2)
 load('./b1/pt300.mat')
 plotsol(p,2)
 box on
 title('')
 hgexport(f2, './figures/sol-s0p9-b1-mu2.eps')
% %
 f3 = figure(3)
 load('./b2/pt260.mat')
 plotsol(p,3)
 box on
 title('')
 hgexport(f3, './figures/sol-s0p9-b2-mu2.eps')
% %
 f4 = figure(4)
 load('./b3/pt212.mat')
 plotsol(p,4)
 box on
 title('')
 hgexport(f4, './figures/sol-s0p9-b3-mu2.eps')





%% Fractional order s = 0.5
close all; keep pphome; 
system('rm -rf b1/*');
system('rm -rf b2/*');
system('rm -rf b3/*');
system('rm -rf tr/*');
% set parameters and initialize the simulation
p=[]; par=[1 -0.3 1 0 0 0.5]; % par(2)= initial value of mu; par(3)=gamma; par(6)=s
p=acinit(p,5,150,par); p=setfn(p,'tr'); 
% first continuation call 
p=cont(p,4000); 
% switch to first 3 bifurcating branches
p=swibra('tr','bpt1','b1',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000);  
p=swibra('tr','bpt2','b2',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000); 
p=swibra('tr','bpt3','b3',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000);
% final figure
close all
f1 = figure(1); f=1; c=0;
plotbra('tr', f, c,'cl','k','lsw',0);
plotbra('b1', f, c,'cl','b','lsw',0);
plotbra('b2', f, c,'cl','r','lsw',0);
plotbra('b3', f, c,'cl','m','lsw',0);
xlim([-0.3 2.5]);
ylim([0 4.5]);
ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/AC-bifurcation-s0p5.eps')
% % solutions
 f2 = figure(2)
 load('./b1/pt285.mat')
 plotsol(p,2)
 box on
 title('')
 hgexport(f2, './figures/sol-s0p5-b1-mu2.eps')
% %
 f3 = figure(3)
 load('./b2/pt246.mat')
 plotsol(p, 3)
 box on
 title('')
 hgexport(f3, './figures/sol-s0p5-b2-mu2.eps')
% %
 f4 = figure(4)
 load('./b3/pt213.mat')
 plotsol(p,4)
 box on
 title('')
 hgexport(f4, './figures/sol-s0p5-b3-mu2.eps')


%% Fractional order s = 0.2
close all; keep pphome;
system('rm -rf b1/*');
system('rm -rf b2/*');
system('rm -rf b3/*');
system('rm -rf tr/*');
% set parameters and initialize the simulation
p=[]; par=[1 -0.3 1 0 0 0.2]; % par(2)= initial value of mu; par(3)=gamma; par(6)=s
p=acinit(p,5,150,par); p=setfn(p,'tr'); 
% first continuation call 
p=cont(p,4000); 
% switch to first 3 bifurcating branches
p=swibra('tr','bpt1','b1',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000);  
p=swibra('tr','bpt2','b2',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000); 
p=swibra('tr','bpt3','b3',0.1); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=cont(p,4000);
% final figure
close all
f1 = figure(1); f=1; c=0;
plotbra('tr', f, c,'cl','k','lsw',0);
plotbra('b1', f, c,'cl','b','lsw',0);
plotbra('b2', f, c,'cl','r','lsw',0);
plotbra('b3', f, c,'cl','m','lsw',0);
xlim([-0.3 2.5]);
ylim([0 4.5]);
ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/AC-bifurcation-s0p2.eps')
% % solutions
 f2 = figure(2)
 load('./b1/pt263.mat')
 plotsol(p, 2)
 box on
 title('')
 hgexport(f2, './figures/sol-s0p2-b1-mu2.eps')
% %
 f3 = figure(3)
 load('./b2/pt240.mat')
 plotsol(p, 3)
 box on
 title('')
 hgexport(f3, './figures/sol-s0p2-b2-mu2.eps')
% %
 f4 = figure(4)
 load('./b3/pt225.mat')
 plotsol(p, 4)
 box on
 title('')
 hgexport(f4,'./figures/sol-s0p2-b3-mu2.eps')