load "final_check.m";
A:=Alt(9);


x:=A!(1,2,3,4)(5,6,7)(8,9); a:=A!(5,7,6,3,4,1,8); b:=A!(9,8,2,3,7,6,5); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2)(3,4)(5,6)(7,8); a:=A!(2,1,9,3,6,5,7); b:=A!(8,7,6,4,3,9,2); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3)(4,5,6); a:=A!(7,8,9,1,2,4,5); b:=A!(6,4,3,1,9,8,7); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4)(5,6,7,8); a:=A!(3,2,4,1,9,5,6); b:=A!(7,8,5,9,2,4,3); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7,8); a:=A!(9,1,5,2,3,6,7); b:=A!(8,6,4,5,2,1,9); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5); a:=A!(6,7,8,9,1,2,3); b:=A!(4,5,1,9,8,7,6); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6)(7,8); a:=A!(4,3,5,6,1,9,7); b:=A!(8,7,9,2,3,5,4); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7); a:=A!(8,9,1,7,2,3,4); b:=A!(5,6,7,2,1,9,8); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9); a:=A!(1,2,3,4,5); b:=A!(6,7,8,9,1); n:=9; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7)(8,9); a:=A!(1,5,2,3,7,6,8); b:=A!(9,8,7,4,5,2,1); n:=9; compare_python_output(a,b,x,n,A);
