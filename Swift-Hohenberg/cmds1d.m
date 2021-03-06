% 1D steady state Swift-Hohenberg problem :
% G(u;mu) = mu*u - (1 + (Delta)^s)^2*u + nu*u^3 - u^5 = 0
% on [-l,l] with homogeneous Dirichlet boundaries 

% Stores the bifurcation diagrams for fractional orders s=0.9, s=0.7, s=0.5, s=0.3 


%% Fractional order s = 0.9
close all; keep pphome; p=[];
system('rm -rf 1D0/*');
system('rm -rf 1D1/*');
system('rm -rf 1Ds1/*');

% set parameters and initialize the simulation 
lx=5*pi; nx=round(50*lx); ly=0.1; ny=1; ndim=1; lam=-2; 
nu=2; s=0.9;
par=[lam; nu; s]; p=shinit(p,nx,lx,ly,ndim,par); huclean(p);
p=setfn(p,'1D0'); 
% first continuation call 
p=findbif(p,4); p = cont(p,400);
% first Turing-branch
p=swibra('1D0','bpt1','1D1',0.01); p=cont(p,50);
% snaking branch  
p=swibra('1D1','bpt1','1Ds1',0.01); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=pmcont(p,6200);
% final figures
close all
% bifurcation
f1 = figure(1); f=1; c=0;
plotbra('1D0', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1Ds1', f, c,'cl','r','lsw',0);
xlim([-0.9 0.2]);

ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/SH-bifurcation-s0p9.eps')



%% Fractional order s = 0.7
close all; keep pphome; p=[];
system('rm -rf 1D0/*');
system('rm -rf 1D1/*');
system('rm -rf 1Ds1/*');

% set parameters and initialize the simulation 
lx=5*pi; nx=round(50*lx); ly=0.1; ny=1; ndim=1; lam=-2; 
nu=2; s=0.7;
par=[lam; nu; s]; p=shinit(p,nx,lx,ly,ndim,par); huclean(p);
p=setfn(p,'1D0'); 
% first continuation call 
p=findbif(p,4); p = cont(p,400);
% first Turing-branch
p=swibra('1D0','bpt1','1D1',0.01); p=cont(p,50);
% snaking branch  
p=swibra('1D1','bpt1','1Ds1',0.01); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=pmcont(p,12400);
% final figures
close all
% bifurcation
f1 = figure(1); f=1; c=0;
plotbra('1D0', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1Ds1', f, c,'cl','r','lsw',0);
xlim([-0.9 0.2]);

ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/SH-bifurcation-s0p7.eps')



%% Fractional order s = 0.5
close all; keep pphome; p=[];
system('rm -rf 1D0/*');
system('rm -rf 1D1/*');
system('rm -rf 1D3/*');
system('rm -rf 1Ds1/*');

% set parameters and initialize the simulation 
lx=5*pi; nx=round(50*lx); ly=0.1; ny=1; ndim=1; lam=-2; 
nu=2; s=0.5;
par=[lam; nu; s]; p=shinit(p,nx,lx,ly,ndim,par); huclean(p);
p=setfn(p,'1D0'); 
% first continuation call 
p=findbif(p,4); p = cont(p,400);
% first Turing-branch
p=swibra('1D0','bpt1','1D1',0.01); p=cont(p,50);
% third Turing-branch
p=swibra('1D0','bpt3','1D3',0.01); p=cont(p,50);
% snaking branch (front)  
p=swibra('1D1','bpt1','1Ds1',0.01); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=pmcont(p,20800);
% final figures
close all
% bifurcation
f1 = figure(1); f=1; c=0;
plotbra('1D0', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1D3', f, c,'cl','c','lsw',0);
plotbra('1Ds1', f, c,'cl','r','lsw',0);
xlim([-0.9 0.2]);

ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/SH-bifurcation-s0p5.eps')




%% Fractional order s = 0.3
close all; keep pphome; p=[];
system('rm -rf 1D0/*');
system('rm -rf 1D1/*');
system('rm -rf 1Ds1/*');

% set parameters and initialize the simulation 
lx=5*pi; nx=round(50*lx); ly=0.1; ny=1; ndim=1; lam=-2; 
nu=2; s=0.3;
par=[lam; nu; s]; p=shinit(p,nx,lx,ly,ndim,par); huclean(p);
p=setfn(p,'1D0'); 
% first continuation call 
p=findbif(p,4); p = cont(p,400);
% first Turing-branch
p=swibra('1D0','bpt1','1D1',0.01); p=cont(p,50);
% ninth Turing-branch
p=swibra('1D0','bpt9','1D9',0.01); p=cont(p,50);
% snaking branch (front)  
p=swibra('1D1','bpt1','1Ds1',0.01); p.sw.foldcheck = 1; p.sw.bifcheck = 2; p.sw.spcalc=1; p.nc.dsmax=1e-2; p=pmcont(p,30800);
% final figures
close all
% bifurcation
f1 = figure(1); f=1; c=0;
plotbra('1D0', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1D9', f, c,'cl','g','lsw',0);
plotbra('1Ds1', f, c,'cl','r','lsw',0);
xlim([-0.9 0.2]);

ylabel('$||u||_{L^2}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/SH-bifurcation-s0p3.eps')