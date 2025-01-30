function dx=wellmixed_f(t,x,k,r,c,alpha,beta)
global dx;
dx=zeros(3,1);
dx(1)=x(1)*((1-x(1)-x(3))*(r*c/(k+1)-c)+x(3)*(1-x(1)-x(3))*beta+x(3)*(x(1)+x(3))*alpha);
dx(2)=x(2)*(-(x(1)+x(3))*(r*c/(k+1)-c)-x(3)*(x(1)+x(3))*beta+x(3)*(x(1)+x(3))*alpha);
dx(3)=x(3)*((1-x(1)-x(3))*(r*c/(k+1)-c)+x(3)*(1-x(1)-x(3))*beta-(1-x(3))*(x(1)+x(3))*alpha);
end



