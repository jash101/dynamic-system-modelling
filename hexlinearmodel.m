%a = sym('a', [1 4])

dY = sym('dY', [1 12]);
Y = sym('Y', [1 12]);
f = sym('f', [1 12]);
G = sym('g', [1 12]);
u = sym('u', [1 4]);
t = 0:1:50;

Jxx = 0.0075;
Jyy = 0.0075;
Jzz = 0.0013;

g = 9.81; %gravitational constant
b = 1;%thrust constant
d = 1;%drag factor

l = 0.23; %meters
Jr = 6*exp(-5);
m = 0.65;
% kf = 3.13*e

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

omega_r = 0;

% ===========================================================================
% DYNAMIC EQUATIONS
% dY(1) = Y(2);
% dY(2) = a(1)*Y(4)*Y(6) + a(2)*Y(2)*Y(2) + a(3)*Y(4)*omega_r + b(1)*u(2);
% dY(3) = Y(4);
% dY(4) = a(4)*Y(2)*Y(6) + a(5)*Y(4)*Y(4) + a(6)*Y(2)*omega_r + b(2)*u(3);
% dY(5) = Y(6);
% dY(6) = a(7)*Y(2)*Y(4) + a(8)*Y(6)*Y(6) + b(3)*u(4);
% dY(7) = Y(8);
% dY(8) = a(9)*Y(8) + (1/m)*ux*u(1);
% dY(9) = Y(10);
% dY(10) = a(10)*Y(10) + (1/m)*uy*u(1);
% dY(11) = Y(12);
% dY(12) = a(11)*Y(12) + (cos(Y(1))*cos(Y(3))/m)*u(1) - g;

f(1) = Y(2);
f(2) = a(1)*Y(4)*Y(6) + a(2)*Y(2)*Y(2) + a(3)*Y(4)*omega_r;
f(3) = Y(4);
f(4) = a(4)*Y(2)*Y(6) + a(5)*Y(4)*Y(4) + a(6)*Y(2)*omega_r;
f(5) = Y(6);
f(6) = a(7)*Y(2)*Y(4) + a(8)*Y(6)*Y(6);
f(7) = Y(8);
f(8) = a(9)*Y(8);
f(9) = Y(10);
f(10) = a(10)*Y(10);
f(11) = Y(12);
f(12) = a(11)*Y(12) - g;

G(1) = 0;
G(2) = b(1)*u(2);
G(3) = 0;
G(4) = b(2)*u(3);
G(5) = 0;
G(6) = b(3)*u(4);
G(7) = 0;
G(8) = (1/m)*ux*u(1);
G(9) = 0;
G(10) = (1/m)*uy*u(1);
G(11) = 0;
G(12) = (cos(Y(1))*cos(Y(3))/m)*u(1);


A = jacobian(f, Y)

B = jacobian(G, u)