function out=ac22_getPairs(U,A);

pairs = [];
for i=2:size(U,1)-1
  for j=2:size(U,2)-1
    if 0<U(i,j)
      if U(i,j)<A(i+1,j)
        pairs = [pairs;i j i+1 j];
      end
      if U(i,j)<A(i-1,j)
        pairs = [pairs;i j i-1 j];
      end
      if U(i,j)<A(i,j+1)
        pairs = [pairs;i j i j+1];
      end
      if U(i,j)<A(i,j-1)
        pairs = [pairs;i j i j-1];
      end  
    end
  end
end
out = pairs;