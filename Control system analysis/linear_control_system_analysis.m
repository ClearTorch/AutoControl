% % I ʱ�����

%  ͼ���û���������Ӧ ltiview
% 1 ��λ��Ծ��Ӧstep()����λ������Ӧimpulse()������������Ӧlsim��sys,u,t,x0��
% uΪ�����źţ�tΪ�ȼ��ʱ������,x0Ϊ��ʼ����

% num=[1];den=[1 0.4 1];G=tf(num,den);t=0:0.1:10;u=t;
% step(G),grid
% lsim(G,u,t),grid  %��λб����Ӧ

%  2 ����ָ�����ȡ
%��̷� �� ��ֵʱ��[t,k]=max(y),timepeak=t(k);
%          ������ : ��ֵ C=dcgain(G),[Y,k]=max(y),percentovershoot=100*(Y-C)/C
%          ����ʱ�䣺
%                   C=dcgain(G),n=1;
%                   while y(n)<C*0.1
%                          n=n+1,
%                   end
%                   m=1;
%                   while y(n)<C*0.9
%                            m=m+1,
%                    end
%                    risetime=t(m)-t(n);
%                ����ʱ�䣺C=dcgain(G)
%                          i=length(t)  
%                          while (y(i)>0.98*C)&(y(i)<1.02*C)
%                              i=i-1;
%                           end
%                           settlingtime=t(i);

% ͼ�η���ȡ����ָ��

% G=zpk([],[-1+3*i -1-3*i],3);step(G)   %����Ӧͼ�Ҽ�ѡ��

% 2 ����ϵͳ�ȶ��Է���

% �ջ�ϵͳ�ⲿ�ȶ���
% ���������� eig(G)����ɢϵͳ abs(eig(G)) roots��den����������ʽ�� ���и�ʵ��Ϊ�ȶ�
% ͼ�ⷨ pzmap(G) �㼫��ͼ
% ֱ�ӷ� isstable��G��
% num=[10 50 100 100 40];
% den=[1 21 184 870 2384 3664 2496 0];
% G1=tf(num,den);G=feedback(G1,1);
% dc=G.den;                 %��ȡ�ջ���������������ʽ
% dens=poly2str(dc{1},'s'); %������ʽϵ��ת��Ϊ�ַ���ʽ�ĺ���
% r=roots(den);
% e=eig(G),pzmap(G),isstable(G)

% �ջ�ϵͳ�ڲ��ȶ���

% instable(Gc,G,H)

% % II ���켣����
%  rlocus(G),rlocus(G,K),rlocus(G1,'b-',G2,'r--')
% ���켣��������Ӧ��Kֵ rlocfind(G),[K,poles]=rlocfind(G)
% ������ϵͳ���켣ͼ�ϵ������ߺ͵������Ƶ���� sgrid(),sgrid(z,wn) ����ɢϵͳzgrid()
% ���켣��������ƹ��� rltool  ��rltool��system��

% num=[1 4 8];den=[1 18 120.3 357.5 478.5 306];
% G=tf(num,den);rlocus(G),sgrid(),rlocfind(G)

% % III Ƶ�ʷ���
% ������ͼ nyquist������ͼ����������ͼ��bode ����������ͼnichols
% ���Ƶ�MԲ�͵�NԲ����  ngrid()
% �ȶ��Է��� margin(G)�õ���ֵԣ�Ⱥ����ԣ��  s=allmargin(G)

% num=5*[0.0167 1];den=conv(conv([0.03 1],[0.001 1]),conv([0.0025 1],[0.001 1]));
% G=tf(num,den);w=logspace(0,4,50);bode(G,w),grid,margin(G)
% [Gm,Pm,Wcg,Wcp]=margin(G)

% �����Ƶ�ʷ������� MFD������

% % III ��ɢϵͳ����

% num=[1];den=[1 1 0];Ts=0.1;G=tf(num,den);
% G1=c2d(G,Ts,'zoh');%��ױ�����
% G2=c2d(G,Ts,'foh');%һ�ױ�����
% G3=c2d(G,Ts,'tustin');%˫���Ա任
% G4=c2d(G,Ts,'matched');%�㼫��ƥ��任����
% step(G1);

% 2 �ȶ������
% ���켣���� ���м��㶼�ڵ�λԪ�ڲ� ϵͳ�ȶ�

% rlocus(G4),grid
% pzmap(G),grid

