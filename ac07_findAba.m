function [ids]=ac07_findAba(s)
  v=diff(s+0);
  ids=[];
  for i=1:length(v)-1
    if (v(i)+v(i+1)==0) && (v(i)~=0)
      ids=[ids i];
    end    
  end
  