clear all
M=textread('ac21_data.txt','%s','delimiter','\n');
%M=textread('ac21_data_test.txt','%s','delimiter','\n');

code1 = 'abcdefgh'; 
code2 = 'fbgdceah';

resultat1 = ac21_scramble(M,code1,0)      % gbhafcde
%reversed1 = ac21_scramble(M,resultat1,1)  % abcdefgh

resultat2 = ac21_scramble(M,code2,1)      % bcfaegdh
%reversed2 = ac21_scramble(M,resultat2,0)  % fbgdceah