function [out1,out2]=ac10_findBot(TO,TB,O,B,bot,lower_item,higher_item)
  ind=find(B(bot,:));
  if length(ind)<2
    out1 = -1;
    out2 = O;
  else
    if (lower_item==min(ind)) && (higher_item==max(ind))
      out1 = bot;
      out2 = O;
    else
      [val,lbot]=min(TB(bot,:));
      if val == 0
        [val,lout]=min(TO(bot,:));
        B(bot,min(ind))=0;
        O(lout,min(ind))=1;
      else
        B(bot,min(ind))=0;
        B(lbot,min(ind))=1;        
      end
      [val,hbot]=max(TB(bot,:));
      if val == 0        
        [val,hout]=max(TO(bot,:));
        B(bot,max(ind))=0;
        O(hout,max(ind))=1;
      else
        B(bot,max(ind))=0;   
        B(hbot,max(ind))=1;
      end
      [i,j]=find(B);
      if length(i>0)
        list = unique(i)(find(histc(i,unique(i))>=2));
        if length(list)==0
          out1 = -1;
          out2 = O;
        else
          nextBot=list(1);
          [out1,out2] = ac10_findBot(TO,TB,O,B,nextBot,lower_item,higher_item);        
        end
      else
          out1 = -1;
          out2 = O;
      end
      %if (sum(B(lbot,:))>=2)
      %  tmp = ac10_findBot(T,B,lbot,lower_item,higher_item);        
      %  if tmp > -1
      %    botChosen =[lbot find(B(lbot,:))]
      %    out = tmp;
      %  else
      %    if (sum(B(hbot,:))>=2)
      %     botChosen =[hbot find(B(hbot,:))]
      %      out = ac10_findBot(T,B,hbot,lower_item,higher_item);
      %    else 
      %      out = -1;
      %    end
      %  end        
      %else
      %  botChosen =[hbot find(B(hbot,:))]
      %  out = ac10_findBot(T,B,hbot,lower_item,higher_item);
      %end
    end
  end
end