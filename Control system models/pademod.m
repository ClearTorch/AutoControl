%Pade降解函数 r,k分别为降解后的分子，分母阶次
function G_r=pademod(G_Sys,r,k)
c=timmomt(G_Sys,r+k+1);G_r=pade_app(c,r,k);

function Gr=pade_app(c,r,k)
w=-c(r+2:r+k+1)';
vv=[c(r+1:-1:1)';zeros(k-1-r,1)];
W=rot90(hankel(c(r+k:-1:r+1),vv));
V=rot90(hankel(c(r:-1:1)));
x=[1 (W\w)'];
dred=x(k+1:-1:1)/x(k+1);
y=[c(1) x(2:r+1)*V'+c(2:r+1)];
nred=y(r+1:-1:1)/x(k+1);Gr=tf(nred,dred);

function M=timmomt(G,k)
G=ss(G);C=G.c;B=G.b;iA=inv(G.a);
iA1=iA;M=zeros(1,k);
for i=1:k
    M(i)=-C*iA*B;iA1=iA*iA1;
end