## Sample Example Makefile
This sample makefile about main program with static library is easy to make it.  


## File Structure 
<pre><code>$ tree -a 
├── MainTest.c
├── Makefile
├── README.md
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

<pre><code>$ make

---------------------------------
Check Library Mode
LIB_MODE=static
---------------------------------

---------------------------------
Building Sub direcories - Start
---------------------------------

sub1 sub2
make[1]: Entering directory `/home/jhlee/tstMakeLibGit/makefile_exmple_with_libs/sub1'
gcc -O2 -Wall -g -fPIC  -Iinclude -c sub1.c 
gcc -O2 -Wall -g -fPIC  -Iinclude -c sub2.c 
libsub1
ar  rv libsub1.a sub1.o sub2.o
ar: creating libsub1.a
a - sub1.o
a - sub2.o
ranlib libsub1.a
install libsub1.a ../libs
make[1]: Leaving directory `/home/jhlee/tstMakeLibGit/makefile_exmple_with_libs/sub1'
make[1]: Entering directory `/home/jhlee/tstMakeLibGit/makefile_exmple_with_libs/sub2'
gcc -O2 -Wall -g -fPIC  -Iinclude -c sub1.c 
gcc -O2 -Wall -g -fPIC  -Iinclude -c sub2.c 
libsub2
ar  rv libsub2.a sub1.o sub2.o
ar: creating libsub2.a
a - sub1.o
a - sub2.o
ranlib libsub2.a
install libsub2.a ../libs
make[1]: Leaving directory `/home/jhlee/tstMakeLibGit/makefile_exmple_with_libs/sub2'

---------------------------------
Finished Sub direcories - End
check LIB_FLAGS = -L. -L./libs -lsub1 -lsub2
---------------------------------


---------------------------------
Building Main diretory
tst1.o tst2.o
---------------------------------


gcc -O2 -Wall -g -Iinclude -c tst1.c 
gcc -O2 -Wall -g -Iinclude -c tst2.c 

---------------------------------
Building Main Test Program
---------------------------------
gcc -Iinclude -c MainTest.c
gcc -Iinclude -o MainTest MainTest.o  tst1.o tst2.o -L. -L./libs -lsub1 -lsub2
</code></pre>
