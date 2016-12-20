clear all
code='gdjjyniy';
origin = [1 1];
target = [4 4];

[n,steps]=ac17_solve(origin,target,code,10000);

resultat1 = steps{1}(length(code)+1:end)
resultat2 = n