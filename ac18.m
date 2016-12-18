clear all
s = textread('ac18_data.txt','%s'){1};
%s ='.^^.^.^^^^';

n=400000;
T=zeros(length(s),n);
T(:,1) = double(s=='^')';

for i=2:n
  %il suffit que celui de gauche soit différent de celui de droite
  T(:,i) = abs(diff(abs(diff([0;T(:,i-1);0]))));  
end

resultat1 = sum(sum(T(:,1:40)==0))
resultat2 = sum(sum(T==0))



