clear;
%close all;
clc;
global e;
global e_curr;
global e_prev;
global e_sum;
e_sum = 0;
e_prev = 0;
e_curr = 0;

%e = zeros(1,8);%Steady state error matrix
Y = zeros(12, 1);
t = 0:1:25; 
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@hexa, t, Y);%solve ode and get mt, my

%%plot mt, my
% figure(1);
% plot (Mt, My(:,1) );
% figure(2);
plot (Mt, My(:,11) );