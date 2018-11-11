function Kj=reinforce(t,y)
R=8;
L=6e-5;
J=0.02;
Kt=1;
Kb=1;
Tl=1;
N=1;
phi=0.0015;
A=[-R (-Kt);(Kt) 0];
B=[1;0];
T=20;
l=2;
P=rand(2,2,T);
Q=[1 0;0 1];
r=1;
Kj=eye(1,2);
P1=eye(2,2);
for i=2:1:T
    P(:,:,1)=P1;
    P(:,:,i)=transpose(A-B*Kj)*P(:,:,i-1)*(A-B*Kj)+Q+transpose(Kj)*r*Kj;
end
Kj=pinv(r+transpose(B)*P(:,:,T)*B)*transpose(B)*P(:,:,T)*A;
P1=P(:,:,T);
end