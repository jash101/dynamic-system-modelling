t = 0:0.01:10;
Y0 = [0 0];
options = odeset('OutputFcn', @odeplot);
[Mt, My] = ode45(@motor, t, Y0, options);

plot (Mt, My(:,1) );
plot (Mt, My(:,2) );