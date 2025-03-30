
%% unable to find closed form solution as function of time t for even the linear peer punishment model
syms x1(t) x3(t)
syms x10 x30

syms alpha beta r c k 
ode1 = diff(x1, t) == (k-2)/(2*(k-1))* x1*((k+1)*((1-x1-x3)*(r*c/(k+1)-c)+k*(1-x1-x3)*x3*(alpha+beta))-6*(1-x1-x3)*x3*(alpha+beta));
ode2 = diff(x3, t) == (k-2)/(2*(k-1))*x3*(((k+1)*((1-x1-x3)*(r*c/(k+1)-c)+k*(1-x1-x3)* x3* (alpha+beta)-(1-x1-x3)* alpha))-6*(1-x1-x3)*x3* (alpha+beta)+3*(1-x1-x3)* (alpha+beta));

% 初始条件
conds = [x1(0) == x10, x3(0) == x30];

% 求解微分方程组
sol = dsolve([ode1, ode2], conds);

% 显示并简化结果
x1Sol = simplify(sol.x1)
x3Sol = simplify(sol.x3)

