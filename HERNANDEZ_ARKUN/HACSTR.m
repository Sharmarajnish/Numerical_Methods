% The steady state map for the CSTR equations provided
% by Hernandez and Arkun, AIChEJ, Vol.39, No. 3, pp. 446-460

% Start with Euler Newton
sol=EulerN_HACSTR([0.1 0.5]',-0.5:0.01:0.41);
subplot(211)
plot(sol(:,1),sol(:,2),'r.')
hold on
subplot(212)
plot(sol(:,1),sol(:,3),'r.')
hold on

% A few Arc Length Steps
% [sol_AL,TP]=ARCLENGTH_HACSTR(nsteps,arclen,solbar,deriv0,maxiter);
% The solution is known at s0 = 0; i.e. solbar
[sol_AL,TP]=ARCLENGTH_HACSTR(400,0.02,[sol(end,1) sol(end,2:end)],[0.5 0.5 0.5]',100);
sol=[sol;sol_AL];

subplot(211)
plot(sol_AL(:,1),sol_AL(:,2),'b.')
subplot(212)
plot(sol_AL(:,1),sol_AL(:,3),'b.')

