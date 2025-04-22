load "final_check.m";
A:=Alt(8);


x:=A!(1,2)(3,4)(5,6)(7,8); a:=A!(2,4,1,3,6,5,7); b:=A!(8,7,6,4,1,3,2); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3)(4,5,6); a:=A!(7,8,1,3,2,4,5); b:=A!(6,4,3,2,1,8,7); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4)(5,6,7,8); a:=A!(3,4,1,5,6); b:=A!(7,8,5,2,3); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7,8); a:=A!(1,2,3,6,7); b:=A!(8,6,4,5,1); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5); a:=A!(6,7,8,1,5,2,3); b:=A!(4,5,2,1,8,7,6); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6)(7,8); a:=A!(4,5,6,1,7); b:=A!(8,7,2,3,4); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7); a:=A!(8,1,2,3,4); b:=A!(5,6,7,1,8); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2)(3,4); a:=A!(2,1,5,6,7,8,3); b:=A!(4,3,8,7,6,5,2); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3); a:=A!(4,5,6,7,8,1,2); b:=A!(3,1,8,7,6,5,4); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2)(3,4); a:=A!(2,1,5,6,7,8,3); b:=A!(4,3,8,7,6,5,2); n:=8; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3); a:=A!(4,5,6,7,8,1,2); b:=A!(3,1,8,7,6,5,4); n:=8; compare_python_output(a,b,x,n,A);
