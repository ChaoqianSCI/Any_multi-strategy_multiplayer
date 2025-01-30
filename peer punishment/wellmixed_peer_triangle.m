n=3; 


k=4;
r=3;c=1;
alpha=0.7;beta=0.7;




% for ang=1.098:0.0001:1.099
% for ang=1.0986


k=4;
r=3;c=1;
alpha=0.7;beta=5;

% for ang=1.02:0.0001:1.03
% for ang=1.0222
for ang=0.5

angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);


ang
if y(length(y(:,1)),2)>0.9
    break
end

end




plot(t,y(:,:))