clear all

M=textread('ac12_data.txt','%s','delimiter','\n');
i=1;

val('d')=0;
cpt=0;
while i<=length(M)
  s=M{i};
  inst = strsplit(s) ;
  if inst{1} =='cpy'
    if ('a'<=inst{2})  && (inst{2}<='z')
      val(inst{3})=val(inst{2});
    else  
      val(inst{3})=str2num(inst{2});
    end
    %disp(['cpy ' num2str(val(inst{3})) ' ' inst{3}]);
  end
  if inst{1} =='inc'
    val(inst{2})=val(inst{2})+1;
    %disp([s ' (' num2str(val(inst{2})) ')']);
  end
  if inst{1} =='dec'
    val(inst{2})=val(inst{2})-1;    
    %disp([s ' (' num2str(val(inst{2})) ')']);
  end
  if inst{1} =='jnz'
    if val(inst{2}) 
      if ('a'<=inst{3})  && (inst{3}<='z')
        i=i+val(inst{3});
      else
        i=i+str2num(inst{3});
      end
     % disp(['jump to ' num2str(i)]);
    else
      i=i+1;
    end
  else
    i=i+1;
    %disp(['a = ' num2str(val('a')) ' ; ' 'b = ' num2str(val('b')) ' ; ' 'c = ' num2str(val('c')) ' ; ' 'd = ' num2str(val('d'))]);
  end
  cpt=cpt+1;
end

resultat1=val('a')
