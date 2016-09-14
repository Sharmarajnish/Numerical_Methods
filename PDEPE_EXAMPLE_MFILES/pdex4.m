function pdex4
m = 0;
x = [0 0.005 0.01 0.05 0.1 0.2 0.5 0.7 0.9 0.95 0.99 0.995 1];
t = [0 0.005 0.01 0.05 0.1 0.5 1 1.5 2];

sol = pdepe(m,@pdex4pde,@pdex4ic,@pdex4bc,x,t);
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
% --------------------------------------------------------------
function [c,f,s] = pdex4pde(x,t,u,DuDx)
c = [1; 1];                                  
f = [0.024; 0.17] .* DuDx;                   
y = u(1) - u(2);
F = exp(5.73*y)-exp(-11.46*y);
s = [-F; F];                                                          
% --------------------------------------------------------------
function u0 = pdex4ic(x);
u0 = [1; 0];                                 
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdex4bc(xl,ul,xr,ur,t)
pl = [0; ul(2)];                               
ql = [1; 0];                                  
pr = [ur(1)-1; 0];                            
qr = [0; 1];    