function [resultat,solutions]=ac14_solve(version)

id = 'yjdafjpo';

count = 0;

i = 0;
stringToTest = {}; % les clefs qui ont 3 caractères répétés
digitToTest = {}; % les chiffres qui sont répétés 3 fois dans ces clefs
indToTest = []; % les indices de ces clefs
solutions = [];

while count < 70
  key1 = md5sum([id num2str(i)],1);
  if version ~= 1
    key2 = ac14_get2016Key(key1);
  end
  key = key1;
  if length(stringToTest)
    curDigits = ac14_containsRepeatedChar(key,5);
    if length(curDigits)        
      inds = [];
      for k = 1:length(curDigits)
        for j = 1:length(digitToTest)
          if length(strfind(digitToTest{j},curDigits(k)))>0
            inds = [inds;j];
          end
        end
      end
      if length(inds)
        solutions = [solutions;indToTest(inds)];
        count = count + length(inds)
        stringToTest(inds)=[];
        digitToTest(inds)=[];
        indToTest(inds)=[];    
      end
    end
  end
  curDigits = ac14_containsRepeatedChar(key,3);
  if length(curDigits)        
    stringToTest=[stringToTest ; key];
    digitToTest=[digitToTest ; curDigits];
    indToTest=[indToTest ; i];     
  end
  ind = find(indToTest<=i-1000);
  if length(ind)
    stringToTest(ind)=[];
    digitToTest(ind)=[];
    indToTest(ind)=[];      
  end
  i=i+1;
  if mod(i,1000)==0
    %i
  end
end
solutions;
resultat=unique(solutions)(64);

