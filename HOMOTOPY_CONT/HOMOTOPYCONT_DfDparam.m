function dfdparam = HOMOTOPYCONT_DfDparam(x,lamb);

syms xx para
func=(para*((240*(xx^2))+(40*(xx^1.75))-200))+((1-para)*(xx-205));
dfdparam=jacobian(func,para);

dfdparam=(subs(dfdparam,[xx para],[x lamb]));



