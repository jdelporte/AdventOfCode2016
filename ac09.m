
clear all

S=textread('ac09_data.txt','%s'){1};
%S='A(2x2)BCD(2x2)EFG';
lpar = strfind(S,'(');
rpar = strfind(S,')');

ind=1;
lenTot = 0;

for i = 1:length(lpar)
  if ind<lpar(i)
    lenTot = lenTot + lpar(i)-ind;
    ind = lpar(i);
  end
  if ind==lpar(i)
    c=strsplit(S(lpar(i)+1:rpar(i)-1),'x');
    len = str2num(c{1});
    rep = str2num(c{2});
    lenTot = lenTot + len*rep;
    ind = ind + rpar(i)-lpar(i)+1 + len;
  end  
end
if ind<=length(S)
  lenTot = lenTot+length(S)-ind+1;
end

resultat1 = lenTot

resultat2 = num2str(ac09_getLengthRec(S))





