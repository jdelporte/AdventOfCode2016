function a = ac12_calculate(c)

a=1;        % cpy 1 a
b=1;        % cpy 1 b
d=26;       % cpy 26 d
if c~=0     % jnz c 2 % jnz 1 5
  c=7;      % cpy 7 c
  d=d+1;    % inc d
  c=c-1;    % dec c
  while c~=0
    d=d+1;
    c=c-1;
  end
end         % jnz c -2
c=a;        % cpy a c
a=a+1;      % inc a
b=b-1;      % dec b
while b~=0  
  a=a+1;
  b=b-1;
end         % jnz b -2
b=c;        % cpy c b
d=d-1;      % dec d
while d~=0
  c=a;        
  a=a+1;      
  b=b-1;      
  while b~=0  
    a=a+1;
    b=b-1;
  end         
  b=c;        
  d=d-1;     
end         % jnz d -6
c=16;       % cpy 16 c
d=12;       % cpy 12 d
a=a+1;      % inc a
d=d-1;      % dec d
while d~=0
  a=a+1;     
  d=d-1;     
end         % jnz d -2
c=c-1;      % dec c
while c~=0
  d=12;       
  a=a+1;      
  d=d-1;      
  while d~=0
    a=a+1;     
    d=d-1;     
  end         
  c=c-1;     
end         %jnz c -5