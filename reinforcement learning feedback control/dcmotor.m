function dy=dcmotor(t,y)
  
global Re;
global jL;
global J;
global B;
global Kt;
global Kb;
global Tl;
global N;
  L=0.006;
  Wref=1;
  
  dy=zeros(3,1);
  istar=Tl/Kt;
  ystar=[istar,0,Wref];
  Kj=reinforce(t,y);
  v=Kj*(y-ystar);
  dy(1)=(-Re*y(1)-N*Kt*y(3)*fie+v);
  dy(2)=N*y(3);
  dy(3)=(Kt*y(1)-Tl);
end