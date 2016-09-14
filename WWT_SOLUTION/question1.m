%script file 

x0=[0,0,0,0];
lb=[0,0,0,0];
ub=[1,1,1,1];
A=[-1 0 0 0;0 -1 0 0;-50/11 -70/11 -400/11 0;-30/25 -42/25 -240/25 -10];
B=[-0.8;-0.5;-300/11;-62/25];
[x,zval] = fmincon(@qn1,x0,A,B,[],[],lb,ub);

disp(['The optimal treatment levels are : ' num2str(x)])
disp(['The optimal treatment cost is : ' num2str(zval) ' Dollars'])

%results
%x =
% 0.8000    0.5000    0.5625   -0.0000
%zval =
% 12600