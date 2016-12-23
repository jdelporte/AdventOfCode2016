function out = ac22_heuristic(target,currentGoal,currentVoid)
  out = 5*sum(abs(target-currentGoal))+sum(abs(currentVoid-currentGoal));
end

