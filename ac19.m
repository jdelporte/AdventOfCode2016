n=3018458;
%n=6;

v=(1:n)';
even = 1;
while length(v)>1
  if even
    even = mod(length(v),2)==0;
    v=v(1:2:end-1);
  else
    even = mod(length(v),2)==0;
    v=v(2:2:end);
  end
end
resultat1 = v

v=(1:n)';
alive=ones(n,1);
i=1;
while length(v)>1
  len = length(v);  
  some = max(floor(len/5),1);
  ind = len:-1:len-some+1;  
  j=mod((i:2:some*2)+floor(ind/2)-1,ind)+1;
  v(j)=[];
  if length(v)>1
    v=v([some+1:end 1:some]);
  end
end
resultat2 = v






