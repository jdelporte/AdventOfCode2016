clear all

M=cell2mat(textread('ac06_data.txt','%s'));
resultat1='';
resultat2='';

for i=1:size(M,2)
  v=M(:,i);
  uniq=unique(v);
  count=histc(v,uniq);
  [val1,ind1]=max(count);
  [val2,ind2]=min(count);
  resultat1=[resultat1 uniq(ind1)];
  resultat2=[resultat2 uniq(ind2)];  
end

resultat1
resultat2