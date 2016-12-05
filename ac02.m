clear all;
M=textread('ac02_data.txt','%s');

KP1 = ['123';'456';'789'];
pos = [2 2];
resultat1='';
for i=1:length(M)
  for j=1:length(M{i})
    switch M{i}(j)
      case 'U'
        pos(1)=max(1,pos(1)-1);  
      case 'D'      
        pos(1)=min(3,pos(1)+1);
      case 'R'
        pos(2)=min(3,pos(2)+1);      
      otherwise
        pos(2)=max(1,pos(2)-1);
    end
  end
  resultat1 = [resultat1 KP1(pos(1),pos(2))];
end

resultat1

KP2 = ['00100';'02340';'56789';'0ABC0';'00D00' ];
pos = [3 1];
resultat2='';

for i=1:length(M)
  for j=1:length(M{i})
    switch M{i}(j)
      case 'U'
        if (sum(pos)>4) && ((pos(2)-pos(1))<2)
          pos(1)=pos(1)-1;  
        end
      case 'D'      
        if (sum(pos)<8) && ((pos(1)-pos(2))<2)
          pos(1)=pos(1)+1;
        end
      case 'R'
        if (sum(pos)<8) && ((pos(2)-pos(1))<2)
          pos(2)=pos(2)+1;      
        end
      otherwise
        if (sum(pos)>4) && ((pos(1)-pos(2))<2)
          pos(2)=pos(2)-1;
        end
    end
  end
  resultat2 = [resultat2 KP2(pos(1),pos(2))];
end

resultat2
