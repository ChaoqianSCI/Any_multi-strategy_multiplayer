n=3; 
syms k
x=sym('x',[1,n]);

syms r c alpha beta


k_value=4;
r_value=4;c_value=1;
alpha_value=0.2;beta_value=1.5;

pi=sym('pi',[1,n]);
pi(1)=r*c/(k+1)*(x(1)+x(3))+r*c/(k+1)-c;
pi(2)=r*c/(k+1)*(x(1)+x(3))-beta*(1-(1-x(3))^k);
pi(3)=r*c/(k+1)*(x(1)+x(3))+r*c/(k+1)-c-alpha;
avepi=sum(x(1:n).*pi(1:n));

dx=sym('dx',[1,n]);
for i=1:n
    dx(i)=x(i)*(pi(i)-avepi);
    dx(i)=subs(dx(i),{k,r,c,alpha,beta},{k_value,r_value,c_value,alpha_value,beta_value});
end


T=100;step=0.1;

xt=zeros(n,T);
xt(:,1)=1/n;
% xt(1,1)=0;xt(2,1)=0.5;xt(3,1)=1-xt(2,1);
% xt(2,1)=nthroot(1+(r_value*c_value/(k_value+1)-c_value-alpha_value)/beta_value,k_value);xt(3,1)=1-xt(2,1);xt(1,1)=1-xt(2,1)-xt(3,1);

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

