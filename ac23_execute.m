function out = ac23_execute(M,a)

  val('a')=a;
  val('d')=0;
  cpt=0;
  i=1;
  while i<=length(M)
    if i==5
      val('a')=val('b')*val('d');
      val('c')= 0;
      val('d')= 0;
      i= 11;
    else
      s=M{i};
      inst = strsplit(s) ;
      if inst{1} =='cpy'
        if ('a'<=inst{3})  && (inst{3}<='z')
          if ('a'<=inst{2})  && (inst{2}<='z')
            val(inst{3})=val(inst{2});
          else  
            val(inst{3})=str2num(inst{2});
          end
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
      if inst{1} == 'tgl'
        ind = val(inst{2});
        if i+ind <=length(M) && i+ind>=1
          M{i+ind};
          inst2 = strsplit(M{i+ind}) ;
          if length(inst2) == 2
            if inst2{1} == 'inc'
              M{i+ind}=['dec ' inst2{2}];
            else    
              M{i+ind}=['inc ' inst2{2}];
            end
          else
            if  inst2{1} == 'jnz'      
              M{i+ind}=['cpy ' inst2{2} ' ' inst2{3}];
            else
              M{i+ind}=['jnz ' inst2{2} ' ' inst2{3}];
            end
          end   
          M{i+ind};
        end
      end
      if inst{1} =='jnz'
        if ('a'<=inst{2})  && (inst{2}<='z')
          bool = val(inst{2}) ;
        else  
          bool = str2num(inst{2});
        end
        if bool
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
     
      end
      
      cpt=cpt+1;
      %if mod(cpt,1000)==0
      %  disp(['a = ' num2str(val('a')) ' ; ' 'b = ' num2str(val('b')) ' ; ' 'c = ' num2str(val('c')) ' ; ' 'd = ' num2str(val('d'))]);
      %end
    end
     
  end
  out = val('a');
end