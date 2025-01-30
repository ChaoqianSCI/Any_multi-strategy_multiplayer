function dx=wellmixed_f(t,x,k,r,c,alpha,beta)
global dx;
dx=zeros(3,1);
dx(1)=x(1)*((1-x(1)-x(3))*(r*c/(k+1)-c)+x(3)*alpha+x(2)*beta*(1-(1-x(3))^k));
dx(2)=x(2)*(-(x(1)+x(3))*(r*c/(k+1)-c)+x(3)*alpha-(1-x(2))*beta*(1-(1-x(3))^k));
% dx(3)=x(3)*((1-x(1)-x(3))*(r*c/(k+1)-c)-(1-x(3))*alpha+x(2)*beta*(1-(1-x(3))^k));
dx(3)=-dx(1)-dx(2);
end



