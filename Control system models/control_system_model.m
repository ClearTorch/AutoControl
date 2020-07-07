% % I 微分方程模型         (RLC电路无源网络微分方程模型)

% clear all
% t0=0.1; tfinal=10;x0=[0.2;0];
% [t,x]=ode45('fun_dis',[t0,tfinal],x0);
% figure(1);subplot(2,1,1);plot(t,x(:,1));grid;
% title('电容电压/V');xlabel('时间/s');subplot(2,1,2);plot(t,x(:,2));
% grid;title('电感电流/A');xlabel('时间/s');figure(2);vc=x(:,1);i=x(:,2);
% plot(vc,i);grid;title('电感电流与电容电压的关系曲线');xlabel('电容电压/v');ylabel('电感电流/A');

% % II传递函数模型

% 1 拉氏变换及反变换 laplace,ilaplace
% syms a t;f=1-(1+a*t)*exp(-a*t);Fs=laplace(f)
% syms s;G=(s+3)/s/(s^4+2*s^3+11*s^2+18*s+18);
% y=simplify(ilaplace(G))
% fplot(y,[0,10]);grid;
% xlabel('time/s');ylabel('respond');

% （不同形式的传递函数表达式选用不同形式的输入方式）
% 1 标准形式 用分子分母系数矩阵（按阶数递减）输入 
% num=[12 24 12 20];den=[2 4 6 2 2];
% G=tf(num,den)  %无延迟
% tao=3;
% Gdelay=tf(num,den,'InputDelay',tao) %输入延迟

% 2  零极点模型
% z=[1 2];p=[1 2 1 3];k=1;tao=3;
% % G=zpk(z,p,k)                  %无延迟
% G=zpk(z,p,k,'OutputDelay',tao)  %有延迟

% 2 混合形式  定义拉式算子 s=tf('s')
% s=tf('s');G=(s^3+2*s^2+3*s+4)/(s^3*(s+2)*(s+5)^2+5)

% %改变传递函数参数
% 1 添加延迟时间参数
% G.ioDelay=tao;  %多个延迟时间可用矩阵；
% % 2改变复域变量为 p
% G.Variable='p';

% %III 状态空间模型 ss(A,B,C,D) 时不变

% A=[-12 -17.2 -16.8 -11.9;6 8.6 8.4 6;6 8.7 8.4 6;-5.9 -8.6 -8.3 -6];
% B=[1.5 0.2;1 0.3;2 1;0 0.5];C=[2 0.5 0 0.8;0.3 0.3 0.2 1];D=zeros(2,2);
% G=ss(A,B,C,D) %无延迟
% taoi=[2;2;3];taoo=[3;1;2];
% Gdelay=ss(A,B,C,D,'InputDelay',taoi,'OutputDelay','taoo'); %有延迟

% %IV 离散系统模型 差分方程 脉冲传函

% 1 Z变换和反变换 ztrans , iztrans   
% syms t a n w T;g=sin(a*w*T);G=ztrans(g)%把原表达式t用n*T替换，三角函数把t用w*T替换
% syms z a k T;F=(2*z^2-0.5*z)/(z^-0.5*z-0.5);f=iztrans(F);f=simplify(f)

% 2 离散传递函数
% num=[6 -0.6 -0.12];den=[1 -1 0.25 0.25 -0.125];T=0.1;
% H=tf(num,den,'Ts',T)   %离散时间 T
%离散零极点模型 zpk(z,p,k,'Ts',t)
%离散状态方程模型 ss(A,B,C,D,'Ts',T)

% %VI 模型转换
% 连续转离散 需要给出采样周期T
% dG=c2d(G,T)
%离散转连续 无需给T
% G=d2c(dD)
%转化为状态方程模型[A,B,C,D]=ss(G)
%转化为传递函数Gc=tf(G)
%转化为零极点模型[z,p,k]=zpk(G)

% %V 方框图 信号流图化简

% 1 方框图化简
% Gc=G1*G2;%串联
% Gb=G1+C2;%并联
% Gf=feedback(G,H);%反馈
% Gs=feedbacksyms(G1,G2);%用符号表达式的反馈

% 2 信号流图化简 
%列出结点表达式 解线性方程组


%VII 模型降维

% 1 Pade降维     pademod(G,n,m) 分子阶次n 分母阶次m
% G=tf([1 7 11 5],[2 7 21 37 30])
% Gr=pademod(G,1,2);step(G,Gr,'r--')

% 2 劳斯降维
% num=[0.067 0.6 1.5 2.016 1.66 0.6];
% den=[0.067 0.7 3 6.67 7.93 4.63 1];
% G=tf(num,den);
% Gr=routhmod(G,3)

%系统辨识  systemIdentification


