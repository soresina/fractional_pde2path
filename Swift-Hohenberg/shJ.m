function J=shJ(p,u) % energy for 3-5 SH 
par=u(p.nu+1:end); lam=par(1); nup=par(2); n=p.nu/2; u1=u(1:n); u2=u(n+1:2*n); 
dens=(u1+u2).^2/2-lam*u1.^2/2-nup*u1.^4/4+u1.^6/6; J=sum(p.mat.M(1:n,1:n)*dens); 