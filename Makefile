include Rule.make

TARGET = MainTest 

OBJS = tst1.o tst2.o
#OBJS = tst1.c tst2.c
	
all: $(TARGET)

$(TARGET): subdirs $(OBJS) 
	@echo ---------------------------------
	@echo     Building Main Test Program
	@echo ---------------------------------
	$(CC) $(INC_DIR) -c MainTest.c
	$(CC) $(INC_DIR) -o $@ MainTest.o  $(OBJS) $(LIB_FLAGS)

setup: 
	@echo ---------------------------------
	@echo     find sub directory 
	@echo ---------------------------------
	@ls -d */ > subdir 
	
subdirs:
	@echo ---------------------------------
	@echo     Building sub direcory 
	@echo ---------------------------------
	@echo $(SUB_DIRS)
	@mkdir -p $(LIB_DIR) 
	@for dir in $(SUB_DIRS); \
	do \
		$(MAKE) -C $$dir all; \
		if [ $$? != 0 ]; then exit 1; fi; \
	done
	@echo ---------------------------------
	@echo     finished sub direcory 
	
	@echo     $(LIB_FLAGS)
	@echo ---------------------------------

install:
	install -d $(DESTDIR)
	@if [ ! -d $(DESTDIR) ] ; then \
                echo "the work directory doesn't exist."; \
                exit 1; \
        fi
	@if [  -e $(TARGET) ] ; then \
		install ./$(TARGET) $(DESTDIR); \
                echo "MainTest program is installed."; \
        fi

clean:
	@rm -rf *.o
	@if [  -d $(DESTDIR) ] ; then \
		rm -rf $(DESTDIR); \
		echo "delete install directory"; \
	fi
	@echo --------- step-1 delete *.o           ---------
	@for dir in $(SUB_DIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	@echo --------- step-2 sub call, make clean ---------
	@if [  -d $(LIB_DIR) ] ; then \
		rm -rf $(LIB_DIR); \
		echo removed $(LIB_DIR); \
	fi 
	@if [  -e $(TARGET) ] ; then \
		rm $(TARGET); \
	fi
	@echo --------- step-3 finished  ---------

