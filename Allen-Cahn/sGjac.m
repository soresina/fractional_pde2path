function Gu=sGjac(p,u) % Jacobian 
par=u(p.nu+1:end); u=u(1:p.nu); % split into parameters and PDE variables 
fu=par(2)+3*u.^2-5*par(3)*u.^4; % compute nonlinearity 
Fu=spdiags(fu,0,p.nu,p.nu);     % and convert to matrix 
Gu=par(1)*p.mat.K-p.mat.M*Fu... % build Jac from bulk PDE part 
   +p.nc.sf*p.mat.Q;            % and BC 