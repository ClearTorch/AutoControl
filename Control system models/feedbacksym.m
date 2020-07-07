function H=feedbacksym(G1,G2,key)
if nargin==2;key=-1;end
H=G1/(sym(1)-key*G1*G2);H=simplify(H);