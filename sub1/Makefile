include ../Rule.make

OBJS = sub1.o sub2.o
LIBS = libsub1

## for Shared Library 
SHARED = libsub1.so
CFLAGS += $(SHAREDFLAGS)

all: static 

static:	$(OBJS) $(LIBS)

shared: $(OBJS) $(SHARED)

$(LIBS):
	@echo $@
	$(AR)  rv $@.a $(OBJS)
	$(RANLIB) $@.a
	install $@.a ../$(LIB_DIR)

$(SHARED):
	@echo $@	
	$(CC) -shared -Wl,-soname,$@ -o $@ $(OBJS)
	install $@ ../$(LIB_DIR)

clean:
	@rm -rf *.o
	@rm -rf *.a
	@rm -rf *.so

