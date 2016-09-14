function soln=EulerN_HOMOTOPYCONT(x,lambda);
%Euler-Newton scheme

n=length(lambda);
dparam=diff(lambda); %compute delq
for i=1:n
    lambda(i)
   x=newton('HOMOTOPYCONT_F','HOMOTOPYCONT_J',x,lambda(i),1.0e-12);   %Newton
   soln(i,1)=lambda(i);soln(i,2)=x'; %Save solution
   
   if (i ~= n) %Extrapolate

     dxdparam=-HOMOTOPYCONT_J(x,lambda(i))\HOMOTOPYCONT_DfDparam(x,lambda(i));
     x = x + dxdparam * dparam(i);
   else
      break
  end
end