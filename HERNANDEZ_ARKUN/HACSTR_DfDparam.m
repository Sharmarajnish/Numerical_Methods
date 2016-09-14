function dfdparam = HACSTR_DfDparam(x,param);

syms xx yy param
func=[-xx+(0.072*(1-xx)*exp(yy/(1+(yy/20)))); -yy+(0.3*(param-yy))+(8*0.072*(1-xx)*exp(yy/(1+(yy/20))))];
dfdparam=jacobian(func,param);

dfdparam=subs(dfdparam,[xx yy],[x(1) x(2)]);

