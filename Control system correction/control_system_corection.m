% % I ��ǰ�ͺ���������
% ���� Gc=leadlagc(G,Wc,r,Kv,key)   ����ԭϵͳ���ݺ���G�������ļ���Ƶ��Wc����λrԣ��
%   �ɸ���Kvֵ��Key=1Ϊ��ǰ��Key=-1Ϊ�ͺ󣬷��ض�Ӧ�Ľ�����Gc

% s=tf('s');G=10*(s+1)*(s+5)/s/(s+0.1)/(s+10)/(s+20);wc=20;
% f1=figure;f2=figure;
% for gam=20:10:90
%     Gc=leadlagc(G,wc,gam,1000,3);
%     figure(f1);step(feedback(G*Gc,1),1);hold on
%     figure(f2);bode(Gc*G);hold on;
% end


% %  II PID������
% PID ��Ҫ����������ǲ�������  
%PID ���������� pidstd��p,i,d,n����pid(k,p,d,n)
% PID��������� pidtune��������
% PID��������� ͼ���û����� pidTuner
% s=tf('s');G=0.1/(s+1)^6;Gc=pidtune(G,'pi');
% G2=pidtune(G,'pidf');
% step(feedback(G*Gc,1),'r--',feedback(G*G2,1));

% 2 ����PID���������

% III ³��������
% 1 ����H2³����������� ��֪�����˫�����ܿض���ģ��Gtss  [Gc,Gc1]=h2syn(Gtss) 
% 2 ����Hoo������ [Gc,Gc1,r]=hinfsyn(Gtss)


