<<<<<<< HEAD
function V = controller (t,Y)
e = zeros(3,1);%Steady state error matrix
w = 1000; %Reference speed

kp = 0.05; ki = 0.1; kd = 0.1;%error coeffs

e(1) = w-Y(2);

e(3) = e(3) + e(1);

V = kp*e(1) + ki*(e(3)) + kd*(e(1) - e(2));

e(2) = e(1);

% plot(t,e(1));

end
=======
function V = controller(t,y)
global Esum;
global Eprev;
global Wref;

%Esum = 0;
%Eprev = 0;
Kp = 0.001;
Ki = 0.001;
Kd = 0.001;

e = Wref - y(2);
Esum = Esum + e;

V = Kp*e + Ki*Esum + Kd*(e - Eprev);

Eprev = e;

end
>>>>>>> efca026f8d901dbfd2d87ac38cd9bf7ea428c121
