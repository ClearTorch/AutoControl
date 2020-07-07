function [Gc,H]=obsvf(G,K,L)
H=ss(G.a-L*G.c,L,K,0);
Gc=ss(G.a-G.b*K-L*G.c+L*G.d*K,G.b,-K,1);