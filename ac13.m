clear all
close all

code = 1350;
origin = [1 1]+1;
target = [31 39]+1;

n=50;
T=zeros(n);

for x=0:n-1
  for y=0:n-1
    T(x+1,y+1)=mod(sum(length(find(dec2bin(x*x + 3*x + 2*x*y + y + y*y+code)=='1'))),2);
  end
end

[cpt,visited]=ac13_solve(T,origin,target,200);
visited;
resultat1 = cpt
[cpt,visited]=ac13_solve(T,origin,target,50);
resultat2 = size(visited,1)

for i=1:size(visited,1)
  T(visited(i,1),visited(i,2))=-1;
end
imagesc(T')
%imagesc(T')