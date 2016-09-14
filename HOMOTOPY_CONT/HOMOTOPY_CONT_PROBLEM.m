% The program implements the homotopy continuation method to solve
% a "difficult" problem F(x) = 240 x^2 + 40 x^1.75 - 200 = 0 using
% fixed point homotopy with G(x) = x - 205. 

clear
close all

% Start with Euler Newton
sol=EulerN_HOMOTOPYCONT(205,[0:1e-5:1e-4 1e-4:1e-4:1e-3 1e-3:1e-3:1e-2 1e-2:1e-2:1e-1 1e-1:5e-2:1]);
plot(sol(:,1),sol(:,2),'r.')

