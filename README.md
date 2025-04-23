# An_actions
Computation of group actions for An with n&lt;40.

The code was run in Magma 2.28-14 and python3. This work utilized resources from Unity, a collaborative, multi-institution high-performance computing cluster managed by UMass Amherst Research Computing and Data.

# Files

* *bertram.m*
* *bertram.py*
* *final-check.m*






# Running the code



# Special Cases

There were 8 signatures of the type [1;k] which did not create examples using the code above. (These cases may be seen in the error files in OnePeriodsOutputs folder.) 

* Two of these signatures are not valid signatures, as noted in the paper: for n=5 [1;2] and for n=6 [1;3].
* For n=8 [1;2] and [1;3] and n=10 [1;2], we reran the code but picking an initial element of order k with smaller support.  This produced examples which are listed in the corresponding n files in the OnePeriodsOutput folder.
* For the remaining values, we used [other code](https://github.com/jenpaulhus/breuer-modified) to generate examples. Here are the list of generating vectors (given as *a*, *b*, *c*):
	*  n=5 [1;3]  (1, 4, 3, 2, 5), (1, 3, 4), (1, 2, 3)

 	* n=6 [1;4]  (1, 3, 4, 2, 5), (1, 5, 6, 3, 4), (1, 2, 3, 4)(5, 6)

  	* n=8 [1;5]  (1, 4)(2, 3), (1, 4, 5, 6, 7, 8, 2), (1, 2, 3, 4, 5)





