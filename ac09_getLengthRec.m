function [len]=ac09_getLengthRec(s)
  lpars = strfind(s,'(');
  if length(lpars)==0
    len = length(s);
  else    
    lpar = lpars(1);
    rpar = strfind(s,')')(1);
    c=strsplit(s(lpar+1:rpar-1),'x');
    lenTmp = str2num(c{1});
    rep = str2num(c{2});
    len = (lpar-1) + rep*ac09_getLengthRec(s(rpar+1:rpar+lenTmp))  + ac09_getLengthRec(s(rpar+lenTmp+1:end));
  end
end