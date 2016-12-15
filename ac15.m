clear all

S=textread('ac15_data.txt','%s','delimiter','\n');
M=zeros(length(S),3); 
for i=1:length(S)
  [d,f]=regexp(S{i},'[0-9]+');
  M(i,1)=str2num(S{i}(d(1):f(1)));
  M(i,2)=str2num(S{i}(d(4):f(4)));
  M(i,3)=str2num(S{i}(d(2):f(2)));
end
% M contient le numéro du disque, la position de départ et le nombre de position

%M=[1 4 5;2 1 2]; % cette matrice donne bien le résultat 5

t=0;
while sum(mod(M(:,1)+M(:,2)+t,M(:,3)))~=0
  t=t+1;
end
resultat1 = t

M=[M;7 0 11];
while sum(mod(M(:,1)+M(:,2)+t,M(:,3)))~=0
  t=t+1;
end
resultat2 = t


