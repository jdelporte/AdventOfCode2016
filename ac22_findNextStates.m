function out = ac22_findNextStates(U,S,A,current)
  neighbors = ac22_getPairsForGivenPosition(U,S,A,current(1),current(2));
  out = [];
  for i=1:size(neighbors,1)
    if neighbors(i,1:2)==current(3:4)
      out = [out;neighbors(i,:)];
    else
      out = [out;[neighbors(i,1:2) current(3:4)]];
    end
  end
end