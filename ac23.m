clear all

M=textread('ac23_data.txt','%s','delimiter','\n');


resultat1 = ac23_execute(M,7)
resultat2 = ac23_execute(M,12)
