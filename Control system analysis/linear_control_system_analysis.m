% % I 时域分析

%  图形用户界面求响应 ltiview
% 1 单位阶跃响应step()、单位脉冲响应impulse()、任意输入响应lsim（sys,u,t,x0）
% u为输入信号，t为等间隔时间向量,x0为初始条件

% num=[1];den=[1 0.4 1];G=tf(num,den);t=0:0.1:10;u=t;
% step(G),grid
% lsim(G,u,t),grid  %单位斜坡响应

%  2 性能指标的求取
%编程法 ： 峰值时间[t,k]=max(y),timepeak=t(k);
%          超调量 : 终值 C=dcgain(G),[Y,k]=max(y),percentovershoot=100*(Y-C)/C
%          上升时间：
%                   C=dcgain(G),n=1;
%                   while y(n)<C*0.1
%                          n=n+1,
%                   end
%                   m=1;
%                   while y(n)<C*0.9
%                            m=m+1,
%                    end
%                    risetime=t(m)-t(n);
%                调节时间：C=dcgain(G)
%                          i=length(t)  
%                          while (y(i)>0.98*C)&(y(i)<1.02*C)
%                              i=i-1;
%                           end
%                           settlingtime=t(i);

% 图形法获取性能指标

% G=zpk([],[-1+3*i -1-3*i],3);step(G)   %在响应图右键选择

% 2 线性系统稳定性分析

% 闭环系统外部稳定性
% 求特征根法 eig(G)、离散系统 abs(eig(G)) roots（den）特征多项式根 均有负实部为稳定
% 图解法 pzmap(G) 零极点图
% 直接法 isstable（G）
% num=[10 50 100 100 40];
% den=[1 21 184 870 2384 3664 2496 0];
% G1=tf(num,den);G=feedback(G1,1);
% dc=G.den;                 %提取闭环传函的特征多项式
% dens=poly2str(dc{1},'s'); %将多项式系数转换为字符形式的函数
% r=roots(den);
% e=eig(G),pzmap(G),isstable(G)

% 闭环系统内部稳定性

% instable(Gc,G,H)

% % II 根轨迹分析
%  rlocus(G),rlocus(G,K),rlocus(G1,'b-',G2,'r--')
% 根轨迹上任意点对应的K值 rlocfind(G),[K,poles]=rlocfind(G)
% 在连续系统根轨迹图上等阻尼线和等自振角频率线 sgrid(),sgrid(z,wn) 、离散系统zgrid()
% 根轨迹分析与设计工具 rltool  、rltool（system）

% num=[1 4 8];den=[1 18 120.3 357.5 478.5 306];
% G=tf(num,den);rlocus(G),sgrid(),rlocfind(G)

% % III 频率分析
% 极坐标图 nyquist、伯德图（对数坐标图）bode 、对数幅相图nichols
% 绘制等M圆和等N圆函数  ngrid()
% 稳定性分析 margin(G)得到幅值裕度和相角裕度  s=allmargin(G)

% num=5*[0.0167 1];den=conv(conv([0.03 1],[0.001 1]),conv([0.0025 1],[0.001 1]));
% G=tf(num,den);w=logspace(0,4,50);bode(G,w),grid,margin(G)
% [Gm,Pm,Wcg,Wcp]=margin(G)

% 多变量频率分析方法 MFD工具箱

% % III 离散系统分析

% num=[1];den=[1 1 0];Ts=0.1;G=tf(num,den);
% G1=c2d(G,Ts,'zoh');%零阶保持器
% G2=c2d(G,Ts,'foh');%一阶保持器
% G3=c2d(G,Ts,'tustin');%双线性变换
% G4=c2d(G,Ts,'matched');%零极点匹配变换方法
% step(G1);

% 2 稳定相分析
% 根轨迹分析 所有极点都在单位元内部 系统稳定

% rlocus(G4),grid
% pzmap(G),grid

