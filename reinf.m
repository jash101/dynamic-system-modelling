function Kj = reinf(t, y)

for j = 1:1:T-1
   Pj(:,:,2) = transpose(A - B*Kj)*Pj(:,:,1)*(A - B*Kj) + Q + transpose(Kj)*R*Kj;
   
   Kj = pinv(R + transpose(B)*Pj(:,:,2)*B)*transpose(B)*P(:,:,2)*A;
   Pj(:,:,2) = Pj(:,:,1);
end

end