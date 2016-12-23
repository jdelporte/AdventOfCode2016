function ac22_generateGif(filename,U,steps)
  figure(1)
  U=((U-min(min(U)))/(max(max(U))))*200;
  U(steps(1,1),steps(1,2))=-1000; 
  U(steps(1,3),steps(1,4))=1000;  
  
  imagesc(U');
  pause(0.01); 
  imwrite(U,filename,'gif','writemode','overwrite','LoopCount',inf,'DelayTime',0);
  for i=2:size(steps,1)    
    U(steps(i,1),steps(i,2))=50;  
    U(steps(i-1,1),steps(i-1,2))=100;  
    U(steps(i,3),steps(i,4))=255;        
    imagesc(U');
    pause(0.01);
    imwrite(U,filename,'gif','writemode','append','DelayTime',0.05);
  end
end