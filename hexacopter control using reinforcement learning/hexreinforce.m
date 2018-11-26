function Kj= hexreinforce(t, Y)
    Kj=zeros(4,12);
    global A B T P Q r P1
    for i=2:1:T

        P(:,:,i)=transpose(A-B*Kj)*P(:,:,i-1)*(A-B*Kj)+Q+transpose(Kj)*r*Kj;
    end
    Kj=pinv(r+transpose(B)*P(:,:,T)*B)*transpose(B)*P(:,:,T)*A;
    P1=P(:,:,T);

end

% A = [ 0,           1, 0,          0, 0,           0, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0, (62*Y(6))/75, 0,  (62*Y(4))/75, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0,          1, 0,           0, 0, 0, 0, 0, 0, 0
% ; 0, -(62*Y(6))/75, 0,          0, 0, -(62*Y(2))/75, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0,          0, 0,           1, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0,          0, 0,           0, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0,          0, 0,           0, 0, 1, 0, 0, 0, 0
% ; 0,           0, 0,          0, 0,           0, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0,          0, 0,           0, 0, 0, 0, 1, 0, 0
% ; 0,           0, 0,          0, 0,           0, 0, 0, 0, 0, 0, 0
% ; 0,           0, 0,          0, 0,           0, 0, 0, 0, 0, 0, 1
% ; 0,           0, 0,          0, 0,           0, 0, 0, 0, 0, 0, 0];

% A = [ 0     1     0     0     0     0     0     0     0     0     0     0
%     ; 0     0     0     0     0     0     0     0     0     0     0     0
%     ; 0     0     0     1     0     0     0     0     0     0     0     0
%     ; 0     0     0     0     0     0     0     0     0     0     0     0
%     ; 0     0     0     0     0     1     0     0     0     0     0     0
%     ; 0     0     0     0     0     0     0     0     0     0     0     0
%     ; 0     0     0     0     0     0     0     1     0     0     0     0
%     ; 0     0     0     0     0     0     0     0     0     0     0     0
%     ; 0     0     0     0     0     0     0     0     0     1     0     0
%     ; 0     0     0     0     0     0     0     0     0     0     0     0
%     ; 0     0     0     0     0     0     0     0     0     0     0     1
%     ; 0     0     0     0     0     0     0     0     0     0     0     0];
% 
% B = [ 0         0         0         0
%     ; 0   30.6667         0         0
%     ; 0         0         0         0
%     ; 0         0   30.6667         0
%     ; 0         0         0         0
%     ; 0         0         0  176.9231
%     ; 0         0         0         0
%     ; 0         0         0         0
%     ; 0         0         0         0
%     ; 0         0         0         0
%     ; 0         0         0         0
%     ; 1.5385         0         0         0];
% 
% T=50;
% P=zeros(12,12,T);
% Q=eye(12);
% Jxx = 0.0075;
% Jyy = 0.0075;
% Jzz = 0.0013;
% Q(2,2) = Jxx;
% Q(4,4) = Jyy;
% Q(6,6) = Jzz;
% r=rand(4);
% Kj=zeros(4,12);
% P1=rand(12);
% P(:,:,1)=P1;