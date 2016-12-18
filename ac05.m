
id = 'uqwqemis';
password1 = '';
password2 = '';
done2 =zeros(1,8);
count1 = 0;
count2 = 0;


%trouvé par bruteforce (en python)
inds=[4515059 6924074 8038154 13432968 13540621 14095580 14821988 16734551 17029030 17670493 17743256 18333805 19112977 20616595 21658552 21926249 26326685];

for i=inds
  hashcode = md5sum([id num2str(i)],1);
  if sum(hashcode(1:5)-'0')==0
    if count1<8   
      password1 = [password1 hashcode(6)];
      count1 = count1 + 1;
    end
    if count2<8
      index = hashcode(6)-'0'+1;
      if (1<=index) && (index<=8)
        if ~done2(index)
          password2(index)=hashcode(7);
          count2=count2+1;
          done2(index)=1;
        end
      end
    end
  end
end

resultat1 = steps
resultat2 = password2
