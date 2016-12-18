clear all
s = textread('ac18_data.txt','%s'){1};
%s ='.^^.^.^^^^';

n=40;
tiles = double(s=='^')';
resultat1 = sum(tiles==0);
for i=2:n
  %il suffit que celui de gauche soit différent de celui de droite
  tiles = abs(diff(abs(diff([0;tiles;0]))));  
  resultat1 = resultat1 + sum(tiles==0);
end
resultat1

n=400000;
tiles = double(s=='^')';
resultat2 = sum(tiles==0);
for i=2:n
  %il suffit que celui de gauche soit différent de celui de droite
  tiles = abs(diff(abs(diff([0;tiles;0]))));  
  resultat2 = resultat2 + sum(tiles==0);
end
resultat2 



