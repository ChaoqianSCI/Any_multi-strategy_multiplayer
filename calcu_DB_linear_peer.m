n=3; 
syms k
x=sym('x',[1,n]);
x(2)=1-x(1)-x(3);
q=sym('q',[n,n]);

for i=1:n
    for j=1:n
        if i==j
            q(i,j)=(k-2)/(k-1)*x(i)+1/(k-1);
        else
            q(i,j)=(k-2)/(k-1)*x(i);
        end
    end
end

bij=sym('bij',[n,n]);
ci=sym('ci',[1,n]);

syms r c alpha beta
bij(:,1)=r*c/(k+1);
bij(1,2)=0;bij(1,3)=r*c/(k+1);ci(1)=r*c/(k+1)-c;
bij(2,2)=0;bij(2,3)=r*c/(k+1)-beta;ci(2)=0;
bij(3,2)=-alpha;bij(3,3)=r*c/(k+1);ci(3)=r*c/(k+1)-c;

k_value=4;
r_value=2;c_value=1;
alpha_value=0.02;beta_value=0.5;
bij=double(subs(bij,{k,r,c,alpha,beta},{k_value,r_value,c_value,alpha_value,beta_value}))
ci=double(subs(ci,{k,r,c,alpha,beta},{k_value,r_value,c_value,alpha_value,beta_value}))


xjbij=sym('xjbij',[1,n]);
for i=1:n
    xjbij(i)=0;
    for j=1:n
        xjbij(i)=xjbij(i)+x(j)*bij(i,j);
    end
end
xjbji=sym('xjbji',[1,n]);
for i=1:n
    xjbji(i)=0;
    for j=1:n
        xjbji(i)=xjbji(i)+x(j)*bij(j,i);
    end
end
xjbjj=0;
for j=1:n
    xjbjj=xjbjj+x(j)*bij(j,j);
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

for i=[1:n]
    dx(i)=0;
    dx(i)=dx(i)+k*(k-2)*(k+1)/(k-1)^2*(ci(i)-xjcj);
    dx(i)=dx(i)+(k-2)*(3*k^2-4)/(k-1)^3*(bij(i,i)-xjbjj);
    dx(i)=dx(i)+(k-2)*(k^2-2)^2/(k-1)^3*(xjbij(i)-xjxlbjl);
    dx(i)=dx(i)-(k^2+2*k-4)*(k-2)/(k-1)^3*(xjbji(i)-xjxlbjl);
    dx(i)=dx(i)*(k-1)/k*x(i);
    dx(i)=subs(dx(i),{k},{k_value});
end



T=10;step=0.1;

xt=zeros(n,T);xt(:,1)=1/n;
needle=0;
for t=step:step:T
    needle=needle+1;
    dxt=zeros(n,1);
    for i=1:n
        dxt(i,1)=subs(dx(i),{x(1),x(3)},{xt(1,needle),xt(3,needle)});
    end
    xt(:,needle+1)=xt(:,needle)+dxt(:,1)*step;
end

hold on
for i=1:n
    plot(step:step:t,xt(i,1:needle))
end
legend()
