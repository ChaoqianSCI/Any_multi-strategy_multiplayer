n=4; 
syms k
x=sym('x',[1,n]);
x(4)=1-x(1)-x(2)-x(3);
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

syms r1 c1 r2 c2
bij(:,1)=r2*(r1*c1+c2)/(k+1);
bij(:,2)=r2*r1*c1/(k+1);
bij(:,3)=r2*c2/(k+1);
bij(:,4)=0;

ci(1)=r2*(r1*c1+c2)/(k+1)-c1-c2;
ci(2)=r2*r1*c1/(k+1)-c1;
ci(3)=r2*c2/(k+1)-c2;
ci(4)=0;

k_value=4;
r1_value=2;c1_value=1;
r2_value=2;c2_value=1;
bij=double(subs(bij,{k,r1,c1,r2,c2},{k_value,r1_value,c1_value,r2_value,c2_value}))
ci=double(subs(ci,{k,r1,c1,r2,c2},{k_value,r1_value,c1_value,r2_value,c2_value}))


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

for i=1:n
    dx(i)=0;
    dx(i)=dx(i)+(k+1)*(k*xjbij(i)+ci(i)-(k*xjxlbjl+xjcj));
    dx(i)=dx(i)+3*(bij(i,i)-xjbij(i)-xjbji(i)-xjbjj);
    dx(i)=dx(i)+6*xjxlbjl;
    dx(i)=dx(i)*(k-2)/(4*(k-1))*x(i);
    dx(i)=subs(dx(i),{k},{k_value});
end


T=100;step=1;

xt=zeros(n,T);xt(:,1)=1/n;
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
    plot(step:step:t,xt(i,1:needle),'Linewidth',5-i)
end
legend()
