clear all

s='11100010111110100';

n=272;

v = str2num(s')';
while length(v)<n
  v=[v 0 fliplr(1-v)];
end
v=v(1:n);
cs = v;
while mod(length(cs),2)==0
  cs = 1-abs(diff(cs)(1:2:end));
end
resultat1 = num2str(cs')'

n=35651584;

v = str2num(s')';
while length(v)<n
  v=[v 0 fliplr(1-v)];
end
v=v(1:n);
cs = v;
while mod(length(cs),2)==0
  cs = 1-abs(diff(cs)(1:2:end));
end
resultat2 = num2str(cs')'
