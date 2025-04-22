load "final_check.m";
A:=Alt(6);


x:=A!(1,2)(3,4); a:=A!(2,1,5,6,3); b:=A!(4,3,6,5,2); n:=6; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3); a:=A!(4,5,6,1,2); b:=A!(3,1,6,5,4); n:=6; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4)(5,6); a:=A!(3,2,4,1,5); b:=A!(6,5,2,4,3); n:=6; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5); a:=A!(6,1,5,2,3); b:=A!(4,5,2,1,6); n:=6; compare_python_output(a,b,x,n,A);
