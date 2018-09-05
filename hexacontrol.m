function u = hexacontrol (t,Y)

u = zeros(4,1);
global e;
global z;
z = 100; %Reference height 
kp = 30; ki = 0.007; kd = 2000;%error coeffs 
% kp = 0.05; ki = 0.1; kd = 1;%error coeffs 
e(1) = z-Y(11); 
e(3) = e(3) + e(1); 
u(1) = kp*e(1) + ki*(e(3)) + kd*(e(1) - e(2)); 
e(2) = e(1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % kp = 30; ki = 7; kd = 20;%error coeffs---WORKS PERFECTLY

%phi reference
phi = 0;
kp = 0.05; ki = 0.1; kd = 1;%error coeffs
e(4) = phi-Y(1);
e(6) = e(6) + e(4);
u(2) = kp*e(4) + ki*(e(6)) + kd*(e(4) - e(5));
e(5) = e(4);

%theta reference
theta = 0;
kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs
e(7) = theta-Y(3);
e(9) = e(9) + e(7);
u(3) = kp*e(7) + ki*(e(7) + e(8)) + kd*(e(7) - e(8));
e(8) = e(7);

%psy reference
psy = 0;
kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs
e(10) = psy-Y(5);
e(12) = e(12) + e(10);
u(4) = kp*e(10) + ki*(e(10) + e(11)) + kd*(e(10) - e(11));
e(11) = e(10);
end