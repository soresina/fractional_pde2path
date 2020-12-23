function p=oosetfemops(p) 
gr=p.pdeo.grid; % just introduced as a shorthand 
np = p.np; % number of grid pts 
h = p.pdeo.grid.h; h = h(1); % mesh size (here uniform!)
[K,M,~]=p.pdeo.fem.assema(gr,1,1,1);


% only keep the part of matrices fitting Dirichlet BCs
K(1,:) = 0; M(1,:) = 0; 
K(np,:) = 0; M(np,:) = 0; 
K(:,1) = 0; M(:,1) = 0;
K(:,np) = 0; M(:,np) = 0;

u = p.u; 
s = u(p.np+6); % get the fractional order 
Ks = FractionalLaplacian(K,M,np,h,s); % compute approximation to fractional Lapl.

p.mat.M=M; 
p.mat.K=-M*Ks; 

bcl = gr.robinBC(1,0); bcr=gr.robinBC(1,0); % homogeneous Dirichlet BC
gr.makeBoundaryMatrix(bcl,bcr); % intermediate step before assembling BC matr. 
[Q,G,~,~]=p.pdeo.fem.assemb(gr); p.mat.Q=Q; p.mat.G=G; % the BC matrices
p.nc.sf=1e3; % stiff spring constant for DBC via Robin-BC 