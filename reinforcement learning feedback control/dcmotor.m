function dy=DCmotor(t,y);
Kj=reinforce(t,y);
R=8;
L=6e-5;
J=0.02;
Kt=1;
Kb=1;
Tl=1;
N=1;
phi=0.0015;
wref=5000;
iref=(Tl/Kt);
dy=zeros(2,1);
ystar=[iref;wref];
v=Kj*(y-ystar);
dy(1)=(-R*y(1)-Kt*y(2)+v);
dy(2)=(Kt*y(1)-Tl);
end
