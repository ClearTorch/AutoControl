
clear all;
close all;

a=newfis('fuzzy_cell');%������Ϊ��fuzz_cell����ģ���ӿ�
a=addvar(a,'input','I',[-80,0]); %����������SOC���������Ⱥ���            
a=addmf(a,'input',1,'B','trapmf',[-100,-80,-50,-40]);
a=addmf(a,'input',1,'M','trapmf',[-50,-40,-20,-10]);
a=addmf(a,'input',1,'S','trapmf',[-20,-10,0,10]);

a=addvar(a,'input','SOC',[0,100]); 
a=addmf(a,'input',2,'L','trapmf',[-10,0,30,40]);
a=addmf(a,'input',2,'M','trapmf',[30,40,60,70]);
a=addmf(a,'input',2,'H','trapmf',[60,70,100,110]);

a=addvar(a,'output','N',[0,8]);      
a=addmf(a,'output',1,'NS','trapmf',[-1,0,2,3]);
a=addmf(a,'output',1,'NM','trapmf',[2,3,5,6]);
a=addmf(a,'output',1,'NL','trapmf',[5,6,8,9]);

a=addvar(a,'output','dSOC',[0,8]);  
a=addmf(a,'output',2,'dS','trapmf',[-1,0,2,3]);
a=addmf(a,'output',2,'dM','trapmf',[2,3,5,6]);
a=addmf(a,'output',2,'dL','trapmf',[5,6,8,9]);


rulelist=[1,1,1,1,1,1;1,2,2,2,1,1;1,3,3,3,1,1;
    2,1,2,2,1,1;
    2,2,2,2,1,1;
    2,3,3,3,1,1;
    3,1,3,3,1,1;
    3,2,3,3,1,1];
          
a=addrule(a,rulelist);
showrule(a)                         %Show fuzzy rule base

a1=setfis(a,'DefuzzMethod','mom');  %Defuzzy  ��ģ�� ���������ƽ����
writefis(a1,'cell');                %Save to fuzzy file "wash.fis"
a2=readfis('cell');

figure(1);
plotfis(a2);     %����ģ������ϵͳ
figure(2);
plotmf(a,'input',1);%��������������Ⱥ���
figure(3);
plotmf(a,'input',2);
figure(4);
plotmf(a,'output',1);
figure(5);
plotmf(a,'output',2);

ruleview('cell');  %Dynamic Simulation  

 
