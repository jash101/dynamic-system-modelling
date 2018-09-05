%Calculate matrix A and B using Jacobians

%Check matrices A and B in command window by typing 'a' or 'b'
syms x y u v

eq1 = x^2 + 2*x*y + y^2 + 2*u;

eq2 = x*y + y^2 + 4*x + 4*v;

%jacobians helps in local linearization of non linear systems
a = jacobian([eq1, eq2], [x, y])

b = jacobian([eq1, eq2], [u, v])