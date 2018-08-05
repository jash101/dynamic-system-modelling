function dy = motor(t,Y)
%Motor parameters kb, kt, R, L, J, B
kb = 1; kt = 1;
R = 8; L = 0.006; J = 0.02; B = 0;
%Initialization of Differential equations in vector matrix form
%with zero matrix
dy = zeros(2,1);

Tl = 1;

%Calculate the voltage given by PID according to the error in speed w
V = controller(t,Y);

%Differential equations
dy(1) = -(R/L)*Y(1) - (kb/L)*Y(2) + V/L;

dy(2) = (kt/J)*Y(1) + (B/J)*Y(2) - Tl/J;
end