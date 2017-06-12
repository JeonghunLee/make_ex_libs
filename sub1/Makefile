include ../Rule.make

OBJS = sub1.o sub2.o
LIBS = libsub1

all: $(OBJS) $(LIBS) 

$(LIBS):
	@echo $@
	$(AR)  rv $@.a $(OBJS)
	$(RANLIB) $@.a
	install $@.a ../$(LIB_DIR)

clean:
	@rm -rf *.o
	@rm -rf *.a



