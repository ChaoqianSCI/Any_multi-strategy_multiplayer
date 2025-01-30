function dx=PC_f_2(t,x,k,r,c,alpha,beta)
global dx;
dx=zeros(3,1);
dx(1)=(x(1)*(k - 2)/(2*k - 2)*((k + 1)*(k*((c*r*x(1))/(k + 1) + (c*r*x(3))/(k + 1)) - c - k*(alpha*x(3)^2 - beta*x(3) - alpha*x(3) + beta*x(3)^2 + alpha*x(1)*x(3) + beta*x(1)*x(3) + (c*r*x(1))/(k + 1) + (c*r*x(3))/(k + 1)) + x(1)*(c - (c*r)/(k + 1)) + x(3)*(c - (c*r)/(k + 1)) + (c*r)/(k + 1)) - 6*beta*x(3) - 6*alpha*x(3) + 6*alpha*x(3)^2 + 6*beta*x(3)^2 + (3*c*r)/(k + 1) + 6*alpha*x(1)*x(3) + 6*beta*x(1)*x(3) + (3*c*r*(x(1) + x(3) - 1))/(k + 1) - (3*c*r*x(1))/(k + 1) - (3*c*r*x(3))/(k + 1)));
dx(2)=-((k - 2)/(2*k - 2)*(x(1) + x(3) - 1)*(6*alpha*x(3)^2 - 6*beta*x(3) - (k + 1)*(k*(alpha*x(3)^2 - beta*x(3) - alpha*x(3) + beta*x(3)^2 + alpha*x(1)*x(3) + beta*x(1)*x(3) + (c*r*x(1))/(k + 1) + (c*r*x(3))/(k + 1)) + k*(x(3)*(beta - (c*r)/(k + 1)) - (c*r*x(1))/(k + 1)) - x(1)*(c - (c*r)/(k + 1)) - x(3)*(c - (c*r)/(k + 1))) - 3*alpha*x(3) + 6*beta*x(3)^2 + 3*x(3)*(beta - (c*r)/(k + 1)) + 6*alpha*x(1)*x(3) + 6*beta*x(1)*x(3) + (3*c*r*x(3))/(k + 1)));
dx(3)=-(x(3)*(k - 2)/(2*k - 2)*(3*alpha*(x(1) + x(3) - 1) + 6*alpha*x(3) + 6*beta*x(3) - (k + 1)*(k*(alpha*(x(1) + x(3) - 1) + (c*r*x(1))/(k + 1) + (c*r*x(3))/(k + 1)) - k*(alpha*x(3)^2 - beta*x(3) - alpha*x(3) + beta*x(3)^2 + alpha*x(1)*x(3) + beta*x(1)*x(3) + (c*r*x(1))/(k + 1) + (c*r*x(3))/(k + 1)) - c + x(1)*(c - (c*r)/(k + 1)) + x(3)*(c - (c*r)/(k + 1)) + (c*r)/(k + 1)) - 6*alpha*x(3)^2 - 6*beta*x(3)^2 + 3*(beta - (c*r)/(k + 1))*(x(1) + x(3) - 1) - (3*c*r)/(k + 1) - 6*alpha*x(1)*x(3) - 6*beta*x(1)*x(3) + (3*c*r*x(1))/(k + 1) + (3*c*r*x(3))/(k + 1)));
end



