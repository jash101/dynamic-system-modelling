function V = controller(t,y)
global Esum;
global Eprev;
global Wref;

Esum = 0;
Eprev = 0;
Wref = 1000;
Kp = 50;
Ki = 1;
Kd = 0.01;

e = Wref - y(2);
Esum = Esum + e;

V = Kp*e + Ki*Esum + Kd*(e - Eprev);

Eprev = e;

end