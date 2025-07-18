/* Last updated 28 December 2024 */

/* Finding pairs (k_1,k_2) so that they generate An  */
 


SetColumns(0);

logfile:="mixed_pairs_I_logs";


/* Create element from Lemma 3.2 */
CreateElt:=function(k,n);
   fac:=Factorization(k);
   L_elts:=[i : i in [1..n]];
   count:=1;
   elt:=[];
   for i:=#fac to 1 by -1 do
      prime_power:=fac[i,1]^fac[i,2];
      for j in [count+1..count+prime_power-1] do
	 Append(~elt,L_elts[j]);
      end for;
      Append(~elt,L_elts[count]);
      count:=count+prime_power;
   end for;

   if fac[1,1] eq 2 then
      Append(~elt,L_elts[count +1]);
      Append(~elt, L_elts[count]);
      count+:=2;
   end if;

   flag2:=false;
   leftover:=n-count+1;
   if leftover eq 0 then
      return elt;
   elif leftover eq 1 then
      Append(~elt,L_elts[count]);
      return elt;
   else
      for i:=#fac to 1 by -1 do
	 if i eq 1 and fac[1,1] eq 2 then
           flag2:=true;
           break i;
         end if;
	 for j:=fac[i,2] to 1 by -1 do
	    prime_power:=fac[i,1]^j;
            while leftover ge prime_power do
               for k in [count+1..count+prime_power-1] do
		       /* testing -1 on last part */
	          Append(~elt,L_elts[k]);
               end for;
               Append(~elt,L_elts[count]);
               count:=count+prime_power;
               leftover:=n-count+1;
            end while;
         end for;
      end for;

      if flag2 then
         for j:=fac[1,2] to 1 by -1 do
	    prime_power:=fac[1,1]^j;
            while leftover ge 2*prime_power do
	       for twotest in [1..2] do
                  for k in [count+1..count+prime_power-1] do
		       /* testing -1 on last part */
	             Append(~elt,L_elts[k]);
                  end for;
                  Append(~elt,L_elts[count]);
                  count:=count+prime_power;
               end for;
               leftover:=n-count+1;
            end while;
         end for;
      end if;

      for l in [count..n] do
         Append(~elt,L_elts[count]);
         count+:=1;
      end for;
   end if;
   return elt;  /* should be in Lemma 3.2 */
end function;




/* create beta element from Theorem 3.3 */

CreateBeta:=function(a1,a2,n)

   A:=Alt(n);
   LAn:={ i : i in [1..n]};
  /* Determine which is alpha and which is beta */
   ci:=[c : c in CycleDecomposition(a1) | #c ne 1];
   cj:=[c : c in CycleDecomposition(a2) | #c ne 1];
   if #ci le #cj then
       c1 := a1;
       c1_cycles := ci;
       c2_cycles := [#cj[k] : k in [1..#cj]];
   else
       c1 := a2;
       c1_cycles := cj;
       c2_cycles := [#ci[k] : k in [1..#ci]];
   end if;

   c2 :=[];
   NonSuppSet := LAn diff Support(c1);
   SuppSet := Support(c1);

   if #c1_cycles gt 1 then
     c2[1] :=[c1_cycles[1,1],c1_cycles[2,1]];
     SuppSet :=SuppSet diff {c1_cycles[1,1],c1_cycles[2,1]};
     for k in [2..#c1_cycles-1] do
	c2[k] :=[c1_cycles[k,2],c1_cycles[k+1,1]];
        SuppSet :=SuppSet diff {c1_cycles[k,2],c1_cycles[k+1,1]};
     end for;
     Supp := [s : s in SuppSet];
      for k in [#c1_cycles..#c2_cycles] do
	  if #Supp gt 0 then
	     c2[k] := [Supp[#Supp]];
             Prune(~Supp);  
	  else
	    c2[k] :=[];
          end if;
      end for;
   else
      c2[1] :=[c1_cycles[1,1],c1_cycles[1,2]];
      SuppSet :=SuppSet diff {c1_cycles[1,1],c1_cycles[1,2]};
      Supp := [s : s in SuppSet];
      for k in [#c1_cycles+1..#c2_cycles] do
	  if #Supp gt 0 then
	     c2[k] := [Supp[#Supp]];
             Prune(~Supp);  
	  else
	    c2[k] :=[];
end if;
      end for;
   end if;

   if #NonSuppSet gt 0 then
      nonsuppFlag:=true;
      NonSupp := [s : s in NonSuppSet];
   else
      nonsuppFlag:=false;
   end if;
   for k in [1..#c2_cycles] do
      while #c2[k]  lt  c2_cycles[k] do
         if nonsuppFlag then
   	    Append(~c2[k],NonSupp[#NonSupp]);
            Prune(~NonSupp);
            if #NonSupp eq 0 then
	       nonsuppFlag :=false;
            end if;
         else
	    Append(~c2[k],Supp[#Supp]);
            Prune(~Supp);
         end if;
      end while;
   end for;

   x:=[i : i in [1..n]];
   for c in c2 do
      for d in [1..#c-1] do
         x[c[d]]:=c[d+1];
      end for;
      x[c[#c]]:=c[1];
   end for;

   return c1, A!x;

end function;



for n in [5..40] do
logflag:=true;
prtfile:="TEST4_" cat IntegerToString(n);
A:=Alt(n);
C:=ConjugacyClasses(A);
L_ord_set := {c[1] : c in C | c[1] gt 1};
L_ords := [l : l in L_ord_set];

for i in [1..#L_ords-1] do
   for j in [i+1..#L_ords] do
      a1:=A!CreateElt(L_ords[i],n);
      a2:=A!CreateElt(L_ords[j],n);
      c1,c2:=CreateBeta(a1,a2,n);


   PrintFile(prtfile,"VALUES: " cat IntegerToString(Order(c1)) cat " and  "  cat IntegerToString(Order(c2)));
   PrintFile(prtfile, c1);  
   PrintFile(prtfile, c2);
   if #sub<A|c1,c2> ne #A then
      if logflag then
         PrintFile(logfile,"******************");
         PrintFile(logfile,"n= " cat IntegerToString(n));
         PrintFile(logfile,"******************");
         logflag:=false;
      end if;
      PrintFile(logfile,"Orders: " cat IntegerToString(Order(c1)) cat " and  "  cat IntegerToString(Order(c2)));
      PrintFile(logfile,"Elements:");
      PrintFile(logfile, c1);
      PrintFile(logfile, c2);
      if IsTransitive(sub<A|c1,c2>) then
	strg:="Is Transitive ";
        else
	strg:="Not Transitive"; 
   end if;
PrintFile(logfile,"This example " cat strg cat " and size of support:" cat IntegerToString(#Support(c1*c2)));
PrintFile(logfile,"-----------------");
end if;


end for;
end for;

end for;


