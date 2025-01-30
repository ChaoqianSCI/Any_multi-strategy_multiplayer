n=2; 
syms k
x=sym('x',[1,n]);x(2)=1-x(1);
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

syms r c
aiji(1,1)=r*c/(k+1)*(k-1)*q(1,1)+2*r*c/(k+1)-c;
aiji(2,1)=r*c/(k+1)*(k-1)*q(1,2)+r*c/(k+1);
aiji(1,2)=r*c/(k+1)*(k-1)*q(1,1)+r*c/(k+1)-c;
aiji(2,2)=r*c/(k+1)*(k-1)*q(1,2);

aijj(1,1)=aiji(1,1);
aijj(2,1)=r*c/(k+1)*(k-1)*q(1,1)+r*c/(k+1);
aijj(1,2)=r*c/(k+1)*(k-1)*q(1,2)+r*c/(k+1)-c;
aijj(2,2)=aiji(2,2);

aIijj(1,1,1)=r*c/(k+1)*(k-2)*q(1,1)+3*r*c/(k+1)-c;
aIijj(2,1,1)=r*c/(k+1)*(k-2)*q(1,1)+2*r*c/(k+1);
aIijj(1,1,2)=r*c/(k+1)*(k-2)*q(1,2)+2*r*c/(k+1)-c;
aIijj(2,1,2)=r*c/(k+1)*(k-2)*q(1,2)+r*c/(k+1);


dx=sym('dx',[1,n]);

for i=1:n-1
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
simplify(dx(1))

double(subs(dx(1),{x(1),k,r,c},{0.5,4,4,1}))
