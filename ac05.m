
id = 'uqwqemis';
password ='';
solution=[];

%trouvé par bruteforce

inds=0:100000000;
%inds=[4515059 6924074 7800000:100000000];
for i=inds
  hashcode = md5sum([id num2str(i)],1);
  if sum(hashcode(1:5)-'0')==0
    solution = [solution i]
    hashcode
    password = [password hashcode(6)];
  end
  if mod(i,100000)==0
    i
  end
end

resultat1 = password
