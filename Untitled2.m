Y = [0 0 0 0 0 0];

Y(1) = 
options = odeset('OutputFcn', @odeplot);
%[Mt, My] = ode45(@motor, t, Y0, options);%solve ode and get mt, my

%plot mt, my
plot (Mt, My(:,1) );
plot (Mt, My(:,2) );