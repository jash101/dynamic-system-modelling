function V = controller (t,Y)
e = zeros(3,1);%Steady state error matrix
w = 1000; %Reference speed
kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs
e(1) = w-Y(2);

V = kp*e(1) + ki*(e(1) + e(2)) + kd*(e(1) - e(2));
e(2) = e(1);

end