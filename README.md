## Sample Example Makefile
This sample makefile about main program with static library is easy to make it.  


## File Structure 
<pre><code>$ tree -a -A
├── MainTest.c
├── Makefile
├── Rule.make
├── include
│   ├── sub1.h
│   ├── sub2.h
│   └── test.h
├── sub1
│   ├── Makefile
│   ├── sub1.c
│   └── sub2.c
├── sub2
│   ├── Makefile
│   ├── sub1.c
│   └── sub2.c
├── subdir
├── tst1.c
└── tst2.c
</code></pre>


## Result 

<pre><code>
 $ make
---------------------------------
Building sub direcory
---------------------------------
sub1 sub2
make[1]: Entering directory `/home/jhlee/tstMakeLib/sub1'
gcc -O2 -Wall -g -Iinclude -c sub1.c 
gcc -O2 -Wall -g -Iinclude -c sub2.c 
libsub1
ar  rv libsub1.a sub1.o sub2.o
ar: creating libsub1.a
a - sub1.o
a - sub2.o
ranlib libsub1.a
install libsub1.a ../libs
make[1]: Leaving directory `/home/jhlee/tstMakeLib/sub1'
make[1]: Entering directory `/home/jhlee/tstMakeLib/sub2'
gcc -O2 -Wall -g -Iinclude -c sub1.c 
gcc -O2 -Wall -g -Iinclude -c sub2.c 
libsub2
ar  rv libsub2.a sub1.o sub2.o
ar: creating libsub2.a
a - sub1.o
a - sub2.o
ranlib libsub2.a
install libsub2.a ../libs
make[1]: Leaving directory `/home/jhlee/tstMakeLib/sub2'
---------------------------------
finished sub direcory
-L. -L./libs -lsub1 -lsub2
---------------------------------
gcc -O2 -Wall -g -Iinclude -c tst1.c 
gcc -O2 -Wall -g -Iinclude -c tst2.c 
---------------------------------
Building Main Test Program
---------------------------------
gcc -Iinclude -c MainTest.c
gcc -Iinclude -o MainTest MainTest.o  tst1.o tst2.o -L. -L./libs -lsub1 -lsub2
</code></pre>
