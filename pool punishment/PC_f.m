function dx=PC_f(t,x,k,r,c,alpha,beta)
global dx;
dx=zeros(3,1);
dx(1)=(k-2)*(k+1)/(2*(k-1))*x(1)*((1-x(1)-x(3))*(r*c/(k+1)-c)+x(3)*alpha+(1-x(1)-x(3))*beta*(1-(1-(k-2)/(k+1)*x(3))*(1-(k-2)/(k-1)*x(3))^(k-1)));
dx(3)=(k-2)*(k+1)/(2*(k-1))*x(3)*((1-x(1)-x(3))*(r*c/(k+1)-c)-(1-x(3))*alpha+(1-x(1)-x(3))*beta*(1-(k-1)/(k+1)*(1-(k-2)/(k-1)*x(3))^k));
dx(2)=-dx(1)-dx(3);
end



