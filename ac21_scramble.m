function code=ac21_scramble(instructions,code,reversed)
  for i=1:length(instructions)
    if reversed
      s=instructions{end-i+1};
    else
      s=M=instructions{i};
    end
    if strfind(s,'swap position')
      [d,f]=regexp(s,'[0-9]+');
      tmp = code;
      i1 = str2num(s(d(1):f(1)))+1;
      i2 = str2num(s(d(2):f(2)))+1;
      tmp(i1)=code(i2);
      tmp(i2)=code(i1);
      code=tmp;
    end
    if strfind(s,'swap letter')
      l = s(regexp(s,'letter [a-z]')+7);
      tmp = code;
      tmp(code==l(1))=l(2);
      tmp(code==l(2))=l(1);
      code=tmp;
    end
    if strfind(s,'rotate based')   
      if reversed      
        ind = [2 4 6 8 3 5 7 1];
        l = find(ind==find(code==s(regexp(s,'letter [a-z]')+7)))-1;
      else
        l = find(code==s(regexp(s,'letter [a-z]')+7))-1;
      end
      if l>=4
        l=l+1;
      end
      l=mod(l,length(code))+1;
      if reversed
        %code = code([end-l+1:end 1:end-l]);
        code = code([l+1:end 1:l]);
      else
        code = code([end-l+1:end 1:end-l]);
      end
    else
      if strfind(s,'rotate')
        [d,f]=regexp(s,'[0-9]+');
        l = str2num(s(d:f));
        if strfind(s,'left')
          if reversed
            code([l+1:end 1:l]) = code;
          else
            code = code([l+1:end 1:l]);
          end
        else        
          if reversed
            code([end-l+1:end 1:end-l]) = code;
          else
            code = code([end-l+1:end 1:end-l]);
          end
        end  
      end 
    end
    if strfind(s,'reverse')
      [d,f]=regexp(s,'[0-9]+');
      tmp = code;
      i1 = str2num(s(d(1):f(1)))+1;
      i2 = str2num(s(d(2):f(2)))+1;
      code(i1:i2)=fliplr(code(i1:i2));
    end
    if strfind(s,'move')
      [d,f]=regexp(s,'[0-9]+');
      tmp = code;
      i1 = str2num(s(d(1):f(1)))+1;
      i2 = str2num(s(d(2):f(2)))+1;
      if i1<i2
        if reversed 
          code([i1+1:i2 i1])=code(i1:i2);  
        else 
          code(i1:i2)=code([i1+1:i2 i1]);  
        end
      else
        if reversed
          code([i1 i2:i1-1])=code(i2:i1); 
        else
          code(i2:i1)=code([i1 i2:i1-1]);    
        end
      end
    end
    %code
  end
end

