function [sol_AL,TP]=ARCLENGTH_ADIABATIC(nsteps,arclen,solbar,deriv0,maxiter);

% nsteps : No of arc length steps that is needed.
% arclen : The desired arclength, ds
% solbar : The parameter value and the state variables in that order.
% deriv0 : Initial guess for derivatives (n+1 values in a column vector)
% maxiter: Maximun number of iterations for the Newton Scheme

sol_AL=[];
TP=[];
ds=arclen;
xbar=solbar(2:end);
parbar=solbar(1);
n=length(solbar)-1; % the number of state variables
deriv=deriv0;

% Define the symbols (variables) and the function
syms x L
func=1-x-L*x*1e9*exp(-25.2/(1.5-(0.5*x)));
Jack=jacobian(func,[x,L]);
Jac=(subs(Jack,[x L],[xbar parbar]));
ee=prod(eig((Jac(1:n,1:n))));
signflag=sign(ee);

for k=1:nsteps
% The equation system is [JJ*e] - [0 1]' = 0
% where e comprises of elements [dx1/ds ... dxn/ds dpar/ds]'
% and JJ is the associated Jacobian 
% The last row in the Jacobian is fixed.
% k1*e1 + k2*e2 - 0 =0
% e1^2 + e2^2 - 1 = 0

iters=0;

convflag=0;

while convflag==0 & iters < maxiter
    
    Jac=(subs(Jack,[x L],[xbar parbar]));
    
     ee=prod(eig((Jac(1:n,1:n))));
    
    if sign(ee)~=signflag
        % There has been a sign change (indication of turning point)        
        TP=[TP; [xbar parbar]];
        signflag=sign(ee);
    end
  
    
    Jac=[Jac;2*deriv'];
    fval(1:n)=(subs(func,[x L],[xbar parbar]));
    fval(n+1)=(deriv'*deriv)-1;
    fval=reshape(fval,n+1,1);
    correc=-inv(Jac)*fval;
   
    if norm(fval)<=1e-8
        convflag=1;
    else
        deriv=deriv+correc;
        iters=iters+1;
    end
end

    z0=[xbar;parbar]+(ds*deriv);


if iters < maxiter
    ss=z0;     % Good guess for the solution for computing the solution vector

cflag=0;  % Convergence Flag

while cflag==0,
    
    J=subs(Jack,[x L],[ss']);
    J=[J;2*(ss'-[xbar parbar])];
    
    f(1:n)=(subs(func,[x L],[ss']));
    f(n+1)=([ss'-[xbar parbar]]*[ss'-[xbar parbar]]')-(ds^2);
    
    correx=-inv(J)*f';
    
    if norm(f) <= 1e-8
        cflag=1;
    else
        ss=ss+correx;
    end
end

sol_AL=[sol_AL;[fliplr(ss')]];

xbar=ss(1:n);
parbar=ss(n+1);

else 
    break;
end
end