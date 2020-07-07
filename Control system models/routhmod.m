%Routh½µ½×
function G_r=routhmod(G_Sys,nr)
num=G_Sys.num{1};den=G_Sys.den{1};
n0=length(den);n1=length(num);
a1=den(end:-1:1);b1=[num(end:-1:1) zeros(1,n0-n1-1)];
for k=1:n0-1
    k1=k+2;alpha(k)=a1(k)/a1(k+1);beta(k)=b1(k)/a1(k+1);
    for i=k1:2:n0-1
        a1(i)=a1(i)-alpha(k)-a1(i+1);b1(i)=b1(i)-beta(k)*a1(i+1);
    end
end
nn=[];dd=[1];nn1=beta(i);dd1=[alpha(1),1];nred=nn1;dred=dd1;
for i=2:nr
    nred=[alpha(i)*nn1,beta(i)];dred=[alpha(i)*dd1,0];
    n0=length(dd);n1=length(dred);nred=nred+[zeros(1,n1-n0),nn];
    dred=dred+[zeros(1,n1-n0),dd];
    nn=nn1;dd=dd1;nn1=nred;dd1=dred;
end
G_r=tf(nred(nr:-1:1),dred(end:-1:1));