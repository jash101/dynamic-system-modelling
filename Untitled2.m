clear;
close all;
clc;

Y = zeros(12, 1);
t = 0:1:100; 
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode23(@hexa, t, Y);%solve ode and get mt, my

%%plot mt, my
% figure(1);
% plot (Mt, My(:,1) );
% figure(2);
plot (Mt, My(:,11) );