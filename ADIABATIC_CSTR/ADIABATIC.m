% Start with Euler Newton
sol=EulerN_ADIABATIC(0,4:-0.01:0.27);
plot(sol(:,1),sol(:,2),'r.')
hold on

% A few Arc Length Steps
% [sol_AL,TP]=ARCLENGTH_ADIABATIC(nsteps,arclen,solbar,deriv0,maxiter);
% The solution is known at s0 = 0; i.e. solbar
[sol_AL,TP1]=ARCLENGTH_ADIABATIC(25,0.01,[sol(end,1) sol(end,2)],[0.5 0.5]',100);
sol=[sol;sol_AL];
plot(sol_AL(:,1),sol_AL(:,2),'b.')

% Back to with Euler Newton
solu=EulerN_ADIABATIC(sol(end,2),sol(end,1):0.01:2.89);
sol=[sol;solu];
plot(solu(:,1),solu(:,2),'r.')

% Again a few Arc Length Steps
[sol_AL,TP2]=ARCLENGTH_ADIABATIC(200,0.001,[sol(end,1) sol(end,2)],[1 0]',100);
sol=[sol;sol_AL];
plot(sol_AL(:,1),sol_AL(:,2),'b.')

% Back to with Euler Newton
solu=EulerN_ADIABATIC(sol(end,2),sol(end,1):-0.01:0);
sol=[sol;solu];
plot(solu(:,1),solu(:,2),'r.')