function [G1,K,d,T]=decouple(G)
G=ss(G);A=G.a;B=G.b;C=G.c;[n,m]=size(G.b);F=[ ];K0=[ ];
for j=1:m
    for k=0:n-1
        if norm(C(j,:)*A^k*B)>eps
            d(j)=k;break;
        end
    end
    F=[F;C(j,:)*A^d(j)*B];K0=[K0;C(j,:)*A^(d(j)+1)];
end
Gam=inv(F);K=Gam*K0;
G1=minreal(tf(ss(A-B*K,B,C,G.d)*Gam));