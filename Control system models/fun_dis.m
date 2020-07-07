% 微分方程化为标准型 diffx=A*x(t)
function xdot=fun_dis(t,x)
Vs=1.5;R=1.6;L=2.1;C=3.0;
xdot=[x(2)/C;1/L*(Vs-x(1)-R*x(2))];