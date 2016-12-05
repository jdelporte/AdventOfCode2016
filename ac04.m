clear all

[M]=textread('ac04_data.txt','%s');

resultat1 = 0;
for i=1:length(M)
  s = strrep(strrep(strrep(M{i},'-',''),'[',''),']','');
  [ind] = find(isstrprop(s,'digit'));
  name = sort(s(1:ind(1)-1)) ;
  id = str2num(s(ind));
  checksum = s(ind(end)+1:end);
  [uniq,j,k] = unique(name);
  count = histc(name,uniq);
  [v,ind]=sort(count,'descend');
  res=uniq(ind);
  if findstr(res,checksum)==1
    resultat1 = resultat1 + id;
    [ind] = find(isstrprop(M{i},'digit'));
    oldname = M{i}(1:ind(1)-1);    
    realname = char(mod(oldname+id-'a',26)+'a') ;
    realname(findstr(oldname,'-'))=' ' ;
    %[realname ' ' id]
    if findstr(realname,'north')
      possible = [realname ' ' num2str(id)]
      resultat2 = id;
    end
  end  
end

resultat1
resultat2


