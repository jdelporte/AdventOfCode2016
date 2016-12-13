function [out,visited]=ac13_solve(T,origin,target,n);
  visited = [];
  curNodes = origin;
  cpt=0;
  while (cpt<=n) && ~ismember(curNodes,target,'rows')
    visited = [visited ; curNodes];
    newNodes = [];
    for i=1:size(curNodes,1)
      tmp=ones(4,1)*curNodes(i,:)+[-1 0;1 0;0 -1; 0 1];
      for j=1:size(tmp,1)
        if length(find(tmp(j,:)<=0 | tmp(j,:)>size(T,1)))==0
          if ~sum(ismember(visited,tmp(j,:),'rows')) 
            if ~sum(ismember(newNodes,tmp(j,:),'rows'))
              if T(tmp(j,1),tmp(j,2))==0
                newNodes = [newNodes; tmp(j,:)];
              end
            end
          end
        end
      end
    end    
    curNodes = newNodes;
    cpt=cpt+1;
  end
  out = cpt;
end
  