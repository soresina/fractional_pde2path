function Ks = FractionalLaplacian(K,M,np,h,s)

% parameter 
k = -1/log(h)
Np = ceil(pi^2/(4*(1-s)*k^2));
Nm = ceil(pi^2/(4*s*k^2));
coeff = -k*sin(s*pi)/pi;

% fractional Laplacian
Ks = zeros(np,np);
parfor i = 1 : np
    t = zeros(np,1);
    t(i,1) = 1; % test vector
    col = zeros(np,1)
    % compute the Balakrishnan sum
    z = K*t;
    for l = [-Nm:Np]
        alpha = exp(k*l);
        A = alpha*M + K;        
        v = lsqminnorm(A,z);        
        col = col + exp(s*k*l)*v;        
    end
    col = coeff*col;
    % set the i-th colomn of Ks
    Ks(:,i) = col;
end 
Ks = sparse(Ks)