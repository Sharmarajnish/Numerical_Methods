function Jac = ADIABATIC_J(x,param);

Jac=-1-1000000000*param*exp(-126/5/(3/2-1/2*x))+12600000000*param*x/(3/2-1/2*x)^2*exp(-126/5/(3/2-1/2*x));
