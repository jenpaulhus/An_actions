/* Last updated April 19, 2025 */

/* currently requires an n string entered (see botttom) */
/* nohup magma n:="13" bertram.m */


/* added a caveat for order 2, 5, 13 */


SetColumns(0);

/*  Magma code to make list of lists */
create_list:=function(x);
full_list:=[];
cd:=CycleDecomposition(x);
/* if Order(x) eq 5 then
   Prune(~cd); 
   end if; */
for cyc in cd do
    if #cyc  gt 1 then
    Ltemp:=[];
    for j in cyc do
        Append(~Ltemp,j);
    end for;
    Append(~full_list, Ltemp);
	end if;
end for;
return full_list;
end function;


/* Can find Support(a) --look for max support */


create_py_command:=function(cyc,LAn,n)
  L:=create_list(cyc);
  NonSupp := LAn diff Support(cyc);
  AddSupp:= [m : m in NonSupp];
  stg := "find_bertram_cycles([";
  for ell in [1..#L] do
     stg := stg cat "[";
     for i in [1..#L[ell]] do
	   stg := stg cat IntegerToString(L[ell,i]);
           if i ne #L[ell] then
	   stg := stg cat ",";
	   end if;
     end for;
     stg := stg cat "]";
     if ell ne #L then
       stg:= stg cat ",";
     end if;
  end for;
  stg := stg cat "], " cat IntegerToString(n);
  if #AddSupp gt 0 then
     stg := stg cat ", added_support = [";
     for en in [1..#AddSupp] do
           stg :=stg cat IntegerToString(AddSupp[en]);
           if en ne #AddSupp then
               stg := stg cat ",";
        end if;
      end for;
      stg:= stg cat "]";
   end if;
   stg :=stg cat ")";
   PrintFile("toPython_" cat IntegerToString(n) cat ".py",stg);
return stg;

end function;






test_an_1k:=procedure(n);
A:=Alt(n);
LAn:={ i : i in [1..n]};
C:=ConjugacyClasses(A);

Lcc := [[* c[1],c[3] *] : c in C | c[1] gt 1];
L_ord_set := {c[1] : c in C | c[1] gt 1};
L_ord := [c : c in L_ord_set ];
L_reps := [ [] : i in [1..#L_ord]];

for i in [1..#Lcc] do
    cc :=  Lcc[i];
    indx := Index(L_ord, cc[1]);
    if cc[1] eq 2 then
       if (n mod 8) eq 4 then  /* special case for 2 */
		      /* print "HERE 2", cc[1],cc[2]; */
          if #Support(cc[2]) eq n-4 then
             Append(~L_reps[indx],cc[2]);
          end if;
       elif #L_reps[indx] eq 0 then
          Append(~L_reps[indx], cc[2]);
/* print "HERE 3", cc[1],cc[2]; */
       elif #Support(cc[2]) gt #Support(L_reps[indx,1]) then
       /*           print "HERE 4", cc[1],cc[2]; */
          Prune(~L_reps[indx]);
          Append(~L_reps[indx], cc[2]);
    end if;
    else
      /*        print "HERE 1", cc[1],cc[2]; */
       if IsPrime(cc[1]) and n mod cc[1] eq 0 then 
          if cc[1] eq n and #L_reps[indx] eq 0 then
            Append(~L_reps[indx],cc[2]);
          elif #Support(cc[2]) eq n-cc[1] and #L_reps[indx] eq 0 then
             Append(~L_reps[indx], cc[2]);
          end if;
       elif #L_reps[indx] eq 0 then
          Append(~L_reps[indx], cc[2]);
/*           print "HERE 3", cc[1],cc[2]; */
       elif #Support(cc[2]) gt #Support(L_reps[indx,1]) then
       /*           print "HERE 4", cc[1],cc[2]; */
          Prune(~L_reps[indx]);
          Append(~L_reps[indx], cc[2]);
       end if;
   end if;
end for;


/* Check to see that we have a representative for each order */
if #L_reps lt #L_ord then
     PrintFile("bertram_errors_" cat n, "Something wrong for n=" cat n cat " as there is not a representative for each order.");
end if;


/* testing the [1;k] case */
for i in [1..#L_reps] do
    create_py_command(L_reps[i,1], LAn,n);
end for;

/* testing the [1;k1,k2] cases */

end procedure;


en:=StringToInteger(n);
test_an_1k(en);



exit;
