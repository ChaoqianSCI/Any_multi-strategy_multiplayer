n=3; 

k=4;
r=2;c=1;
alpha=0.1;beta=1.2;

% xt(1:3,1)=1/n;
xt(2,1)=k*(k+1)*alpha/(3*(beta-alpha)+k*(k+1)*alpha);xt(3,1)=(-r*c/(k+1)+c)/(beta-3*(beta-alpha)/(k*(k+1)));xt(1,1)=1-xt(2,1)-xt(3,1);
% xt(1,1)=0;xt(2,1)=0.5;xt(3,1)=1-xt(1,1)-xt(2,1);

tspan=[0:0.01:1000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(1:2,1));
y(:,3)=1-y(:,1)-y(:,2);

plot(t,y(:,:))
% plot(t,y(:,1)+y(:,2)+y(:,3))

ylim([-1 2])

k*(k+1)/3*(-r*c/(k+1)+c)+alpha
k*(k+1)/(k*(k+1)-3)*(-r*c/(k+1)+c)+alpha
(k*(k+1)*(-r*c/(k+1)+c)-3*alpha)/(k*(k+1)-3)


%%
hold on
% xlim([0 1.5])
ylim([0 0.2])
alpha=[0:0.01:0.2];
beta=k*(k+1)/(k*(k+1)-3)*(-r*c/(k+1)+c)+alpha;
plot(beta,alpha)

beta=k*(k+1)/3*(-r*c/(k+1)+c)+alpha;
plot(beta,alpha)
box on

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



%%

syms x1 x2 x3 a b r c k
x2=k*(k+1)*a/(k*(k+1)*a+3*(b-a));
x3=k*(k+1)/(k*(k+1)*b-3*(b-a))*(-r*c/(k+1)+c);
x1=1-x2-x3;

result=(1-x1-2*x3)*(r*c/(k+1)-c+3*(b-a)/(k*(k+1)))+(2-2*x1-3*x3)*x3*(b-6*(b-a)/(k*(k+1)))-(1-2*x3)*x1*a-(2-3*x3)*x3*a

factor(result)
