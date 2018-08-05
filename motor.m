function dy = motor(t,Y)
kb = 1; kt = 1;
R = 8; L = 0.006; J = 0.02; B = 0;
dy = zeros(2,1);
Tl = 1;
V = controller(t,Y);
dy(1) = -(R/L)*Y(1) - (kb/L)*Y(2) + V/L;

dy(2) = (kt/J)*Y(1) + (B/J)*Y(2) - Tl/J;
end