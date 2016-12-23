function [out]=ac22_astar(origin,target,U,S,A);

  curNodes = ac22_getPairs(U,A);
  curPos = ones(size(curNodes,1),1)*origin;
  closedSet = [];
  openSet = unique([curNodes(:,3:4) curPos],'rows');
  cameFromKey=[];
  cameFromVal=[];
  gScore = zeros(size(openSet,1));
  for i=1:size(openSet,1)
    fScore(i) = ac22_heuristic(target,origin,curNodes(i,3:4));
  end
  while ~isempty(openSet)
    [val,ind] = min(fScore);
    current = openSet(ind,:);
    currentGScore = gScore(ind);
    %disp(['fScore = ' num2str(val) ' , gScore = ' num2str(currentGScore)]);
    if current(3:4) == target
      break;
    end
    openSet(ind,:)=[];
    fScore(ind)=[];
    gScore(ind)=[];
    closedSet = [closedSet ; current];
    neighbors = ac22_findNextStates(U,S,A,current);
    for i=1:size(neighbors,1)
      ismember(closedSet,neighbors(i,:));
      if ~sum(ismember(closedSet,neighbors(i,:),'rows'))
        tentative_gScore = currentGScore + 1;
        posN = find(ismember(openSet,neighbors(i,:),'rows'));
        if ~sum(posN) 
          cameFromKey=[cameFromKey ; neighbors(i,:)];
          cameFromVal=[cameFromVal ; current];
          openSet = [openSet ; neighbors(i,:)];
          gScore = [gScore ; tentative_gScore];
          fScore = [fScore ; tentative_gScore + ac22_heuristic(target,neighbors(i,3:4),neighbors(i,1:2))];
        else
          if tentative_gScore < gScore(posN)
            cfInd = find(ismember(cameFromKey,neighbors(i,:),'rows'));
            cameFromVal(cfInd,:)=current;
            gScore(posN) = tentative_gScore;
            fScore(posN) = tentative_gScore + ac22_heuristic(target,neighbors(i,3:4),neighbors(i,1:2));
          end
        end
      end          
    end
  end
  out = ac22_reconstructPath(cameFromKey,cameFromVal,target);
end
  