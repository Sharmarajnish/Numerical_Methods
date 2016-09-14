function solu=newton(Fun1,Fun2,x0,q,convtol);
%Newton scheme

convflag=0;
x=x0;

while convflag==0,

FVAL=feval(Fun1,x,q);
JVAL=feval(Fun2,x,q);

if isreal(FVAL)==0,
    FVAL=subs(FVAL,'param',q);
end

if isreal(JVAL)==0,
    JVAL=subs(JVAL,q);
end


delx = (-inv(JVAL)*FVAL);


if norm((delx)) <= convtol
    convflag=1;
    solu=subs(x,'param',q);
else
    x=x+delx;
end

end
