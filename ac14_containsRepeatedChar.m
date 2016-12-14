function [out]=ac14_containsRepeatedChar(s,n)
  pattern=char(ones(n,1)*(['0':'9' 'a':'f']))';
  out = '';
  for i=1:16
    if length(strfind(s,pattern(i,:)))
      out = [out  pattern(i,1)];
    end 
  end
end