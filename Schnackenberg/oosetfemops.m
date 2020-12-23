function p=oosetfemops(p)
np = p.np; % number of grid pts 
h = p.pdeo.grid.h; h = h(1); % mesh size (here uniform!)
[K,M,~]=p.pdeo.fem.assema(p.pdeo.grid,1,1,1); % FEM/mass matrices

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
p.mat.K = -M*Ks;
p.mat.M=kron([[1,0];[0,1]],M);

end 
