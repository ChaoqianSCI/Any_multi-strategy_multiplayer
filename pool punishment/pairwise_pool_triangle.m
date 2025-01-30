n=3; 
syms k
x=sym('x',[1,n]);

syms r c alpha beta


k_value=4;
r_value=3;c_value=1;
alpha_value=0.7;beta_value=3;


dx=sym('dx',[1,n]);
dx(1)=x(1)*(x(2)*(r*c/(k+1)-c)+alpha*x(3)+beta*x(2)*(1-(1-(k-2)/(k+1)*x(3))*(1-(k-2)/(k-1)*x(3))^(k-1)));
dx(3)=x(3)*(x(2)*(r*c/(k+1)-c)-alpha*(1-x(3))+beta*x(2)*(1-(k-1)/(k+1)*(1-(k-2)/(k-1)*x(3))^k));
dx(2)=-dx(1)-dx(3);

for i=1:3
    dx(i)=(k-2)*(k+1)/(4*(k-1))*dx(i);
    dx(i)=subs(dx(i),{k,r,c,alpha,beta},{k_value,r_value,c_value,alpha_value,beta_value});
end

T=100;step=0.1;

xt=zeros(n,T);
xt(:,1)=1/n;
% xt(1,1)=0;xt(2,1)=0.98;xt(3,1)=1-xt(2,1);
% xt(3,1)=(k_value-1)/(k_value-2)*(1-nthroot((k_value+1)/(k_value-1)*(1+(r_value*c_value/(k_value+1)-c_value-alpha_value)/beta_value),k_value));xt(2,1)=1-xt(3,1);xt(1,1)=1-xt(2,1)-xt(3,1);

needle=0;
for t=step:step:T
    needle=needle+1;
    dxt=zeros(n,1);
    for i=1:n
        dxt(i,1)=subs(dx(i),{x(1),x(2),x(3)},{xt(1,needle),xt(2,needle),xt(3,needle)});
    end
    xt(:,needle+1)=xt(:,needle)+dxt(:,1)*step;
end

hold on
for i=1:n
    plot(step:step:t,xt(i,1:needle))
end
legend()

r_value*c_value/(k_value+1)-c_value-alpha_value+2*beta_value/(k_value+1)
