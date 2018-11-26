clear; close all; clc;
Y = zeros(12, 1);
t = 0:0.01:50;
global T P Q r P1 u omega_r omega
% global P;
% global Q;
% global r;
% global P1;
T=50;
P=zeros(12,12,T);
Q=eye(12);
Jxx = 0.0075;
Jyy = 0.0075;
Jzz = 0.0013;
Q(2,2) = Jxx;
Q(4,4) = Jyy;
Q(6,6) = Jzz;
r=rand(4);
Kj=zeros(4,12);
P1=rand(12);
P(:,:,1)=P1;
% global u;
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@hexa_reinf, t, Y, options);%solve ode and get mt, my

%plot mt, my
% figure(1);
% plot (Mt, My(:,1) );
figure(2);
plot (Mt, My(:,11) );