n=3; 
syms k
x=sym('x',[1,n]);x(2)=1-x(1)-x(3);
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

aiji=sym('aiji',[n,n]);
aijj=sym('aijj',[n,n]);
aIijj=sym('aIijj',[n,n,n]);

syms r c alpha beta
aiji(1,1)=r*c/(k+1)*(k-1)*(q(1,1)+q(3,1))+2*r*c/(k+1)-c;
aiji(1,2)=r*c/(k+1)*(k-1)*(q(1,1)+q(3,1))+r*c/(k+1)-c;
aiji(1,3)=r*c/(k+1)*(k-1)*(q(1,1)+q(3,1))+2*r*c/(k+1)-c;
aiji(2,1)=r*c/(k+1)*(k-1)*q(1,2)+(r*c/(k+1)-beta)*(k-1)*q(3,2)+r*c/(k+1);
aiji(2,2)=r*c/(k+1)*(k-1)*q(1,2)+(r*c/(k+1)-beta)*(k-1)*q(3,2);
aiji(2,3)=r*c/(k+1)*(k-1)*q(1,2)+(r*c/(k+1)-beta)*(k-1)*q(3,2)+r*c/(k+1)-beta;
aiji(3,1)=r*c/(k+1)*(k-1)*(q(1,3)+q(3,3))-alpha*(k-1)*q(2,3)+2*r*c/(k+1)-c;
aiji(3,2)=r*c/(k+1)*(k-1)*(q(1,3)+q(3,3))-alpha*(k-1)*q(2,3)+r*c/(k+1)-c;
aiji(3,3)=r*c/(k+1)*(k-1)*(q(1,3)+q(3,3))-alpha*(k-1)*q(2,3)+2*r*c/(k+1)-c;

aijj(1,1)=aiji(1,1);
aijj(1,2)=r*c/(k+1)*(k-1)*(q(1,2)+q(3,2))+r*c/(k+1)-c;
aijj(1,3)=r*c/(k+1)*(k-1)*(q(1,3)+q(3,3))+2*r*c/(k+1)-c;
aijj(2,1)=r*c/(k+1)*(k-1)*q(1,1)+(r*c/(k+1)-beta)*(k-1)*q(3,1)+r*c/(k+1);
aijj(2,2)=aiji(2,2);
aijj(2,3)=r*c/(k+1)*(k-1)*q(1,3)+(r*c/(k+1)-beta)*(k-1)*q(3,3)+r*c/(k+1)-beta;
aijj(3,1)=r*c/(k+1)*(k-1)*(q(1,1)+q(3,1))-alpha*(k-1)*q(2,1)+2*r*c/(k+1)-c;
aijj(3,2)=r*c/(k+1)*(k-1)*(q(1,2)+q(3,2))-alpha*(k-1)*q(2,2)+r*c/(k+1)-c;
aijj(3,3)=aiji(3,3);

aIijj(1,1,1)=r*c/(k+1)*(k-2)*(q(1,1)+q(3,1))+3*r*c/(k+1)-c;
aIijj(1,1,2)=r*c/(k+1)*(k-2)*(q(1,2)+q(3,2))+2*r*c/(k+1)-c;
aIijj(1,1,3)=r*c/(k+1)*(k-2)*(q(1,3)+q(3,3))+3*r*c/(k+1)-c;
aIijj(2,1,1)=r*c/(k+1)*(k-2)*q(1,1)+(r*c/(k+1)-beta)*(k-2)*q(3,1)+2*r*c/(k+1);
aIijj(2,1,2)=r*c/(k+1)*(k-2)*q(1,2)+(r*c/(k+1)-beta)*(k-2)*q(3,2)+r*c/(k+1);
aIijj(2,1,3)=r*c/(k+1)*(k-2)*q(1,3)+(r*c/(k+1)-beta)*(k-2)*q(3,3)+2*r*c/(k+1)-beta;
aIijj(3,1,1)=r*c/(k+1)*(k-2)*(q(1,1)+q(3,1))-alpha*(k-2)*q(2,1)+3*r*c/(k+1)-c;
aIijj(3,1,2)=r*c/(k+1)*(k-2)*(q(1,2)+q(3,2))-alpha*(k-2)*q(2,2)+2*r*c/(k+1)-c-alpha;
aIijj(3,1,3)=r*c/(k+1)*(k-2)*(q(1,3)+q(3,3))-alpha*(k-2)*q(2,3)+3*r*c/(k+1)-c;

aIijj(1,3,1)=r*c/(k+1)*(k-2)*(q(1,1)+q(3,1))+3*r*c/(k+1)-c;
aIijj(1,3,2)=r*c/(k+1)*(k-2)*(q(1,2)+q(3,2))+2*r*c/(k+1)-c;
aIijj(1,3,3)=r*c/(k+1)*(k-2)*(q(1,3)+q(3,3))+3*r*c/(k+1)-c;
aIijj(2,3,1)=r*c/(k+1)*(k-2)*q(1,1)+(r*c/(k+1)-beta)*(k-2)*q(3,1)+2*r*c/(k+1)-beta;
aIijj(2,3,2)=r*c/(k+1)*(k-2)*q(1,2)+(r*c/(k+1)-beta)*(k-2)*q(3,2)+r*c/(k+1)-beta;
aIijj(2,3,3)=r*c/(k+1)*(k-2)*q(1,3)+(r*c/(k+1)-beta)*(k-2)*q(3,3)+2*r*c/(k+1)-2*beta;
aIijj(3,3,1)=r*c/(k+1)*(k-2)*(q(1,1)+q(3,1))-alpha*(k-2)*q(2,1)+3*r*c/(k+1)-c;
aIijj(3,3,2)=r*c/(k+1)*(k-2)*(q(1,2)+q(3,2))-alpha*(k-2)*q(2,2)+2*r*c/(k+1)-c-alpha;
aIijj(3,3,3)=r*c/(k+1)*(k-2)*(q(1,3)+q(3,3))-alpha*(k-2)*q(2,3)+3*r*c/(k+1)-c;


dx=sym('dx',[1,n]);

for i=[1,3]
    sum1=0;
    for j=1:n
        sum2=0;
        for I=1:n
            sum3=0;
            for l=1:n
                sum3=sum3+q(l,I)*aijj(I,l);
            end
            sum2=sum2+q(I,j)*(aiji(I,j)+aIijj(I,i,j)+(k-1)*sum3);
        end
        sum1=sum1+q(j,i)*(aiji(i,j)+k*aijj(i,j)-sum2);
    end
    dx(i)=x(i)*sum1;
end

dx(1)
dx(3)
dx(1)=simplify(dx(1))
dx(3)=simplify(dx(3))

dx(2)=-dx(1)-dx(3)
dx(2)=simplify(dx(2))



T=10;step=0.1;
k_value=4;
r_value=2;c_value=1;
alpha_value=0.02;beta_value=0.5;

xt=zeros(n,T);xt(:,1)=1/n;
needle=0;
for t=step:step:T
    needle=needle+1;
    dxt=zeros(n,1);
    for i=1:n
        dxt(i,1)=(k_value-1)/k_value*double(subs(dx(i),{x(1),x(3),k,r,c,alpha,beta},{xt(1,needle),xt(3,needle),k_value,r_value,c_value,alpha_value,beta_value}));
    end
    xt(:,needle+1)=xt(:,needle)+dxt(:,1)*step;
end

hold on
for i=1:n
    plot(step:step:t,xt(i,1:needle))
end
legend()
