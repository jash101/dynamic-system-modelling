function dY = hexa(t,Y)
%=========================
%Define parameters
%=========================
Jxx = 0.0075;
Jyy = 0.0075;
Jzz = 0.0013;

g = 9.81; %gravitational constant
b = 1;%thrust constant
d = 1;%drag factor

l = 0.23; %meters
Jr = 6*exp(-5);
m = 0.65;
% kf = 3.13*exp(-5);
% km = 7.5*exp(-7);
% Rmot = 0.6;
% kmot = 5.2;
% kt = diag(.01, 0.1, 0.15);

a = zeros(11, 1);
a(1) = (Jyy - Jzz)/Jxx;
a(4) = (Jzz - Jxx)/Jyy;
a(7) = (Jxx - Jyy)/Jzz;
a(3) = -Jr/Jxx;
a(6) = -Jr/Jyy;

b = zeros(3,1);
b(1) = l/Jxx;
b(2) = l/Jyy;
b(3) = l/Jzz;

ux = cos(Y(1))*cos(Y(5))*sin(Y(3)) + sin(Y(1))*sin(Y(5));
uy = cos(Y(1))*sin(Y(3))*sin(Y(5)) - sin(Y(1))*cos(Y(5));

%Initialization of Differential equations in vector matrix form
%with zero matrix
dY = zeros(12,1);

% global e;
%e = zeros(1,8);%Steady state error matrix

%Calculate the voltage given by PID according to the error in speed w
u = hexacontrol(t,Y);

%u2omega = [b,b,b,b,b,b; (-b*l/2),-b*l, (-b*l/2), (b*l/2), b*l, b*l/2;-b*l*(sqrt(3))/2, 0, b*l*(sqrt(3))/2, b*l*(sqrt(3))/2, 0, -b*l*(sqrt(3))/2;-d, d, -d, d, -d, d];

omega = zeros(6,1);

omega(1) = sqrt((1/(6*b*l))*(l*u(1) + 2*u(2) - b*l*u(4)/d));
omega(2) = sqrt((1/(6*b*l))*(l*u(1) + u(2) - sqrt(3)*u(3) - b*l*u(4)/d));
omega(3) = sqrt((1/(6*b*l))*(l*u(1) - u(2) - sqrt(3)*u(3) - b*l*u(4)/d));
omega(4) = sqrt((1/(6*b*l))*(l*u(1) - 2*u(2) + b*l*u(4)/d));
omega(5) = sqrt((1/(6*b*l))*(l*u(1) - u(2) + sqrt(3)*u(3) - b*l*u(4)/d));
omega(5) = sqrt((1/(6*b*l))*(l*u(1) + u(2) + sqrt(3)*u(3) + b*l*u(4)/d));

omega_r = -omega(1) + omega(2) - omega(3) + omega(4) - omega(5) + omega(6);

%%Differential equations
% dy(1) = a(1)*Y(4)*Y(6) + a(2)*Y(2)*Y(2) + a(3)*Y(4)*omega_r + b(1)*u(2);
% 
% dy(2) = a(4)*Y(2)*Y(6) + a(5)*Y(4)*Y(4) + a(6)*Y(2)*omega_r + b(2)*u(3);
% 
% dy(3) = a(7)*Y(2)*Y(4) + a(8)*Y(6)*Y(6) + b(3)*u(4);
% 
% dy(4) = a(9)*Y(8) + (1/m)*ux*u(1);
% 
% dy(5) = a(10)*Y(10) + (1/m)*uy*u(1);
% 
% dy(6) = a(11)*Y(12) + (cos(Y(1))*cos(Y(3))/m)*u(1) - g;
dY(1) = Y(2);
dY(2) = a(1)*Y(4)*Y(6) + a(2)*Y(2)*Y(2) + a(3)*Y(4)*omega_r + b(1)*u(2);
dY(3) = Y(4);
dY(4) = a(4)*Y(2)*Y(6) + a(5)*Y(4)*Y(4) + a(6)*Y(2)*omega_r + b(2)*u(3);
dY(5) = Y(6);
dY(6) = a(7)*Y(2)*Y(4) + a(8)*Y(6)*Y(6) + b(3)*u(4);
dY(7) = Y(8);
dY(8) = a(9)*Y(8) + (1/m)*ux*u(1);
dY(9) = Y(10);
dY(10) = a(10)*Y(10) + (1/m)*uy*u(1);
dY(11) = Y(12);
dY(12) = a(11)*Y(12) + (cos(Y(1))*cos(Y(3))/m)*u(1) - g;
end

%u matrix