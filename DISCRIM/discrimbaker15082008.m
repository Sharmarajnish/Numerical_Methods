function [discrim]=discrimbaker15082008(PARVEC);

options = odeset('NonNegative',[1 2]);

ode1 = @(t,x) discrim_model1_ode(t,x,PARVEC);
[tt1,xx1]=ode45(ode1,[0:0.75:72],[1 0.01],options);

ode2 = @(t,x) discrim_model2_ode(t,x,PARVEC);
[tt2,xx2]=ode45(ode2,[0:0.75:72],[1 0.01],options);

ode3 = @(t,x) discrim_model3_ode(t,x,PARVEC);
[tt3,xx3]=ode45(ode3,[0:0.75:72],[1 0.01],options);

ode4 = @(t,x) discrim_model4_ode(t,x,PARVEC);
[tt4,xx4]=ode45(ode4,[0:0.75:72],[1 0.01],options);

discrim=0;
e12=xx1-xx2;
discrim=discrim+sum(sum(e12.^2));

e13=xx1-xx3;
discrim=discrim+sum(sum(e13.^2));

e14=xx1-xx4;
discrim=discrim+sum(sum(e14.^2));

e23=xx2-xx3;
discrim=discrim+sum(sum(e23.^2));

e24=xx2-xx4;
discrim=discrim+sum(sum(e24.^2));

e34=xx3-xx4;
discrim=discrim+sum(sum(e34.^2));

discrim=-(discrim);