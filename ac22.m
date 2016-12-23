clear all 
data = textread('ac22_data.txt','%s','delimiter','\n');
for i=3:length(data)
  [d,f]=regexp(data{i},'[0-9]+');
  v=[data{i}(d(1):f(1));data{i}(d(2):f(2));data{i}(d(3):f(3));data{i}(d(4):f(4));data{i}(d(5):f(5));data{i}(d(6):f(6))];
  M(i-2,:)=str2num(v)'+[1 1 0 0 0 0];
end
for i=1:size(M)
  S(M(i,1),M(i,2))=M(i,3);
  U(M(i,1),M(i,2))=M(i,4);
  A(M(i,1),M(i,2))=M(i,5);
end

pairs=[];
for i=1:length(M)
  for j=[1:i-1 i+1:length(M)]
    if (0<U(M(i,1),M(i,2))) && (U(M(i,1),M(i,2))<=A(M(j,1),M(j,2)))
      pairs = [pairs;i j];
    end
  end
end
resultat1 = size(pairs,1)

steps = ac22_astar([size(S,2) 1],[1 1],U,S,A);
resultat2 = size(steps,1)-1

%ac22_generateGif('ac22_animation.gif',U,steps);
%ac22_solve(U,S,A,[1 size(S,2)],[1 1]);
figure(1)
U(steps(1,1),steps(1,2))=-1000; 
U(steps(1,3),steps(1,4))=1000;  
imagesc(U')
print ac22_animation.pdf -S320,320
pause(.01)
for i=2:size(steps,1)    
  U(steps(i,1),steps(i,2))=-1000;  
  U(steps(i-1,1),steps(i-1,2))=-500;  
  U(steps(i,3),steps(i,4))=1000;  
  imagesc(U')  
  print ac22_animation.pdf -append -S320,320
  pause(.01)
end
im = imread('ac22_animation.pdf','Index','all');
imwrite(im,'ac22_animation.gif','DelayTime',.05);

