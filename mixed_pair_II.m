/* Last updated 24 May 2025 */

/* currently requires an n string entered (see botttom) */
/* nohup magma n:="13" bertram. */



SetColumns(0);


for n in [5..40] do

prtfile:="TEST2_" cat IntegerToString(n);
logfile:="mixed_pairs_II_logs";


logflag:=true;

A:=Alt(n);
LAn:={ i : i in [1..n]};
C:=ConjugacyClasses(A);

Lcc := [[* c[1],c[3] *] : c in C | c[1] gt 1];
L_ord_set := {c[1] : c in C | c[1] gt 1};
L_ord := [c : c in L_ord_set ];
L_reps := [ [] : i in [1..#L_ord]];

/* find elements of each order of maximal support */
for i in [1..#Lcc] do
    cc :=  Lcc[i];
    indx := Index(L_ord, cc[1]);
    if cc[1] eq 2 then
       if (n mod 8) eq 4 then  /* special case for 2 */
           if #Support(cc[2]) eq n-4 then
             Append(~L_reps[indx],cc[2]);
          end if;
       elif #L_reps[indx] eq 0 then
          Append(~L_reps[indx], cc[2]);
       elif #Support(cc[2]) gt #Support(L_reps[indx,1]) then
          Prune(~L_reps[indx]);
          Append(~L_reps[indx], cc[2]);
       end if;
    elif cc[1] gt 2 and IsPrime(cc[1]) and n mod cc[1] eq 0 and n gt cc[1] then
       if #Support(cc[2]) eq n-cc[1] then
          Append(~L_reps[indx], cc[2]);
       end if;
       elif #L_reps[indx] eq 0 then
          Append(~L_reps[indx], cc[2]);
       elif #Support(cc[2]) gt #Support(L_reps[indx,1]) then
          Prune(~L_reps[indx]);
          Append(~L_reps[indx], cc[2]);
       end if;
end for;

/* testing the [1;k1,k2] case */
for i in [1..#L_reps-1] do
    for j in [i+1..#L_reps] do
	  ci:=[c : c in CycleDecomposition(L_reps[i,1]) | #c ne 1];
          cj:=[c : c in CycleDecomposition(L_reps[j,1]) | #c ne 1];
	 if #ci le #cj then
	    c1 := L_reps[i,1];
            c1_cycles := ci;
            c2_cycles := [#cj[k] : k in [1..#cj]];
         else
            c1 := L_reps[j,1];
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
	      c2[k] := [Supp[#Supp]];
              Prune(~Supp);
            end for;
         else
	   c2[1] :=[c1_cycles[1,1],c1_cycles[1,2]];
           SuppSet :=SuppSet diff {c1_cycles[1,1],c1_cycles[1,2]};
             Supp := [s : s in SuppSet];
	    for k in [#c1_cycles+1..#c2_cycles] do
		    /* print "K", k;  print "SUPP", Supp; */
	      c2[k] := [Supp[#Supp]];
              Prune(~Supp);
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



/* CHANGE NAME ABOVE??? */
c2:=A!x;

G:=sub<A | c1,c2>;
PrintFile(prtfile,"VALUES: " cat IntegerToString(Order(c1)) cat " and  "  cat IntegerToString(Order(c2)));
PrintFile(prtfile, c1);
PrintFile(prtfile, c2);
   if #G ne #A then
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
      if IsTransitive(G) then
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
