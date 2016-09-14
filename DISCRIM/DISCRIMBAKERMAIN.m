% The main file
%
% Initial guess for the parameters
% 
clear all; close all;

maxdiscrim=0;
parinit=[];
PAROPT=[];

for i=1:100

t1=(rand(1,1)*72);
PAR0=[(rand(1,1)*30)+5 t1 (rand(1,1)*30)+5  (rand(1,1)*(72-t1))+t1 (rand(1,1)*30)+5];

% Determine the optimal values for parameters
% 

[PARopt,fval]=fmincon(@discrimbaker15082008,PAR0,[],[],[],[],[5 0 5 0 5],[35 72 35 72 35]);

if -fval > maxdiscrim
    maxdiscrim=-fval;
    parinit=PAR0;
    PAROPT=PARopt;
end

format bank
[i (maxdiscrim)]

end

disp(['Maximum Discimination: ', num2str((maxdiscrim))])
options = odeset('NonNegative',[1 2]);
ode1 = @(t,x) discrim_model1_ode(t,x,PAROPT);
[tt1,xx1]=ode45(ode1,[0:0.75:72],[1 0.01],options);

ode2 = @(t,x) discrim_model2_ode(t,x,PAROPT);
[tt2,xx2]=ode45(ode2,[0:0.75:72],[1 0.01],options);

ode3 = @(t,x) discrim_model3_ode(t,x,PAROPT);
[tt3,xx3]=ode45(ode3,[0:0.75:72],[1 0.01],options);

ode4 = @(t,x) discrim_model4_ode(t,x,PAROPT);
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

figure
plot(tt1,[xx1(:,1) xx2(:,1) xx3(:,1) xx4(:,1)])

figure
plot(tt1,[xx1(:,2) xx2(:,2) xx3(:,2) xx4(:,2)])

figure
plot([0:0.75:PAROPT(2)],PAROPT(1)*ones(length([0:0.75:PAROPT(2)]),1),'*')
hold on
plot([PAROPT(2):0.75:PAROPT(4)],PAROPT(3)*ones(length([PAROPT(2):0.75:PAROPT(4)]),1),'*')
plot([PAROPT(4):0.75:72],PAROPT(5)*ones(length([PAROPT(4):0.75:72]),1),'*')
line([PAROPT(2) PAROPT(2)],[PAROPT(1) PAROPT(3)])
line([PAROPT(4) PAROPT(4)],[PAROPT(3) PAROPT(5)])