## GCC and OTHER OPTION Setting

CC = gcc

AR = ar

RANLIB = ranlib

CFLAGS = -O2 -Wall -g

## -fPIC 
SHAREDFLAGS = -fPIC 

## Exec Program Directory 

DESTDIR = work


## Sub Directories

SUB_DIRS = sub1 sub2


## Static and Shared library Setting 

#LIB_MODE  = static 
LIB_MODE  = shared

ifeq ($(LIB_MODE),shared)
LIB_NANME  = shared
SHAREDFLAGS = -fPIC 
else
LIB_NANME  = static
endif 

## Library and Include Setting 

INC_DIR    = -Iinclude

LIB_DIR    = libs

LIB_FLAGS  = -L. -L./$(LIB_DIR) -lsub1 -lsub2


.c.o: 
	$(CC) $(CFLAGS) $(INC_DIR) -c $< 

