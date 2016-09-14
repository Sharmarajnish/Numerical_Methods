function dfdparam = ADIABATIC_DfDparam(x,param);

dfdparam=-1e9*x*exp(-25.2/(1.5-(0.5*x)));