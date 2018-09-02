Y = zeros(12, 1);
t = 0:0.01:2000; 
% options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@hexa, t, Y);%solve ode and get mt, my

%plot mt, my
figure(1);
plot (Mt, My(:,1) );
figure(2);
plot (Mt, My(:,11) );