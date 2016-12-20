clear all
M=importdata('ac20_data.txt','-');

maxN = 4294967295;
inf = 0;
sup = [];

M=sort(M,1);

for i = 1:size(M,1)
  if inf(end)<M(i,1)
    sup(end+1)=M(i,1)-1;
    if M(i,2)<maxN
      inf(end+1)=M(i,2)+1;
    end
  else
    inf(end) = max(inf(end),M(i,2)+1);
  end
end
if length(inf)>length(sup)
  if inf(end)>maxN
      inf(end)=[];
  else
    sup(end+1)=maxN;
  end
end


resultat1 = inf(1)
resultat2 = sum(sup-inf+1)



