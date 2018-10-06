clear; close all; clc;
Y = zeros(12, 1);
t = 0:0.01:50; 
global u;
global Kj;
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@hexa_reinf, t, Y, options);%solve ode and get mt, my

%plot mt, my
% figure(1);
% plot (Mt, My(:,1) );
figure(2);
plot (Mt, My(:,11) );