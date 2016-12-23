function out = ac22_reconstructPath(cameFromKey,cameFromVal,current)
  ind = find(ismember(cameFromKey(:,3:4),current,'rows'));  
  out = cameFromKey(ind,:) ;
  while sum(ind)
    current = cameFromVal(ind,:);
    out = [current ; out];
    ind = find(ismember(cameFromKey,current,'rows'));
  end
end
