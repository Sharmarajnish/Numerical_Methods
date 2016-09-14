function f = ADIABATIC_F(x,param);

f=1-x-param*1e9*x*exp(-25.2/(1.5-(0.5*x)));
