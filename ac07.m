clear all
M=textread('ac07_data.txt','%s');

resultat1=0;
resultat2=0;

for i=1:length(M)
  s=M{i};
  [startsI,endsI]=regexp(s,'\[[a-z]*\]');
  startsO=[0 endsI];
  endsO=[startsI length(s)+1];
  containedInside=0;  
  containedOutside=0;
  for j=1:length(startsI)
    containedInside=containedInside || ac07_containsAbba(s(startsI(j)+1:endsI(j)-1));
  end
  for j=1:length(startsO)
    containedOutside=containedOutside || ac07_containsAbba(s(startsO(j)+1:endsO(j)-1));
  end  
  if containedOutside && ~containedInside
    resultat1=resultat1+1;
  end
  
  indO=[];
  for j=1:length(startsO)
    indO=[indO startsO(j)+ac07_findAba(s(startsO(j)+1:endsO(j)-1))]; 
  end
  found=0;
  for j=1:length(indO)
    reversePattern=[s(indO(j)+1) s(indO(j)) s(indO(j)+1)];
    for k=1:length(startsI)
      if length(strfind(s(startsI(k)+1:endsI(k)-1),reversePattern))>0
        found = 1;
      end
    end
  end
  if found
    resultat2=resultat2+1;
  end
end

resultat1
resultat2