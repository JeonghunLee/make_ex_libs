include Rule.make

TARGET = MainTest

OBJS = tst1.o tst2.o
#OBJS = tst1.c tst2.c
	
all: $(TARGET)

$(TARGET): subdirs $(OBJS) 
	@echo 
	@echo ---------------------------------
	@echo     Building Main Test Program
	@echo ---------------------------------
	$(CC) $(INC_DIR) -c MainTest.c
	$(CC) $(INC_DIR) -o $@ MainTest.o  $(OBJS) $(LIB_FLAGS)
ifeq ($(LIB_MODE),shared)	
	@echo 
	@echo ---------------------------------
	@echo     Setting Shared Library
	@echo ---------------------------------
	export LD_LIBRARY_PATH=./libs
	@echo "LD_LIBRARY_PATH $(LD_LIBRARY_PATH)"
endif
	

setup: 
	@echo ---------------------------------
	@echo     Find sub directory 
	@echo ---------------------------------
	@ls -d */ > subdir 
	@echo 
	
subdirs:
	@echo 
	@echo ---------------------------------
	@echo     Check Library Mode
	@echo     LIB_MODE=$(LIB_MODE)
	@echo ---------------------------------
	@echo 
	@echo ---------------------------------
	@echo     Building Sub direcories - Start 
	@echo ---------------------------------
	@echo 
	@echo $(SUB_DIRS)
	@mkdir -p $(LIB_DIR) 
	@for dir in $(SUB_DIRS); \
	do \
		$(MAKE) -C $$dir $(LIB_NANME); \
		if [ $$? != 0 ]; then exit 1; fi; \
	done
	@echo 
	@echo ---------------------------------
	@echo     Finished Sub direcories - End
	@echo     check  LIB_FLAGS = $(LIB_FLAGS)
	@echo ---------------------------------
	@echo 
	@echo 
	@echo ---------------------------------
	@echo     Building Main diretory 
	@echo           $(OBJS)
	@echo ---------------------------------
	@echo 
	@echo 

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
	@echo 
	@echo ---------------------------------
	@echo     Removing Main diretory 
	@echo           $(OBJS)
	@echo ---------------------------------
	@rm -rf *.o
	@echo 
	@echo ---------------------------------
	@echo     Remove $(DESTDIR)
	@echo ---------------------------------
	@echo 
	@if [  -d $(DESTDIR) ] ; then \
		rm -rf $(DESTDIR); \
		echo "delete install directory"; \
	fi
	@echo 
	@echo ---------------------------------
	@echo     Removing Sub direcories 
	@echo           make clean
	@echo ---------------------------------
	@echo 
	@for dir in $(SUB_DIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	@echo 
	@echo ---------------------------------
	@echo     Removing \"$(LIB_DIR)\" 
	@echo ---------------------------------
	@echo 
	@if [  -d $(LIB_DIR) ] ; then \
		rm -rf $(LIB_DIR); \
		echo removed $(LIB_DIR); \
	fi 
	@echo 
	@echo ---------------------------------
	@echo     Removing  \"$(TARGET)\"
	@echo ---------------------------------
	@echo 
	@if [  -e $(TARGET) ] ; then \
		rm $(TARGET); \
	fi

