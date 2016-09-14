function [x,t,u]=pdeNu;

m = 1;
x = linspace(0,1,21);
t = linspace(0,1,101);

sol = pdepe(m,@pdeNupde,@pdeNuic,@pdeNubc,x,t);

% Extract the first solution component as u.
%u=sol(:,:,1);
u = [zeros(1,21); sol(2:end,:,1)];

% A surface plot is often a good way to study a solution.
surf(x,t,u)    
title('Numerical solution computed with 21 mesh points.')
xlabel('Distance x')
ylabel('Time \tau')

% A solution profile can also be illuminating.
figure
plot(x,u(end,:))
title('Solution at \tau = 1')
xlabel('Distance x')
ylabel('u(x,1)')

% Plot (1-u) vs x at various tau values say tau = 0, 0.1, 0.2, and 0.4
 figure 
 plot(x,1-u(1,:))
 hold
 plot(x,1-u(11,:),'k')
 plot(x,1-u(21,:),'r')
 plot(x,1-u(41,:),'m')
 xlabel('x')
 ylabel('1-u')
 legend('\tau = 0', '\tau = 0.1','\tau = 0.2','\tau = 0.4')
 
 % Computation of the integral from tau = 0 to tau = 1
 I=[];
 
 for i=1:length(t)
     I=[I 2*trapz(x,u(i,:).*x)];
 end
 figure
 plot(t,I)
 xlabel('\tau')
 ylabel('Integral')
 
 
% --------------------------------------------------------------
function [c,f,s] = pdeNupde(x,t,u,DuDx)
c = 1;
f = DuDx;
s = 0;
% --------------------------------------------------------------
function u0 = pdeNuic(x)
u0 = 0;
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdeNubc(xl,ul,xr,ur,t)
pl = 0;
ql = 1;
pr = ur-1;
qr = 0;