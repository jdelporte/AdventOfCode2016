clear all
M=textread('ac10_data.txt','%s','delimiter','\n');

TB=sparse(0); %transfert vers bot
TO=sparse(0); %transfert vers output
B=sparse(0); %possession des robots
O=sparse(0); %possession des outputs


%Contruction
for i=1:length(M) 
  s=M{i};
  if strfind(s,'value')
    [d,f]=regexp(s,'[0-9]+');  
    value = str2num(s(d(1):f(1)));
    bot = str2num(s(d(2):f(2)))+1;
    B(bot,value)=1;
  end
  if strfind(s,'gives')    
    [d,f]=regexp(s,'[0-9]+');  
    giver = str2num(s(d(1):f(1)))+1;
    lower = str2num(s(d(2):f(2)))+1;
    higher = str2num(s(d(3):f(3)))+1;
    if strfind(s(1:d(2)),'output')      
      TO(giver,lower)=-1;  
    else
      TB(giver,lower)=-1;  
    end
    if strfind(s(f(2):end),'output')      
      TO(giver,higher)=1;
    else
      TB(giver,higher)=1;
    end
  end
end

%Resolution
startingBot = 14;

[out1,out2]=ac10_findBot(TO,TB,O,B,startingBot,17,61);
resultat1 = out1
[out1,out2]=ac10_findBot(TO,TB,O,B,startingBot,-1,1000);
resultat2 = find(out2(1,:))*find(out2(2,:))*find(out2(3,:))


