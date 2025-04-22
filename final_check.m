/* Last edited:  19 Apr 2025 */


/* Checks output from bertram.py */



/* Converts permutation element to string */
str_perm:=function(a);
cd:=CycleDecomposition(a);
str_a := "";
for i in [1..#cd] do
   if #cd[i] gt 1 then
      str_a:=str_a cat "(";
      for j in [1..#cd[i]] do
	 str_a := str_a cat IntegerToString(cd[i,j]);
         if j ne #cd[i] then
	   str_a := str_a cat ", ";
         end if;
      end for;
     str_a := str_a cat ")";
   end if;
end for;
return str_a;
end function;


prt_info:=procedure(flname, x, a, b)
   PrintFile(flname, "*************");
   PrintFile(flname, "x (elt of order " cat IntegerToString(Order(x)) cat ") is: " cat str_perm(x));
   PrintFile(flname, "a: " cat str_perm(a));
   PrintFile(flname, "b: " cat str_perm(b));
end procedure;

compare_python_output:=procedure(a,b,x,n,A)
   log_name := "bertram_log_" cat IntegerToString(n) cat ".m";
   error_name := "bertram_errors_" cat IntegerToString(n);
   prt_info(log_name,x,a,b);
   if not a*b eq x then
      PrintFile(log_name,"Something is wrong with Bertram code.");
      PrintFile(error_name, "n is: " cat IntegerToString(n));
      prt_info(error_name,x,a,b);
   end if;
   if not #sub<A|a,b> eq #A then
      PrintFile(log_name,"a and b do not generate all of An");
      PrintFile(error_name, "n is: " cat IntegerToString(n));
      prt_info(error_name,x,a,b);
   end if;
   if (IsOdd(n) and Order(a) eq n) or (IsEven(n) and Order(a) eq n-1) then
      if not IsConjugate(A,a,b) then
         PrintFile(log_name,"a and b are not conjugate in An (order n-1)");
         PrintFile(error_name, "n is: " cat IntegerToString(n));
         prt_info(error_name,x,a,b);
      end if;
   end if;
end procedure;

