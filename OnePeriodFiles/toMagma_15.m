load "final_check.m";
A:=Alt(15);


x:=A!(1,2)(3,4)(5,6)(7,8)(9,10)(11,12); a:=A!(2,4,1,13,14,15,3,6,5,7,10,9,11); b:=A!(12,11,10,8,7,6,4,1,3,15,14,13,2); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9)(10,11,12,13,14); a:=A!(15,1,2,3,4,5,10,11,12); b:=A!(13,14,10,6,7,8,9,1,15); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3)(4,5,6)(7,8,9)(10,11,12); a:=A!(13,14,15,1,2,4,5,7,8,10,11); b:=A!(12,10,9,7,6,4,3,1,15,14,13); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4)(5,6)(7,8)(9,10)(11,12)(13,14); a:=A!(3,4,1,15,5,8,7,9,12,11,13); b:=A!(14,13,12,10,9,8,6,5,15,2,3); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7,8,9,10); a:=A!(11,12,13,14,15,1,2,3,6,7,8); b:=A!(9,10,6,4,5,1,15,14,13,12,11); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3)(4,5)(6,7)(8,9)(10,11)(12,13)(14,15); a:=A!(1,2,5,4,6,9,8,10,13,12,14); b:=A!(15,14,13,11,10,9,7,6,5,3,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9,10,11,12,13,14); a:=A!(15,1,2,3,4,8,9,10,11); b:=A!(12,13,14,8,5,6,7,1,15); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8)(9,10)(11,12)(13,14); a:=A!(5,4,6,7,8,1,15,9,12,11,13); b:=A!(14,13,12,10,9,15,2,3,4,6,5); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9)(10,11,12)(13,14,15); a:=A!(1,2,3,4,5,10,11,13,14); b:=A!(15,13,12,10,6,7,8,9,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7,8,9,10)(11,12)(13,14); a:=A!(1,5,2,3,6,7,8,12,11,15,13); b:=A!(14,13,15,12,9,10,6,4,5,2,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9,10,11); a:=A!(12,13,14,15,1,11,2,3,4,5,6); b:=A!(7,8,9,10,11,2,1,15,14,13,12); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4)(5,6,7)(8,9,10)(11,12,13)(14,15); a:=A!(5,7,6,8,9,11,12,3,4,1,14); b:=A!(15,14,2,3,13,11,10,8,7,6,5); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9,10,11,12,13); a:=A!(14,15,1,2,3,4,5,6,7); b:=A!(8,9,10,11,12,13,1,15,14); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9)(10,11)(12,13)(14,15); a:=A!(1,7,2,3,4,9,8,10,13,12,14); b:=A!(15,14,13,11,10,9,5,6,7,2,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15); a:=A!(1,15,2,3,4,5,6,7,8); b:=A!(9,10,11,12,13,14,15,2,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6)(7,8,9,10,11)(12,13,14,15); a:=A!(7,8,9,4,5,6,1,12,13); b:=A!(14,15,12,2,3,4,10,11,7); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9)(10,11)(12,13); a:=A!(1,9,2,3,4,5,11,10,14,15,12); b:=A!(13,12,15,14,11,6,7,8,9,2,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9,10,11,12)(13,14,15); a:=A!(1,2,3,4,8,9,10,13,14); b:=A!(15,13,11,12,8,5,6,7,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7,8,9)(10,11)(12,13)(14,15); a:=A!(1,5,2,3,8,9,6,10,13,12,14); b:=A!(15,14,13,11,10,7,8,4,5,2,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9,10)(11,12,13); a:=A!(14,15,1,7,2,3,4,8,9,11,12); b:=A!(13,11,10,8,5,6,7,2,1,15,14); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9,10,11)(12,13)(14,15); a:=A!(1,2,3,4,5,6,13,12,14); b:=A!(15,14,13,7,8,9,10,11,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8)(9,10,11,12)(13,14,15); a:=A!(13,14,5,6,7,8,1,9,10); b:=A!(11,12,9,2,3,4,5,15,13); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9,10,11)(12,13,14,15); a:=A!(1,2,3,4,10,11,8,12,13); b:=A!(14,15,12,9,10,5,6,7,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5)(6,7,8)(9,10,11)(12,13)(14,15); a:=A!(1,5,2,3,6,7,9,10,13,12,14); b:=A!(15,14,13,11,9,8,6,4,5,2,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9,10,11)(12,13,14); a:=A!(15,1,2,3,4,5,6,12,13); b:=A!(14,12,7,8,9,10,11,1,15); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9,10,11,12); a:=A!(13,14,15,1,7,2,3,4,8,9,10); b:=A!(11,12,8,5,6,7,2,1,15,14,13); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8,9)(10,11,12,13)(14,15); a:=A!(1,2,3,4,5,12,13,10,14); b:=A!(15,14,11,12,6,7,8,9,1); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7,8)(9,10,11,12,13)(14,15); a:=A!(9,10,11,5,6,7,8,1,14); b:=A!(15,14,2,3,4,5,12,13,9); n:=15; compare_python_output(a,b,x,n,A);
x:=A!(1,2,3,4,5,6,7)(8,9,10,11,12,13)(14,15); a:=A!(1,2,3,4,11,12,13,8,14); b:=A!(15,14,9,10,11,5,6,7,1); n:=15; compare_python_output(a,b,x,n,A);
