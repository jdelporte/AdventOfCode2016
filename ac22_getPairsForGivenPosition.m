function out=ac22_getPairsForGivenPosition(U,S,A,i,j);
  pairs = [];
  if i<size(U,1)
    if U(i+1,j)<S(i,j)
      pairs = [pairs;i+1 j i j];
    end
  end
  if i>1
    if U(i-1,j)<S(i,j)
      pairs = [pairs;i-1 j i j];
    end
  end
  if j<size(U,2)
    if U(i,j+1)<S(i,j)
      pairs = [pairs;i j+1 i j];
    end
  end
  if j>1
    if U(i,j-1)<S(i,j)
      pairs = [pairs;i j-1 i j];
    end
  end     
  out = pairs;
end