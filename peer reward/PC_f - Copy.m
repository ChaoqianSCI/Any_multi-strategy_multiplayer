function dx=PC_f(t,x,k,r,c,alpha,beta)
global dx;
dx=zeros(3,1);
dx(1)=(k-2)/(2*(k-1))*x(1)*((k+1)*((1-x(1)-x(3))*(r*c/(k+1)-c)+x(3)*(1-x(1)-x(3))*beta+x(3)*(x(1)+x(3))*alpha)-6*(1-x(1)-x(3))*x(3)*(beta-alpha)/k);
dx(2)=(k-2)/(2*(k-1))*x(2)*((k+1)*(-(x(1)+x(3))*(r*c/(k+1)-c)-x(3)*(x(1)+x(3))*beta+x(3)*(x(1)+x(3))*alpha)-3*x(3)*(1-2*x(1)-2*x(3))*(beta-alpha)/k);
dx(3)=(k-2)/(2*(k-1))*x(3)*((k+1)*((1-x(1)-x(3))*(r*c/(k+1)-c)+x(3)*(1-x(1)-x(3))*beta-(1-x(3))*(x(1)+x(3))*alpha)+3*(1-x(1)-x(3))*(1-2*x(3))*(beta-alpha)/k);
end



