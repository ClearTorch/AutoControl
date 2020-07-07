% % I 超前滞后矫正器设计
% 函数 Gc=leadlagc(G,Wc,r,Kv,key)   给出原系统传递函数G，期望的剪切频率Wc和相位r裕度
%   可给出Kv值，Key=1为超前，Key=-1为滞后，返回对应的矫正器Gc

% s=tf('s');G=10*(s+1)*(s+5)/s/(s+0.1)/(s+10)/(s+20);wc=20;
% f1=figure;f2=figure;
% for gam=20:10:90
%     Gc=leadlagc(G,wc,gam,1000,3);
%     figure(f1);step(feedback(G*Gc,1),1);hold on
%     figure(f2);bode(Gc*G);hold on;
% end


% %  II PID控制器
% PID 首要解决的问题是参数整定  
%PID 控制器输入 pidstd（p,i,d,n）、pid(k,p,d,n)
% PID控制器设计 pidtune（）函数
% PID控制器设计 图形用户界面 pidTuner
% s=tf('s');G=0.1/(s+1)^6;Gc=pidtune(G,'pi');
% G2=pidtune(G,'pidf');
% step(feedback(G*Gc,1),'r--',feedback(G*G2,1));

% 2 最优PID控制器设计

% III 鲁棒控制器
% 1 最优H2鲁棒控制器设计 已知争光的双端子受控对象模型Gtss  [Gc,Gc1]=h2syn(Gtss) 
% 2 最优Hoo控制器 [Gc,Gc1,r]=hinfsyn(Gtss)


