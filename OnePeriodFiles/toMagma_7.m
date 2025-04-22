load "final_check.m";
A:=Alt(7);


x:=A!(1,2)(3,4); a:=A!(2,4,1,5,6,7,3); b:=A!(4,1,3,7,6,5,2); n:=7; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3)(4,5,6); a:=A!(7,1,2,4,5); b:=A!(6,4,3,1,7); n:=7; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4)(5,6); a:=A!(3,4,1,7,5); b:=A!(6,5,7,2,3); n:=7; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5); a:=A!(6,7,1,2,3); b:=A!(4,5,1,7,6); n:=7; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3)(4,5)(6,7); a:=A!(1,2,5,4,6); b:=A!(7,6,5,3,1); n:=7; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7); a:=A!(1,7,2,3,4); b:=A!(5,6,7,2,1); n:=7; compare_python_output(a,b,x,n,A);
