function dy = hexa(t,Y)
%=========================
%Define parameters
%=========================
Jxx = 0.0075;
Jyy = 0.0075;
Jzz = 0.0013;

g = 9.81; %gravitational constant
b = 1;%thrust constant

l = 0.23 %meters
Jr = 6*exp(-5);
m = 0.65
kf = 3.13*exp(-5);
km = 7.5*exp(-7);
Rmot = 0.6;
kmot = 5.2;
kt = diag(.01, 0.1, 0.15);

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

omega = zeros(6,1);
omega_r = -omega(1) + omega(2) - omega(3) + omega(4) - omega(5) + omega(6);

%Initialization of Differential equations in vector matrix form
%with zero matrix
dy = zeros(6,1);

%Calculate the voltage given by PID according to the error in speed w
u = controller(t,Y);

%%Differential equations
dy(1) = a(1)*Y(4)*Y(6) + a(2)*Y(2)*Y(2) + a(3)*Y(4)*omega_r + b(1)*u(2);

dy(2) = a(4)*Y(2)*Y(6) + a(5)*Y(4)*Y(4) + a(6)*Y(2)*omega_r + b(2)*u(3);

dy(3) = a(7)*Y(2)*Y(4) + a(8)*Y(6)*Y(6) + b(3)*u(4);

dy(4) = a(9)*Y(8) + (1/m)*ux*u(1);

dy(5) = a(10)*Y(10) + (1/m)*uy*u(1);

dy(6) = a(11)*Y(12) + (cos(Y(1))*cos(Y(3))/m)*u(1) - g;

% dy(1) = a(1)*Y(4)*Y(6) + a(2)*Y(2)*Y(2) + a(3)*Y(4)*omega_r + b(1)*u(2);
% 
% dy(4) = a(4)*Y(2)*Y(6) + a(5)*Y(4)*Y(4) + a(6)*Y(2)*omega_r + b(2)*u(3);
% 
% dy(6) = a(7)*Y(2)*Y(4) + a(8)*Y(6)*Y(6) + b(3)*u(4);
% 
% dy(8) = a(9)*Y(8) + (1/m)*ux*u(1);
% 
% dy(10) = a(10)*Y(10) + (1/m)*uy*u(1);
% 
% dy(12) = a(11)*Y(12) + (cos(Y(1))*cos(Y(3))/m)*u(1) - g;

%=================================================
% dy(1) = -(R/L)*Y(1) - (kb/L)*Y(2) + V/L;
% 
% dy(2) = (kt/J)*Y(1) + (B/J)*Y(2) - Tl/J;
end

%u matrix