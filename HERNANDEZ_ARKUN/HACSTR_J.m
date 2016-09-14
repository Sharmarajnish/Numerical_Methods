function Jac = HACSTR_J(x,param);

syms xx yy
func=[-xx+(0.072*(1-xx)*exp(yy/(1+(yy/20)))); -yy+(0.3*(param-yy))+(8*0.072*(1-xx)*exp(yy/(1+(yy/20))))];
Jac=jacobian(func,[xx yy]);

Jac=subs(Jac,[xx yy],[x(1) x(2)]);
