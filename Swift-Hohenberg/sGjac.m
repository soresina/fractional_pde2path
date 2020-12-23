function Gu=sGjac(p,u)
[f1u,f1v,f2u,f2v]=njac(p,u); n=p.nu/2;
Fu=[[spdiags(f1u,0,n,n),spdiags(f1v,0,n,n)];
    [spdiags(f2u,0,n,n),spdiags(f2v,0,n,n)]];
Gu=p.mat.K-p.mat.M*Fu +p.nc.sf*p.mat.Q; 
end 

function [f1u,f1v,f2u,f2v]=njac(p,u) 
n=p.nu/2; u1=u(1:n); par=u(p.nu+1:end); lam=par(1); nup=par(2); ov=ones(n,1);  
f1u=-(1-lam)*ov+3*nup*u1.^2-5*u1.^4; f1v=-2*ov; % 
f2u=0*ov; f2v=0*ov; 
end