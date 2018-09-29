function Kj=reinforce(t,y)
  global Re;
  global jL;
  global J;
  global B;
  global Kt;
  global Kb;
  global Tl;
  global N;
  global phi;

  L=0.006;
  A=[-Re/L 0 -(N*Kt*phi)/L; 0 0 N; (Kt*phi)/L 0 0];
  B=[1;0;0];
  T=10;
  P=rand(2,2,T);
  Q=eye(3,3);
  R=1;
  Kj=eye(3,3);

  for i=1:1:9
    P(:,:,i+1)=(A-B*Kj).'*P(:,:,i)*(A-B*Kj)+Q+Kj.'*R*Kj;
  end
  Kj=inv((R+B.'*P(:,:,T)*B))*B.'*P(:,:,T)*A;

end