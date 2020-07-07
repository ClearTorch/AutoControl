% % I ΢�ַ���ģ��         (RLC��·��Դ����΢�ַ���ģ��)

% clear all
% t0=0.1; tfinal=10;x0=[0.2;0];
% [t,x]=ode45('fun_dis',[t0,tfinal],x0);
% figure(1);subplot(2,1,1);plot(t,x(:,1));grid;
% title('���ݵ�ѹ/V');xlabel('ʱ��/s');subplot(2,1,2);plot(t,x(:,2));
% grid;title('��е���/A');xlabel('ʱ��/s');figure(2);vc=x(:,1);i=x(:,2);
% plot(vc,i);grid;title('��е�������ݵ�ѹ�Ĺ�ϵ����');xlabel('���ݵ�ѹ/v');ylabel('��е���/A');

% % II���ݺ���ģ��

% 1 ���ϱ任�����任 laplace,ilaplace
% syms a t;f=1-(1+a*t)*exp(-a*t);Fs=laplace(f)
% syms s;G=(s+3)/s/(s^4+2*s^3+11*s^2+18*s+18);
% y=simplify(ilaplace(G))
% fplot(y,[0,10]);grid;
% xlabel('time/s');ylabel('respond');

% ����ͬ��ʽ�Ĵ��ݺ������ʽѡ�ò�ͬ��ʽ�����뷽ʽ��
% 1 ��׼��ʽ �÷��ӷ�ĸϵ�����󣨰������ݼ������� 
% num=[12 24 12 20];den=[2 4 6 2 2];
% G=tf(num,den)  %���ӳ�
% tao=3;
% Gdelay=tf(num,den,'InputDelay',tao) %�����ӳ�

% 2  �㼫��ģ��
% z=[1 2];p=[1 2 1 3];k=1;tao=3;
% % G=zpk(z,p,k)                  %���ӳ�
% G=zpk(z,p,k,'OutputDelay',tao)  %���ӳ�

% 2 �����ʽ  ������ʽ���� s=tf('s')
% s=tf('s');G=(s^3+2*s^2+3*s+4)/(s^3*(s+2)*(s+5)^2+5)

% %�ı䴫�ݺ�������
% 1 ����ӳ�ʱ�����
% G.ioDelay=tao;  %����ӳ�ʱ����þ���
% % 2�ı临�����Ϊ p
% G.Variable='p';

% %III ״̬�ռ�ģ�� ss(A,B,C,D) ʱ����

% A=[-12 -17.2 -16.8 -11.9;6 8.6 8.4 6;6 8.7 8.4 6;-5.9 -8.6 -8.3 -6];
% B=[1.5 0.2;1 0.3;2 1;0 0.5];C=[2 0.5 0 0.8;0.3 0.3 0.2 1];D=zeros(2,2);
% G=ss(A,B,C,D) %���ӳ�
% taoi=[2;2;3];taoo=[3;1;2];
% Gdelay=ss(A,B,C,D,'InputDelay',taoi,'OutputDelay','taoo'); %���ӳ�

% %IV ��ɢϵͳģ�� ��ַ��� ���崫��

% 1 Z�任�ͷ��任 ztrans , iztrans   
% syms t a n w T;g=sin(a*w*T);G=ztrans(g)%��ԭ���ʽt��n*T�滻�����Ǻ�����t��w*T�滻
% syms z a k T;F=(2*z^2-0.5*z)/(z^-0.5*z-0.5);f=iztrans(F);f=simplify(f)

% 2 ��ɢ���ݺ���
% num=[6 -0.6 -0.12];den=[1 -1 0.25 0.25 -0.125];T=0.1;
% H=tf(num,den,'Ts',T)   %��ɢʱ�� T
%��ɢ�㼫��ģ�� zpk(z,p,k,'Ts',t)
%��ɢ״̬����ģ�� ss(A,B,C,D,'Ts',T)

% %VI ģ��ת��
% ����ת��ɢ ��Ҫ������������T
% dG=c2d(G,T)
%��ɢת���� �����T
% G=d2c(dD)
%ת��Ϊ״̬����ģ��[A,B,C,D]=ss(G)
%ת��Ϊ���ݺ���Gc=tf(G)
%ת��Ϊ�㼫��ģ��[z,p,k]=zpk(G)

% %V ����ͼ �ź���ͼ����

% 1 ����ͼ����
% Gc=G1*G2;%����
% Gb=G1+C2;%����
% Gf=feedback(G,H);%����
% Gs=feedbacksyms(G1,G2);%�÷��ű��ʽ�ķ���

% 2 �ź���ͼ���� 
%�г������ʽ �����Է�����


%VII ģ�ͽ�ά

% 1 Pade��ά     pademod(G,n,m) ���ӽ״�n ��ĸ�״�m
% G=tf([1 7 11 5],[2 7 21 37 30])
% Gr=pademod(G,1,2);step(G,Gr,'r--')

% 2 ��˹��ά
% num=[0.067 0.6 1.5 2.016 1.66 0.6];
% den=[0.067 0.7 3 6.67 7.93 4.63 1];
% G=tf(num,den);
% Gr=routhmod(G,3)

%ϵͳ��ʶ  systemIdentification


