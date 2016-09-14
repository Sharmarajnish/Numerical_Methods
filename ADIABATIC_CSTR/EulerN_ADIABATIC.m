function soln=EulerN_ADIABATIC(x,param);
%Euler-Newton scheme

n=length(param);
dparam=diff(param); %compute delq
for i=1:n
    param(i)
   x=newton('ADIABATIC_F','ADIABATIC_J',x,param(i),1.0e-15);   %Newton
   soln(i,1)=param(i);soln(i,2)=x'; %Save solution
   if (i ~= n) %Extrapolate
     dxdparam=-ADIABATIC_J(x,param(i))\ADIABATIC_DfDparam(x,param(i));
     x = x + dxdparam * dparam(i); 
   else
      break
  end
end