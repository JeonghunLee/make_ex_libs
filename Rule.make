## GCC and OTHER OPTION Setting

CC = gcc

AR = ar

RANLIB = ranlib

CFLAGS = -O2 -Wall -g

## Exec Program Directory 

DESTDIR = work

## Source Directory 

SUB_DIRS = sub1 sub2


## Library and Include Setting 

INC_DIR    = -Iinclude

LIB_DIR    = libs

LIB_FLAGS  = -L. -L./$(LIB_DIR) -lsub1 -lsub2


.c.o: 
	$(CC) $(CFLAGS) $(INC_DIR) -c $< 

