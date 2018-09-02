function u = hexacontrol (t,Y,e)

u = zeros(4,1);

global z;
z = 100; %Reference height
kp = 1000; ki = 500; kd = 100;%error coeffs
% kp = 0.05; ki = 0.1; kd = 1;%error coeffs
e(1) = z-Y(11);
e(3) = e(3) + e(1);
u(1) = kp*e(1) + ki*(e(3)) + kd*(e(1) - e(2));
e(2) = e(1)

%phi reference
phi = 0;
kp = 0.05; ki = 0.1; kd = 1;%error coeffs
e(3) = phi-Y(1);
u(2) = kp*e(3) + ki*(e(3) + e(4)) + kd*(e(3) - e(4));
e(4) = e(3);

%theta reference
theta = 0;
kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs
e(5) = theta-Y(3);
u(3) = kp*e(5) + ki*(e(5) + e(6)) + kd*(e(5) - e(6));
e(6) = e(5);

%psy reference
psy = 0;
kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs
e(7) = psy-Y(5);
u(4) = kp*e(7) + ki*(e(7) + e(8)) + kd*(e(7) - e(8));
e(8) = e(7);
end


% omega = zeros(6,1);
% omega_r = -omega(1) + omega(2) - omega(3) + omega(4) - omega(5) + omega(6);