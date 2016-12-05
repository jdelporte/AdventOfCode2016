clear all

M=load('ac03_data.txt');

M1=sort(M')';
M2=sort(reshape(M,3,size(M,1)))';

resultat1 = sum(M1(:,1)+M1(:,2)>M1(:,3))
resultat2 = sum(M2(:,1)+M2(:,2)>M2(:,3))