function [out]=ac07_containsAbba(s)  
  out=0;
  v=diff(s+0);
  idx=find(v(2:end-1)==0)+1;
  for i=idx
    if (v(i-1)+v(i+1)==0) && (v(i-1)~=0)
      out=1;
      break;
    end    
  end
end