n=3; 
syms k
x=sym('x',[1,n]);

bij=sym('bij',[n,n]);
ci=sym('ci',[1,n]);

syms r c alpha beta
bij(:,1)=r*c/(k+1);
bij(1,2)=0;bij(1,3)=r*c/(k+1);ci(1)=r*c/(k+1)-c;
bij(2,2)=0;bij(2,3)=r*c/(k+1)-beta;ci(2)=0;
bij(3,2)=-alpha;bij(3,3)=r*c/(k+1);ci(3)=r*c/(k+1)-c;


k_value=4;
r_value=3;c_value=1;
alpha_value=0.7;beta_value=0.7;
bij=double(subs(bij,{k,r,c,alpha,beta},{k_value,r_value,c_value,alpha_value,beta_value}))
ci=double(subs(ci,{k,r,c,alpha,beta},{k_value,r_value,c_value,alpha_value,beta_value}))


xjbij=sym('xjbij',[1,n]);
for i=1:n
    xjbij(i)=0;
    for j=1:n
        xjbij(i)=xjbij(i)+x(j)*bij(i,j);
    end
end
xjxlbjl=0;
for j=1:n
    for l=1:n
        xjxlbjl=xjxlbjl+bij(j,l)*x(j)*x(l);
    end
end
xjxlbjl=simplify(xjxlbjl);
xjcj=0;
for j=1:n
    xjcj=xjcj+x(j)*ci(j);
end



dx=sym('dx',[1,n]);

for i=1:n
    dx(i)=0;
    dx(i)=dx(i)+(k*xjbij(i)+ci(i)-(k*xjxlbjl+xjcj));
    dx(i)=dx(i)*x(i);
    dx(i)=subs(dx(i),{k},{k_value});
end


T=100;step=1;

xt=zeros(n,T);
% xt(:,1)=1/n;
xt(2,1)=0.001;xt(1,1)=0.85;xt(3,1)=0.199;
% xt(1,1)=0;xt(3,1)=1/(k_value*(alpha_value+beta_value))*(-r_value*c_value/(k_value+1)+c_value+k_value*alpha_value);xt(2,1)=1-xt(3,1);

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


1+(r_value/(k_value+1)-c_value)*c_value/(k_value*beta_value)
