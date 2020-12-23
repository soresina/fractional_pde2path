function p=oosetfemops(p) % for SH as 2nd order system, hence singular p.mat.M 
np = p.np; % number of grid pts 
h = p.pdeo.grid.h; h = h(1); % mesh size (here uniform!)
[K,M,~]=p.pdeo.fem.assema(p.pdeo.grid,1,1,1); % scalar laplacian and mass 

% only keep the part of matrices fitting Dirichlet BCs
K(1,:) = 0; M(1,:) = 0; 
K(np,:) = 0; M(np,:) = 0; 
K(:,1) = 0; M(:,1) = 0;
K(:,np) = 0; M(:,np) = 0;


u = p.u; 
s = u(end); % get the fractional order
fo = strsplit(string(s),'.');
Ks_matrix = 'Ks'+fo(1)+'p'+fo(2)+'.mat';
if isfile(Ks_matrix)
     load(Ks_matrix);
else
     Ks = FractionalLaplacian(K,M,np,h,s); % compute approximation to fractional Lapl.
     save(Ks_matrix, 'Ks')
end

% system stiffness and mass matrices
p.mat.K=[[0*M*Ks M*Ks];[-M*Ks M]];   
p.mat.M=[[M 0*M];[0*M 0*M]]; 

% set boundary conditions parameters and matrices for homogeneous Dirichlet
gr=p.pdeo.grid; % just introduced as a shorthand 
bcl = gr.robinBC(1,0); bcr = gr.robinBC(1,0);
gr.makeBoundaryMatrix(bcl,bcr);
[Q,G,~,~]=p.pdeo.fem.assemb(gr);
p.nc.sf=1e3; % stiff spring factor
p.mat.Q=[[Q 0*Q];[0*Q Q]];
p.mat.G=[G;G];


