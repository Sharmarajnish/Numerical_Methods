TOTALITER=0;
delta_l=-0.01;
LVEC=2:delta_l:1; 

sol=[];

for i=1:length(LVEC)
    L=LVEC(i);
    
    if isempty(sol)
        x0=1.5;
    else
        x0=sol(end,2);PREVL=sol(end,1);
        % This needs to be corrected by the value (dx/dlambda)*(delta_l)
        dx_by_dlambda=(x0-(2*PREVL)+3.75+((x0-2)^2))/(1-PREVL+((x0-2)^2)+(((2*x0)-4)*(x0-PREVL+2.75)));
        x0=x0+(dx_by_dlambda*delta_l);
    end
    
    x = x0;
    convflag=0;
    iter=0;
    
    while convflag==0 & iter < 100
        
        f=(1-L+(x-2)^2)*(x-L+2.75);
        df=((((2*x)-4))*(x-L+2.75))+1-L+((x-2)^2);
        
        xnew=x-(f/df);
        
        if abs(xnew-x) < 1e-12
            convflag=1;
            TOTALITER=TOTALITER+iter;
        else
            x=xnew;
            iter=iter+1;
        end
    end
    
    sol=[sol;[L xnew]];
    
end
    
plot(sol(:,1),sol(:,2),'r')
xlabel('Lambda')
ylabel('Solution x')
TOTALITER