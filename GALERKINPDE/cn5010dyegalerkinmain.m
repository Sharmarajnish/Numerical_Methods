%  Main function for the Practice Problem 2 (MWR section; class notes) to 
%  be solved by the Galerkin Method
% 
%  3 Basis functions

syms z
f1=z-z^2;
f2=z^2-z^3;
f3=z^3-z^4;
 
M=[int(f1*f1,0,1) int(f1*f2,0,1) int(f1*f3,0,1);
    int(f2*f1,0,1) int(f2*f2,0,1) int(f2*f3,0,1); 
    int(f3*f1,0,1) int(f3*f2,0,1) int(f3*f3,0,1)];

M=eval(M);

b1=3-2*z;
b2=-2+(8*z)-(3*z*z);
b3=(-6*z)+(15*z*z)-(4*z*z*z);

B=[int(b1*f1,0,1) int(f1*b2,0,1) int(f1*b3,0,1);
    int(f2*b1,0,1) int(f2*b2,0,1) int(f2*b3,0,1); 
    int(f3*b1,0,1) int(f3*b2,0,1) int(f3*b3,0,1)];
B=eval(B);

C=B(:,1);

BS=inv(M)*B;
CS=inv(M)*C;

% ICS: 
a0=zeros(3,1);

% Call the ODE solver
[tt,aa] = ode45(@cn5010dyegalerkin,[0 0.5],a0,[],BS,CS);

zvals=0:0.01:1;
f1vals=[];f2vals=[];f3vals=[];
for i=1:length(zvals)
    f1vals=[f1vals;(subs(f1,z,zvals(i)))];
    f2vals=[f2vals;(subs(f2,z,zvals(i)))];
    f3vals=[f3vals;(subs(f3,z,zvals(i)))];
end

% Must now get the solution x(z,t)

xovals=f1vals; % Here, our xo(z) happens to be equal to the first basis function
a1=aa(:,1);a2=aa(:,2);a3=aa(:,3);

% Contribution of each basis function
u1mat=zeros(length(f1vals),length(a1));
u2mat=u1mat;
u3mat=u1mat;

for i=1:length(f1vals)
    for j=1:length(a1)
        u1mat(i,j)=f1vals(i)*a1(j);
        u2mat(i,j)=f2vals(i)*a2(j);
        u3mat(i,j)=f3vals(i)*a3(j);
    end
end

% Effective Response
umat=u1mat+u2mat+u3mat; % Sum of the three contributions (from basis functions)

u=umat+kron(ones(1,length(a1)),xovals);

surfc(tt,zvals,u)
xlabel('Time')
ylabel('Position')
zlabel('Mole Fraction of Dye')
