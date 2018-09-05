function u = hexacontrol (t,Y)

u = zeros(4,1);
e = zeros(1,8);
global e_curr;
global e_prev;
global e_sum;
global z;
z = 100; %Reference height
% kp = 30; ki = 7; kd = 20;%error coeffs---WORKS PERFECTLY
kp = 30; ki = 0.007; kd = 2000;%error coeffs
% kp = 0.05; ki = 0.1; kd = 1;%error coeffs
e_curr = z-Y(11);
e_sum = e_sum + e_curr;
u(1) = kp*e_curr + ki*(e_sum) + kd*(e_curr - e_prev);
e_prev = e_curr

%phi reference
phi = 0;
kp = 0.05; ki = 0.1; kd = 1;%error coeffs
e_sum = phi-Y(1);
u(2) = kp*e_sum + ki*(e_sum + e(4)) + kd*(e_sum - e(4));
e(4) = e_sum;

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