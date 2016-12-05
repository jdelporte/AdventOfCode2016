import hashlib

target = '00000'
id = 'uqwqemis'
i = 0
count1 = 0
count2 = 0
resultat1 = ''
resultat2 = ['0','0','0','0','0','0','0','0']
done2 = [0,0,0,0,0,0,0,0]
while (count2<8):
	plaintext = id+str(i)
	hash = hashlib.md5(plaintext.encode('ascii')).hexdigest()
	if hash[:5] == target:
		if count1<8:
			resultat1 = resultat1+hash[5]
		count1 = count1+1
		if ('0'<=hash[5]) and (hash[5]<='7'): 
			if done2[int(hash[5])]==0:
				done2[int(hash[5])]=1
				resultat2[int(hash[5])]=hash[6]		
				count2 = count2+1
	i = i + 1

print('resultat1 = '+resultat1)
print('resultat2 = '+''.join(resultat2))
