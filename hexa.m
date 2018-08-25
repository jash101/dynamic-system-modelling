function dy = hexa(t,Y)
%=========================
%Define parameters
%=========================
Jxx = 0.0075;
Jyy = 0.0075;
Jzz = 0.0013;

l = 0.23 %meters
Jr = 6*exp(-5);
m = 0.65
kf = 3.13*exp(-5);
km = 7.5*exp(-7);
Rmot = 0.6;
kmot = 5.2;
kt = diag(.01, 0.1, 0.1);

a = zeros(11, 1);
a(1) = (Jyy - Jzz)/Jxx;
a(4) = (Jzz - Jxx)/Jyy;
a(7) = (Jxx - Jyy)/Jzz;
a(3) = -Jr/Jxx;
a(6) = -Jr/Jyy;


%Initialization of Differential equations in vector matrix form
%with zero matrix
dy = zeros(6,1);

%Calculate the voltage given by PID according to the error in speed w
V = controller(t,Y);

%%Differential equations
dy(1) = (1/Jxx)*(
dy(1) = -(R/L)*Y(1) - (kb/L)*Y(2) + V/L;

dy(2) = (kt/J)*Y(1) + (B/J)*Y(2) - Tl/J;
end