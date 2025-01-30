n=3; 

k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

xt(1:3,1)=1/n;

tspan=[0:0.01:10];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f_2(t,y,k,r,c,alpha,beta),tspan,xt(:,1));


plot(t,y(:,:))
%%
% for ang=1.06:0.0001:1.07
for ang=1.0650

% for ang=1
angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);


ang
if y(length(y(:,1)),2)>0.9
    break
end

end



plot(t,y(:,:))



% limitbeta=(k+1)/3*(-r*c/(k+1)+c+k*alpha)-alpha