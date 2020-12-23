function out=schnakbra(p,u)
% output to bifurcation diagram function for fch 
% parameters, max u_1, min u_1, |u_1|_L^8
M=getM(p); n=p.np;
out=[u(p.nu+1:end); % parameters 
    max(u(1:p.np)); min(u(1:p.np)); % min/max u_1
    sqrt(u(1:n)'*(M(1:n,1:n)*u(1:n)))/sqrt(p.vol);
    (p.vol)^(-1/8)*sum(p.mat.M(1:p.np,1:p.np)*abs(u(1:p.np)).^8)^(1/8)]; % (p.vol)^(-1/8)*sum(p.mat.M(1:p.np,1:p.np)*abs(u(1:p.np)).^8)^(1/8) |u_1|_L^8