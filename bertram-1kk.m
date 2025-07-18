/* Last updated 6 June 2025 */


/* Code to check pairs [1;k,k] */

/* Testing a,a by constructing c=(1....n) or (1...n-1) */
/* cut back a if ord(c)=n */


SetColumns(0);

logfile:="bertram_pairs_log";
errfile:="bertram_pairs_errors";


for n in [5..40] do


logflag:=true;

A:=Alt(n);
LAn:={ i : i in [1..n]};
C:=ConjugacyClasses(A);


/* Find elements of maximum support of a given order */
Lcc := [[* c[1],c[3] *] : c in C | c[1] gt 1];
L_ord_set := {c[1] : c in C | c[1] gt 1};
L_ord := [c : c in L_ord_set ];
L_reps := [ [] : i in [1..#L_ord]];

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

/* testing the [1;k,k] case */
/* idea is that a, a^-1, c, c^-1 is identity */


for i in [1..#L_reps] do
      c:=L_reps[i,1];
   if IsEven(Order(c)) then   /* Don't need to worry about odd k */
      if IsEven(n) then  /* create (1, ..., n-1) */
         if n notin [6,8,12] then
            a_seq:=[i : i in [3..n]]; 
            Reverse(~a_seq);
            Append(~a_seq,1);
            Reverse(~a_seq);
            Append(~a_seq,2);
            a:=A!a_seq;
         else
            a_seq:=[i : i in [3..n-2]]; 
            Reverse(~a_seq);
            Append(~a_seq,1);
            Reverse(~a_seq);
            Append(~a_seq,2);
            Append(~a_seq,n-1);
            Append(~a_seq,n);
            a:=A!a_seq;
         end if;

      else
	  if (Order(c) eq n) then         /* create (1, ....,n) unless k =n */
             a_seq:=[i : i in [2..n-2]];
             Append(~a_seq,1);
             Append(~a_seq,n-1);
             Append(~a_seq,n);
             a:=A!a_seq;
          else
             a_seq:=[i : i in [2..n]];
             Append(~a_seq,1);
             a:=A!a_seq;
          end if;
      end if;
      if logflag then
         PrintFile(logfile,"******************");
         PrintFile(logfile,"n= " cat IntegerToString(n));
         PrintFile(logfile,"******************");
         PrintFile(errfile,"******************");
         PrintFile(errfile,"n= " cat IntegerToString(n));
         PrintFile(errfile,"******************");
         logflag:=false;
      end if;

      G:=sub<A|a,c>;

      if #G eq #A then
	strg:="Generates ";
      else
	strg:="DOESN'T Generate";
        PrintFile(errfile,"Orders: " cat IntegerToString(Order(c)));
        PrintFile(errfile,"Elements:");
        PrintFile(errfile, a);
        PrintFile(errfile, c);
      end if;

      PrintFile(logfile,"Orders: " cat IntegerToString(Order(c)));
      PrintFile(logfile,"Elements:");
      PrintFile(logfile, a);
      PrintFile(logfile, c);
      PrintFile(logfile,"This example " cat strg);
      PrintFile(logfile,"-----------------");

   end if; /* k even only */

end for;
end for;
