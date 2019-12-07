import os
import subprocess

flag = True
time = 10

print()
print('-'*25)
print(' | ','code'.ljust(5), ' | ', 'Instance File'.ljust(13), ' | ')
print('-'*25)
for i in range(1,6):
	print(' | ', str(i).ljust(5), ' | ', 'inst'+str(i)+'.asp'.ljust(10), ' | ')
print('-'*25)
print()

instance_code = input('Please enter the code for the instance file: ')

while flag:
	out = subprocess.Popen(['clingo', 'demo.asp', os.path.join('simpleInstances','inst'+str(instance_code)+'.asp'), '-c', 'n='+str(time)], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
	stdout,stderr = out.communicate()
	
	if 'UNSATISFIABLE' in stdout.decode("utf-8").split():
		time = time + 2
	else:
		flag = False
		print(stdout.decode("utf-8"))