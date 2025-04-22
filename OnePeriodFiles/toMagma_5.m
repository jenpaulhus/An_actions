load "final_check.m";
A:=Alt(5);


x:=A!(1,2)(3,4); a:=A!(2,4,1,5,3); b:=A!(4,1,3,5,2); n:=5; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3); a:=A!(4,5,1,3,2); b:=A!(3,2,1,5,4); n:=5; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5); a:=A!(1,2,3); b:=A!(4,5,1); n:=5; compare_python_output(a,b,x,n,A);
