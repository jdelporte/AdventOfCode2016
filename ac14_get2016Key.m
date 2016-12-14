function out=ac14_get2016Key(s)
  out = s;
  for i=1:2016
    out = md5sum(out,1);
  end
end