# An_actions
This repository is a supplement to the paper *Signatures of alternating group actions with non-zero quotient genus*. Here we compute signatures of group actions for $An$ with $n \leq 40$ to complete the proof that all potential signatures are indeed actual signatures for $A_n$ with $n \geq 7$.    

The code was run in Magma 2.28-14 and python3. This work utilized resources from Unity, a collaborative, multi-institution high-performance computing cluster managed by UMass Amherst Research Computing and Data.




# Running the code

See the explanation in *description.pdf* for information on how the code was run and what each file and folder is for. 

# Special Cases

I. There were 8 signatures of the type $[1;k]$ which did not create examples using the code above. (These cases may be seen in the error files in OnePeriodsOutputs folder.) 

* Two of these signatures are not valid signatures, as noted in the paper: for $n=5$ $[1;2]$ and for $n=6$ $[1;3]$.
* For $n=8$ $[1;2]$ and $[1;3]$ and $n=10$ $[1;2]$, we reran the code but picking an initial element of order k with smaller support.  This produced examples which are listed in the corresponding n files in the OnePeriodsOutput folder.
* For the remaining values, we used [other code](https://github.com/jenpaulhus/breuer-modified) to generate examples. Here are the list of generating vectors (given as *a*, *b*, *c*):
	* $n=5$ $[1;3]$:  $(1\  4\  3\  2\  5)$, $(1\  3\  4)$, and $(1\  2\  3)$

 	* $n=6$ $[1;4]$:  $(1\  3\  4\  2\  5)$, $(1\  5\  6\  3\  4)$, and $(1\  2\  3\  4)(5\  6)$

  	* $n=8$ $[1;5]$:  $(1\  4)(2\  3)$, $(1\  4\  5\  6\  7\  8\  2)$, and $(1\  2\  3\  4\  5)$
 


II. There were a few failures for signatures of the type $[1;k,k]$ for small, even $n$.

* We ran [other code](https://github.com/jenpaulhus/breuer-modified) to create generating vectors in these cases.
* Here are the list of generating vectors (given as *a*, *b*, *c1*, *c2*):
	* n=6 and k=2,4
	* n=8 and k=2,6
	* n=12 and k=2,4,6,10,12,14,20,30

<br > <br >

III. Because $[1;2]$ (resp. $[1;3]$) is not an actual signature for $n=5$ (resp. $n=6$), we need to also compute $[1;2,2]$ and [1;2,2,2] for $n=5$ (resp. $[1;3,3]$ for $n=6$).  Here are those generating vectors

* $n=5$ $[1;2,2]$: $a=(1\ 5\ 4\ 3\ 2)$, $b=Id(G)$, $c_1=(1\ 2)(3\ 4)$, $c_2=(1\ 2)(3\ 4)$

* $n=5$ $[1;2,2,2]$: $a=(2\  5\  4)$, $b=(1\  5\  4)$, $c_1=(1\  2)(3\  4)$, $c_2=(1\  2)(3\  4)$, $c_3=(1\  2)(4\  5)$

* $n=6$ $[1;3,3]$: $a=(1\  6\  5\  4)(2 \ 3)$, $b=(1\  5\  6\  3)(2\  4)$, $c_1=(1\ 2\ 3)(4\ 5\ 6)$, $c_2=(1\  4\ 2)(3\  5 6)$

IV. We next moved on to signatures $[1;k_1,k_2]$ by showing that there were elements $c_1$ and $c_2$ of order $k_1$ and $k_2$, respectively, which generate $A_n$.  There were about a dozen failures. We give the elements $c_1$ and $c_2$ respectively as well as the signature they satisfy below. 

$n=5$ $[1;2,3]$: $(1\  2)(3\  4)$ and $(1\  5\  4)$


$n=9$ $[1;2,3]$: $(1\  5)(3\  7)(4\  8)(6\  9)$ and $(1\  7\  5)(2\  4\  9)(3\  8\  6)$


$n=10$ $[1;2,4]$: $(1\ 2)(3\ 4)(5 \ 6)(7 \ 8)$ and  $(1\ 9\ 3\ 5)(2\ 8 \ 10 \ 7)$

$n=12$ $[1;2, 3]$: $(1\ 2)(3\ 4)(5\ 6)(7\ 8)(9\ 10)(11\ 12)$ and $(1\ 9\ 3)(2\ 5\ 7)(8\ 10\ 11)$

$n=16$ $[1;2, 4]$: $(1\  2\  3\  4)(5\  6\  7\  8)(9\  10\  11\  12)(13\  14\  15\  16)$ and $(1\  5)(4\  7)(6\  9)(8\  15)(10\  13)(14\  16)$


$n=18$ $[1;4, 16]$: $(1\  2\  3\  4\  5\  6\  7\  8\  9\  10\  11\  12\  13\  14\  15\  16)(17\  18)$ and $(1\  17\  13\  12)(3\  14\  5\  4)(6\  15\  8\  7)(9\  16\  11\  10)$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $[1;8, 16]$: $(1\  2\  3\  4\  5\  6\  7\  8)(9\  10\  11\  12\  13\  14\  15\  16)$ and $(1\  9\  18\  17\  15\  14\  13\  12\  11\  10\  8\  7\  6\  5\  4\  3)(2\  16)$


$n=20$ $[1;2,4]$: $(1\  2\  3\  4)(5\  6\  7\  8)(9\  10\  11\  12)(13\  14\  15\  16)$ and $(1\  5)(2\  4)(3\  11)(6\  9)(7\  19)(8\  20)(10\  13)(12\  14)(15\  17)(16\  18)$


$n=22$ $[1;2, 4]$: $(1\  2\  3\  4)(5\  6\  7\  8)(9\  10\  11\  12)(13\  14\  15\  16)$ and  $(1\  5)(2\  3)(4\  17)(6\  9)(7\  20)(8\  21)(10\  13)(14\  22)(15\  18)(16\  19)$


$n=28$ $[1;2, 6]$: $(1\  2\  3\  4\  5\  6)(7\  8\  9\  10\  11\  12)(13\  14\  15\  16\  17\  18)(19\  20\  21\  22\  23\  24)$ and $(1\  7)(2\  11)(3\  12)(4\  15)(5\  16)(6\  17)(8\  13)(9\  18)(10\  20)(14\  19)(21\  25)(22\  26)(23\  27)(24\  28)$

$n=38$ $[1;4, 32]$: $(1\  2\  3\  4\  5\  6\  7\  8\  9\  10\  11\  12\  13\  14\  15\  16\  17\  18\  19\  20\  21\  22\  23\  24\  25\  26\  27\  28\  29\  30\  31\  32)(33\  34)$ and $(1\  33\  38\  37)(8\  27\  10\  9)(11\  28\  13\  12)(14\  29\  16\  15)(17\  30\  19\  18)(20\  31\  22\  21)(23\  32\  25\  24)(26\  34\  36\  35)$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$[1;8, 32]$: $(1\  2\  3\  4\  5\  6\  7\  8\  9\  10\  11\  12\  13\  14\  15\  16\  17\  18\  19\  20\  21\  22\  23\  24\  25\  26\  27\  28\  29\  30\  31\  32)(33\  34)$ and $(1\  33\  38\  37\  36\  35\  30\  29)(8\  31\  14\  13\  12\  11\  10\  9)(15\  32\  21\  20\  19\  18\  17\  16)(22\  34\  28\  27\  26\  25\  24\  23)$


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$[1;16, 32]$: $(1\  2\  3\  4\  5\  6\  7\  8\  9\  10\  11\  12\  13\  14\  15\  16\  17\  18\  19\  20\  21\  22\  23\  24\  25\  26\  27\  28\  29\  30\  31\  32)(33\  34)$ and
$(1\  33\  38\  37\  36\  35\  32\  31\  30\  29\  28\  27\  26\  25\  24\  23)(8\  34\  22\  21\  20\  19\  18\  17\  16\  15\  14\  13\  12\  11\  10\  9)$




V. Special cases for $n=6$, $7$, and $8$ where we need to show two elements of order $2$ and one of order $3$, and vice versa which generate $A_n$. (An element of order $2$ and one of order $3$ alone do not generate the group.) Below we list just the elements of order $2$ and $3$ which generate the groups.

$n=6$ $[1;2,2,3]$:  $(1 \ 3)(2\ 4)$, $(1\ 4)(2\ 3)$, and  $(1 \ 2 \ 4)(3\ 5\ 6)$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $[1;2,3,3]$: $(1\ 3)(2\ 4)$, $(1\ 3\ 2)$, and $(1\ 2\  4)(3\ 5\ 6)$

$n=7$ $[1;2,2,3]$: $(1\ 2)(3\ 4)$, $(1\  7)(2\  3)$, and $(1\  6\  4)(3\  7\  5)$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $[1;2,3,3]$: $(1\  2)(3\  4)$, $(1\  2\  3)$, and $(1\  6\  4)(3\  7\  5)$

$n=8$ $[1;2, 2,3]$: $(1 \ 3)(2\  4)$, $(2 \ 3)(4\  5)$, and $(1\  7\  5)(4\  8\  6)$
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $[1;2, 3,3]$: $(1\  3)(2\  4)$, $(1\  3\  2)$, and $(1\  7\  5)(4\  8\  6)$



  





