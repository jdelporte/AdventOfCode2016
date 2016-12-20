function [out,steps]=ac17_solve(origin,target,code,n);
  visited = 0;
  curNodes = origin;
  curCodes = {code};
  cpt=0;
  steps={};
  while (cpt<=n) %&& ~ismember(curNodes,target,'rows')
    if sum(ismember(curNodes,target,'rows'))
      out = cpt;
      if length(steps)==0
        steps = curCodes(ismember(curNodes,target,'rows'));
      end
      curCodes(ismember(curNodes,target,'rows'))=[];
      curNodes(ismember(curNodes,target,'rows'),:)=[];
    end
    visited = visited+length(curCodes);
    newNodes = [];
    newCodes = {};
    for i=1:size(curNodes,1)
      hashcode = md5sum(curCodes{i},1);
      tmp = [];
      if curNodes(i,1)>1
          c=hashcode(1);
          if ('b'<=c) && (c<='f')
            newCodes{length(newCodes)+1} = [curCodes{i} 'U'];
            newNodes = [newNodes;curNodes(i,:)+[-1 0]];
          end
      end
      if curNodes(i,1)<4
          c=hashcode(2);
          if ('b'<=c) && (c<='f')
            newCodes{length(newCodes)+1} = [curCodes{i} 'D'];
            newNodes = [newNodes;curNodes(i,:)+[1 0]];
          end
      end
      if curNodes(i,2)>1
          c=hashcode(3);
          if ('b'<=c) && (c<='f')
            newCodes{length(newCodes)+1} = [curCodes{i} 'L'];
            newNodes = [newNodes;curNodes(i,:)+[0 -1]];
          end
      end
      if curNodes(i,2)<4
          c=hashcode(4);
          if ('b'<=c) && (c<='f')
            newCodes{length(newCodes)+1} = [curCodes{i} 'R'];
            newNodes = [newNodes;curNodes(i,:)+[0 1]];
          end
      end
    end
    curNodes = newNodes;
    curCodes = newCodes;
    cpt=cpt+1;
  end
  %out = cpt;
  %step=curCodes(ismember(curNodes,target,'rows'));
end
  