% 1D steady state Schnakenberg problem :
% G(u;mu) = |1 0|(-\Delta)^s u + |-u + u^2v| + sigma(u - 1/v)^2| 1| = 0 
%           |0 d|                |mu - u^2v|                   |-1|
% on [-l,l] with homogeneous Neumann boundaries 

% Stores the bifurcation diagrams for fractional orders s=0.95, s=0.9, s=0.8, s=0.73 


%% Fractional order s = 0.95
close all; keep pphome; p=[];
system('rm -rf h1D/*');
system('rm -rf 1D1/*');
system('rm -rf 1D2/*');
system('rm -rf 1D3/*');
system('rm -rf 1D4/*');
system('rm -rf sn1D/*');

% set parameters and initialize the simulation 
s = 0.95;
par=[3.8, -0.6, 60, s]; % par(1) = lambda, par(2) = sigma, par(3) = d, par(4)=s
lambda_c= sqrt(60*(3-sqrt(8))); 
kc=((60-lambda_c^2)/(2*60))^(1/(2*s)); % domain size depends on s 
lx=5*pi/kc; nx=1600; 
p=schnakinit(p,lx,nx,par); p=setfn(p,'h1D');
p=findbif(p,6); % many bif-points close to each other, use findbif 
p=cont(p,4000);  % a few more steps (for later plotting)  
% 'stripe' branches 1,2,3,4 and 1st snake on stripes 1
p=swibra('h1D','bpt1','1D1',-0.1); p.nc.dsmax=1e-2; p.nc.lammin=2; p=cont(p,800);
p=swibra('h1D','bpt2','1D2',-0.1); p.nc.dsmax=1e-2; p.nc.lammin=2; p=cont(p,800);
p=swibra('h1D','bpt3','1D3',-0.1); p.nc.dsmax=1e-2; p.nc.lammin=2; p=cont(p,800);
p=swibra('h1D','bpt4','1D4',-0.1); p.nc.dsmax=1e-2; p.nc.lammin=2; p=cont(p,800);
p=swibra('1D1','bpt1','sn1D',-0.1); p.nc.dsmax=1e-3; p. p=cont(p,4000);


