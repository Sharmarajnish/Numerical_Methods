function [dxdtm3]=discrim_model3_ode(t,x,PARVEC);

% PARVEC(1) = u2 level between time = 0 and time = t1 hours
% PARVEC(2) = time at which 1st change is implemented (i.e. t1)
% PARVEC(3) = u2 level between time = t1 and time = t2 hours
% PARVEC(4) = time at which 2nd change is implemented (i.e. t2)
% PARVEC(5) = u2 level between time = t2 and time = 72 hours

if t <= PARVEC(2)
    u=PARVEC(1);
elseif t > PARVEC(2) & t <= PARVEC(4)
    u=PARVEC(3);
else
    u=PARVEC(5);
end

dxdtm3(1)= (((0.12*x(2))-0.2)*x(1))-(0.02*x(1));
dxdtm3(2)= -(0.12*x(2)*x(1)/0.56) + (0.2*(u-x(2)));

dxdtm3=dxdtm3';