function u = hexacontrol (t,Y)

u = zeros(4,1);
e = zeros(12,1);%Steady state error matrix

z = 10; %Reference height

kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs
e(1) = z-Y(9);
u(1) = kp*e(1) + ki*(e(1) + e(2)) + kd*(e(1) - e(2));
e(2) = e(1);


end


omega = zeros(6,1);
omega_r = -omega(1) + omega(2) - omega(3) + omega(4) - omega(5) + omega(6);