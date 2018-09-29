t=0:0.01:10;
Y=zeros(3,1);

global Re;
global jL;
global J;
global B;
global Kt;
global Kb;
global Tl;
global N;
global phi;

Re = 8;
jL = 6;
J = 0.02;
B=0;
Kt=1;
Kb=1;
Tl=1;
N=2;
phi = 0.0015;
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@dcmotor, t, Y, options);
%plot mt, my
plot (Mt, My(:,1) );
plot (Mt, My(:,2) );