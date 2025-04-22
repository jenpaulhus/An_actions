# Code to implement Bertram paper
# Last edited:  Oct 24, 2024

# python3 bertram.py 14
# n variable passed in


#TO DO:
# Transpositions only and add one length



import sys


def find_bertram_cycles(full_list, n,  added_support = []):
	O = []
	E = []
	T = []
	for i in range(len(full_list)):
		cycle_length = len(full_list[i])
		if cycle_length % 2 == 1:
			O.append(full_list[i])
		elif cycle_length % 2 == 0 and cycle_length > 2:
			E.append(full_list[i])
		else:
			T.append(full_list[i])
	d = len(O)
	e = len(E)+len(T)
	v = len(E)
	t = len(T)
	if (v % 2) == 0:
		vpairs = v
		tpairs = 0
	else:
		vpairs = v-1
		tpairs = 1
	if len(added_support) > 0:
		if len(E) > 1:
			support_cue = E[1][0]
		elif len(T) > 0:
			support_cue = T[0][0]
		else:
			support_cue = O[0][0]
	else:
		support_cue = 0
	# print("SUPPORT CUE:", support_cue)

	A = []
	for i in range(d):
		X = O[i]
		for j in range(int((len(X)+1)/2)):
			if X[j] == support_cue:
				# print("Really hope not here")
				for s in added_support: #JP can change this to for at end??
					A.append(s)
			A.append(X[j])

	for i in range(0,vpairs,2):
		X = E[i]
		for j in range(int(len(X)/2),len(X)):
			A.append(X[j])
		A.append(X[0])
		X = E[i+1]
		for j in range(int(len(X)/2)):
			if X[j] == support_cue:
				# print("And not here??")
				for s in added_support:
					A.append(s)
			A.append(X[j])
	if v != vpairs:
		# print("HOPE NOT HERE")
		X = E[v-1]
		for j in range(int(len(X)/2),len(X)):
			A.append(X[j])
		A.append(X[0])
		if T[0][0] == support_cue:
			for s in added_support:
				A.append(s)
		A.append(T[0][0])


	for i in range(tpairs,t,2):
		X = T[i]
		A.append(X[1])
		A.append(X[0])
		if X[0] == support_cue:
			# print("GOT HERE A before", A)
			for s in added_support:
				A.append(s)
			# print("A after")
		X = T[i+1]
		A.append(X[0])

	B = []
	added_support.reverse()  # needs to go other way for B
	for i in range(t,tpairs,-2):
		X = T[i-1]
		B.append(X[1])
		B.append(X[0])
		X = T[i-2]
		if X[0] == support_cue:
			for s in added_support:
				B.append(s)
		B.append(X[1])

	if v != vpairs:
		B.append(T[0][1])
		B.append(T[0][0])
		if T[0][0] == support_cue:
			for s in added_support:
				B.append(s)
		X = E[v-1]
		for j in range(1,int(len(X)/2)+1):
			B.append(X[j])

	for i in range(vpairs,0,-2):
		X = E[i-1]
		for j in range(int(len(X)/2),len(X)):
			B.append(X[j])
		B.append(X[0])
		if X[0] == support_cue:
			for s in added_support:
				B.append(s)
		X = E[i-2]
		for j in range(1,int(len(X)/2)+1):
			B.append(X[j])

	for i in range(d,0,-1):
		X = O[i-1]
		for j in range(int((len(X)+3)/2),len(X)+1):
			B.append(X[j-1])
			#if X[j-1] == support_cue:
				#for s in added_support:
					#B.append(s)
		B.append(X[0])
		if X[0] == support_cue:
			for s in added_support:
				B.append(s)


	if (len(A) % 2) == 0:
		# print ("STARTING A AND B", A, B)
		if len(O) > 0:
			A.insert(A.index(O[0][1]),O[0][len(O[0])-1])   # better way for last elt?
			B.insert(B.index(O[0][len(O[0])-1])+1,O[0][1])
			# print("BAH",B.index(O[0][len(O[0])-1])+1, O[0][1])
		elif len(E) > 0:
			# print("BAH", A.index(E[0][int(len(E[0])/2)])+1, E[0][int(len(E[0])/2)-1])
			A.insert(A.index(E[0][int(len(E[0])/2)])+1,E[0][int(len(E[0])/2)-1])
			B.insert(B.index(E[0][int(len(E[0])/2)]),E[0][int(len(E[0])/2)+1])
		else:
			A.insert(A.index(T[0][1])+1,T[1][1])
			B.insert(B.index(T[1][1])+1,T[0][0])

	strA = "("
	for a in range(len(A)):
		strA += str(A[a])
		if a != len(A)-1:
			strA += ","
	strA += ")"


	strB = "("
	for b in range(len(B)):
		strB += str(B[b])
		if b != len(B)-1:
			strB += ","
	strB += ")"


	strX = ""
	for ell in range(len(full_list)):
		X = full_list[ell]
		strX += "("
		for x in range(len(X)):
			strX += str(X[x])
			if x != len(X)-1:
				strX += ","
		strX += ")"


	wrt_file = "toMagma_" + str(n) + ".m"
	with open(wrt_file, "a") as f:
		print("x:=A!" + strX + "; " + "a:=A!" + strA + "; " + "b:=A!" + strB + "; " + "n:=" + str(n) + "; " + "compare_python_output(a,b,x,n,A);", file=f)




n = int(sys.argv[1])
wrt_file = "toMagma_" + str(n) + ".m"
opn_file = "toPython_" + str(n) + ".py"
with open(wrt_file,"a") as f:
	print('load "final_check.m";', file=f)
	print("A:=Alt(" + str(n) +");", file=f)
	print('\n',file=f)

with open(opn_file,"r") as f:
	for line in f:
		exec(line)
