# An_actions
Computation of group actions for An with n&lt;40.

The code was run in Magma 2.28-14 and python3. This work utilized resources from Unity, a collaborative, multi-institution high-performance computing cluster managed by UMass Amherst Research Computing and Data.

# Files

bertram.m
bertram.py
final-check.m






# Running the code



# Special Cases

There were 8 signatures of the type [1;k] which did not create examples using the code above. (These cases may be seen in the error files in OnePeriodsOutputs folder.) 

* Two of these signatures are not valid signatures, as noted in the paper: for n=5 [1;2] and for n=6 [1;3].
* For n=8 [1;2] and [1;3] and n=10 [1;2] we reran the code but picking an initial element of order k with smaller support.  This gave succesful examples which are in the corresponding n files in the OnePeriodsOutput folder.
* For the remaining  n=5 [1;3]
	n=6  [1;4]
  n=8 [1;5]





