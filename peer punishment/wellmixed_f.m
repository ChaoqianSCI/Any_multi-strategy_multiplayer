function dx=wellmixed_f(t,x,k,r,c,alpha,beta)
global dx;
dx=zeros(3,1);
dx(1)=x(1)*(k*((c*r*x(1))/(k + 1) + (c*r*x(3))/(k + 1)) - k*((c*r*x(1)^2)/(k + 1) - alpha*x(2)*x(3) - x(2)*x(3)*(beta - (c*r)/(k + 1)) + (c*r*x(3)^2)/(k + 1) + (c*r*x(1)*x(2))/(k + 1) + (2*c*r*x(1)*x(3))/(k + 1)) - c + x(1)*(c - (c*r)/(k + 1)) + x(3)*(c - (c*r)/(k + 1)) + (c*r)/(k + 1));
dx(2)=-x(2)*(k*((c*r*x(1)^2)/(k + 1) - alpha*x(2)*x(3) - x(2)*x(3)*(beta - (c*r)/(k + 1)) + (c*r*x(3)^2)/(k + 1) + (c*r*x(1)*x(2))/(k + 1) + (2*c*r*x(1)*x(3))/(k + 1)) + k*(x(3)*(beta - (c*r)/(k + 1)) - (c*r*x(1))/(k + 1)) - x(1)*(c - (c*r)/(k + 1)) - x(3)*(c - (c*r)/(k + 1)));
dx(3)=x(3)*(k*((c*r*x(1))/(k + 1) - alpha*x(2) + (c*r*x(3))/(k + 1)) - c - k*((c*r*x(1)^2)/(k + 1) - alpha*x(2)*x(3) - x(2)*x(3)*(beta - (c*r)/(k + 1)) + (c*r*x(3)^2)/(k + 1) + (c*r*x(1)*x(2))/(k + 1) + (2*c*r*x(1)*x(3))/(k + 1)) + x(1)*(c - (c*r)/(k + 1)) + x(3)*(c - (c*r)/(k + 1)) + (c*r)/(k + 1));
end



