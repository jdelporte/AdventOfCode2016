clear all

t=textread('ac01_data.txt','%s','delimiter',', ');

dir=[1;0]; % direction de départ (vers le haut)
pos=[0;0]; % position de départ
vus=[0 0]; % liste des cases visitées
done=0; 

for i=1:length(t)      
    pas=str2num(t{i}(2:end));
    if strcmp(t{i}(1),'R' )
        %matrice de rotation vers la droite
        rot=[cos(-pi/2) -sin(-pi/2);sin(-pi/2) cos(-pi/2)];        
    else    
        %matrice de rotation vers la gauche
        rot=[cos(pi/2) -sin(pi/2);sin(pi/2) cos(pi/2)];        
    end    
    dir=round(rot*dir);
    newPos = pos+pas*dir;
    
    %recherche d'une case déjà visitée
    if ~done
      curVus = [linspace(pos(1),newPos(1),pas+1)' linspace(pos(2),newPos(2),pas+1)'];
      curVus = curVus(2:end,:); %les cases en cours de visite
      for j=1:size(curVus,1)
        cpt= sum(vus(:,1)==curVus(j,1) & vus(:,2)==curVus(j,2));     
        if cpt>0
          done = 1;
          intersection = curVus(j,:);
        end
      end     
      vus=[vus; curVus];
    end
    pos= newPos;
end

resultat1 = sum(abs(pos))
resultat2 = sum(abs(intersection))