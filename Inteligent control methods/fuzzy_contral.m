
clear all;
close all;

a=newfis('fuzzy_cell');%生成名为“fuzz_cell”的模糊接口
a=addvar(a,'input','I',[-80,0]); %添加输入变量SOC极其隶属度函数            
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

a1=setfis(a,'DefuzzMethod','mom');  %Defuzzy  解模糊 最大隶属度平均法
writefis(a1,'cell');                %Save to fuzzy file "wash.fis"
a2=readfis('cell');

figure(1);
plotfis(a2);     %画出模糊推理系统
figure(2);
plotmf(a,'input',1);%输入变量的隶属度函数
figure(3);
plotmf(a,'input',2);
figure(4);
plotmf(a,'output',1);
figure(5);
plotmf(a,'output',2);

ruleview('cell');  %Dynamic Simulation  

 
