%Iterative learning control for mobile robot path-tracking
clear all;
close all;

ts=0.001;                     %Sample time
for k=1:1:2001
    xd(k)=cos((k-1)*pi*ts);
    yd(k)=sin((k-1)*pi*ts);
    thd(k)=ts*pi*(k-1)+pi/2;
end

for k=1:1:2001
   u1(k)=0;u2(k)=0;
   e1(k)=0;e2(k)=0;
   e3(k)=0;
end
y0=[1;0;pi/2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=500;
for i=0:1:M    % Start Learning Control for M Times
i
pause(0.05);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:1:2001
if k==1
    q=y0;
end
xp(k)=q(1);
yp(k)=q(2);
th(k)=q(3);
qd=[xd(k);yd(k);thd(k)];
ce1(k)=qd(1)-q(1);       % Current error of time k
ce2(k)=qd(2)-q(2);                  
ce3(k)=qd(3)-q(3);                  
u=[u1(k);u2(k)];
B=ts*[cos(q(3)) 0
      sin(q(3)) 0 
          0     1];
L1=0.10*[cos(q(3)) sin(q(3)) 0;
    0 0 1];
L2=L1;

cond=norm(eye(2)-L1*B);   % Conditions: cond must be smaller than 1.0

U=u+L1*[e1(k);e2(k);e3(k)]+L2*[ce1(k);ce2(k);ce3(k)];
u1(k)=U(1);
u2(k)=U(2);
u=[u1(k);u2(k)];
q=q+B*u;

e1(k)=cos(k*ts*pi)-q(1);   % Error of previous time k+1
e2(k)=sin(k*ts*pi)-q(2);
e3(k)=ts*k*pi+pi/2-q(3);
end                  % End of k
figure(1);
hold on;
plot(xd,yd,'r',xp,yp,'b');
xlabel('xd xp');ylabel('yd,yp');

j=i+1;
times(j)=j-1;
e1i(j)=max(abs(ce1));
e2i(j)=max(abs(ce2));
e3i(j)=max(abs(ce3));
end          %End of i
figure(2);
plot(xd,yd,'r',xp,yp,'b');
xlabel('xd xp');ylabel('yd,yp');
figure(3);
plot(times,e1i,'*-r',times,e2i,'o-b',times,e3i,'o-k');
title('Change of maximum absolute value of e1,e2 and angle with times i');
xlabel('times');ylabel('e1,e2 and angle');