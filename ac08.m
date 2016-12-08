clear all
close all

M=textread('ac08_data.txt','%s','delimiter','\n');
S=zeros(6,50);

for i=1:length(M)
  cmd = M{i};
  if strfind(cmd,'rect')
    [d,f]=regexp(cmd,'[0-9]+');
    col=str2num(cmd(d(1):f(1)));
    row=str2num(cmd(d(2):f(2)));
    S(1:row,1:col)=1;
  end
  if strfind(cmd,'row')    
    [d,f]=regexp(cmd,'[0-9]+');
    row = str2num(cmd(d(1):f(1)))+1;
    offset = str2num(cmd(d(2):f(2)));
    S(row,mod(offset:49+offset,50)+1)=S(row,:);
  end  
  if strfind(cmd,'column')
    [d,f]=regexp(cmd,'[0-9]+');
    col = str2num(cmd(d(1):f(1)))+1;
    offset = str2num(cmd(d(2):f(2)));  
    S(mod(offset:5+offset,6)+1,col)=S(:,col);
  end
end

resultat1 = sum(sum(S))
imagesc(S) 
resultat2 = 'AFBUPZBJPS' % en regardant l'image (le caractère ressemblant à un V/U est un U)
