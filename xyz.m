t = 0:0.01:10;%time period over which ode will be solved
Y0 = [0 0];
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@motor, t, Y0, options);%solve ode and get mt, my

%plot mt, my
plot (Mt, My(:,1) );
plot (Mt, My(:,2) );