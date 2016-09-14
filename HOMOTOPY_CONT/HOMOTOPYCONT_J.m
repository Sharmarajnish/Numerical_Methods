function Jac = HOMOTOPYCONT_J(x,lamb);

syms xx

func=(lamb*((240*(xx^2))+(40*(xx^1.75))-200))+((1-lamb)*(xx-205));

Jac=jacobian(func,[xx]);

Jac=subs(Jac,[xx],[x]);
