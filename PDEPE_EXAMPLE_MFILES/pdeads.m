function [t,x,u1,u2]=pdeads;

m = 0; % because we are dealing with a slab geometry
x = linspace(0,1,21); % 21 discrete points dx=0.05
t = linspace(0,1,101); % 101 discrete points dt=.01

sol = pdepe(m,@pdeadspde,@pdeadsic,@pdeadsbc,x,t);
u1 = sol(:,:,1);
u2 = sol(:,:,2);

figure
surf(x,t,u1)
title('u1(x,t)')
xlabel('Distance x')
ylabel('Time t')

figure
surf(x,t,u2)
title('u2(x,t)')
xlabel('Distance x')
ylabel('Time t')

% Plot the integral
I=[];
for i=1:length(t)
I=[I trapz(x,u2(i,:))];
end
figure
plot(t,I)
xlabel('Time \tau')
ylabel('Average Uptake y_\mu')
% --------------------------------------------------------------
function [c,f,s] = pdeadspde(x,t,u,DuDx)
c = [1e-4; 0.1];                                  
f = [0.1; 0] .* DuDx;                   
F = u(1)*(1 - u(2));
s = [-F; F];                                                          
% --------------------------------------------------------------
function u0 = pdeadsic(x);
u0 = [0; 0];                                 
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdeadsbc(xl,ul,xr,ur,t)
pl = [0; 0];                               
ql = [10; 10];                                  
pr = [ur(1)-1; 0];                            
qr = [0; 10];    