% final figure
close all
% bifurcation
f1 = figure(1); f=1; c=8;
plotbra('h1D', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1D2', f, c,'cl','r','lsw',0);
plotbra('1D3', f, c,'cl','g','lsw',0);
plotbra('1D4', f, c,'cl','c','lsw',0);
plotbra('sn1D', f, c,'cl',[.5 0 .5],'lsw',0);
xlim([2.9 3.8]);

ylabel('$||u||_{L^8}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/schnak-bifurcation-s0p95.eps')


%% Fractional order s = 0.9
close all; keep pphome; p=[];
system('rm -rf h1D/*');
system('rm -rf 1D1/*');
system('rm -rf 1D2/*');
system('rm -rf 1D3/*');
system('rm -rf 1D4/*');
system('rm -rf sn1D/*');

% set parameters and initialize the simulation 
s = 0.9;
par=[3.8, -0.6, 60, s]; % par(1) = lambda, par(2) = sigma, par(3) = d, par(4)=s
lambda_c= sqrt(60*(3-sqrt(8))); 
kc=((60-lambda_c^2)/(2*60))^(1/(2*s)); % domain size depends on s 
lx=5*pi/kc; nx=1600; 
p=schnakinit(p,lx,nx,par); p=setfn(p,'h1D');
p=findbif(p,6); % many bif-points close to each other, use findbif 
p=cont(p,4000);  % a few more steps (for later plotting)  
% 'stripe' branches 1,2,3,4 and 1st snake on stripes 1
p=swibra('h1D','bpt1','1D1',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt2','1D2',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt3','1D3',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt4','1D4',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('1D1','bpt2','sn1D',-0.1); p.nc.dsmax=1e-2; p. p=cont(p,4500);


% final figure
close all
% bifurcation
f1 = figure(1); f=1; c=8;
plotbra('h1D', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1D2', f, c,'cl','r','lsw',0);
plotbra('1D3', f, c,'cl','g','lsw',0);
plotbra('1D4', f, c,'cl','c','lsw',0);
plotbra('sn1D', f, c,'cl',[.5 0 .5],'lsw',0);
xlim([2.9 3.8]);

ylabel('$||u||_{L^8}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/schnak-bifurcation-s0p9.eps')



%% Fractional order s = 0.8
close all; keep pphome; p=[];
system('rm -rf h1D/*');
system('rm -rf 1D1/*');
system('rm -rf 1D2/*');
system('rm -rf 1D3/*');
system('rm -rf 1D4/*');
system('rm -rf sn1D/*');

% set parameters and initialize the simulation 
s = 0.8;
par=[3.8, -0.6, 60, s]; % par(1) = lambda, par(2) = sigma, par(3) = d, par(4)=s
lambda_c= sqrt(60*(3-sqrt(8))); 
kc=((60-lambda_c^2)/(2*60))^(1/(2*s)); % domain size depends on s 
lx=5*pi/kc; nx=2800; 
p=schnakinit(p,lx,nx,par); p=setfn(p,'h1D');
p=findbif(p,6); % many bif-points close to each other, use findbif 
p=cont(p,4000);  % a few more steps (for later plotting)  
% 'stripe' branches 1,2,3,4 and 1st snake on stripes 1
p=swibra('h1D','bpt1','1D1',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt2','1D2',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt3','1D3',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt4','1D4',-0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('1D1','bpt2','sn1D',-0.1); p.nc.dsmax=1e-2; p. p=cont(p,6500);


% final figurestudy
close all
% bifurcation
f1 = figure(1); f=1; c=8;
plotbra('h1D', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1D2', f, c,'cl','r','lsw',0);
plotbra('1D3', f, c,'cl','g','lsw',0);
plotbra('1D4', f, c,'cl','c','lsw',0);
plotbra('sn1D', f, c,'cl',[.5 0 .5],'lsw',0);
xlim([2.9 3.8]);

ylabel('$||u||_{L^8}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/schnak-bifurcation-s0p8.eps')



%% Fractional order s = 0.73
close all; keep pphome; p=[];
system('rm -rf h1D/*');
system('rm -rf 1D1/*');
system('rm -rf 1D2/*');
system('rm -rf 1D3/*');
system('rm -rf 1D4/*');
system('rm -rf sn1D/*');

% set parameters and initialize the simulation 
s = 0.73;
par=[3.8, -0.6, 60, s]; % par(1) = lambda, par(2) = sigma, par(3) = d, par(4)=s
lambda_c= sqrt(60*(3-sqrt(8))); 
kc=((60-lambda_c^2)/(2*60))^(1/(2*s)); % domain size depends on s 
lx=5*pi/kc; nx=2800; 
p=schnakinit(p,lx,nx,par); p=setfn(p,'h1D');
p=findbif(p,6); % many bif-points close to each other, use findbif 
p=cont(p,4000);  % a few more steps (for later plotting)  
% 'stripe' branches 1,2,3,4 and 1st snake on stripes 1
p=swibra('h1D','bpt1','1D1',0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt2','1D2',0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt3','1D3',0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('h1D','bpt4','1D4',0.1); p.nc.dsmax=1e-1; p.nc.lammin=2; p=cont(p,400);
p=swibra('1D1','bpt2','sn1D',0.1); p.nc.dsmax=1e-2; p. p=cont(p,8500);


% final figure
close all
% bifurcation
f1 = figure(1); f=1; c=8;
plotbra('h1D', f, c,'cl','k','lsw',0);
plotbra('1D1', f, c,'cl','b','lsw',0);
plotbra('1D2', f, c,'cl','r','lsw',0);
plotbra('1D3', f, c,'cl','g','lsw',0);
plotbra('1D4', f, c,'cl','c','lsw',0);
plotbra('sn1D', f, c,'cl',[.5 0 .5],'lsw',0);
xlim([2.9 3.8]);

ylabel('$||u||_{L^8}$', 'Interpreter', 'latex');
xlabel('$\mu$', 'Interpreter', 'latex');
box on
hgexport(f1, './figures/schnak-bifurcation-s0p7.eps')