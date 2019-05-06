#!/usr/bin/make -f

#
# Filename:		Makefile
# Date:			5/5/2019
# Author:		Ben Rust
# Email:		bjr170630@utdallas.edu
# Version:		1.0
# Copyright:		2019, All Rights Reserved
#
# Description:
#
#	A moderately complex makefile that takes care of 
#	creating dependencies for HW 6, a project with github and binary IO.


# Set up needed values to support make's implicit commands
# for compiling C++ source files.

# The compiler to use
CXX = g++

# C pre-processor flags
CPPFLAGS = -I/scratch/perkins/include  

# compiler flags
CXXFLAGS = -Werror -Wno-write-strings

# linker flags
LDFLAGS = -L/scratch/perkins/lib

#Library Flags
LDLIBS = -lcdk -lcurses

# Project name.  This is used in building the file name for the backup target
PROJECTNAME = HW6Backup


# Enter the names of the C++ source files that you want to compile
# with this project

SRCS = myProj6.cc 

# Enter the name for the executable to be created
EXEC = myProj6


#
# You normally don't need to change anything below here.
# ======================================================
#
OBJS = $(SRCS:cc=o)

.PHONY: all clean

all: $(EXEC)
#	cp /scratch/perkins/cs3377.bin cs3377.bin

clean:
	rm -f $(OBJS) *.d *~ $(EXEC)
#	rm cs3377.bin

# Pattern for .d files.
%.d:%.cc
	@echo Updating .d Dependency File
	@set -e; rm -f $@; \
	$(CXX) -MM $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$


#  This is a rule to link the files.  Pretty standard
$(EXEC): $(OBJS)
	$(CXX) -o $(EXEC) $(OBJS) $(LDFLAGS) $(LDLIBS)

Makefile: $(SRCS:.cc=.d)


# Backup Target
backup:	clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename `pwd`))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME)
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!


# Include the dependency files created by the PreProcessor.  The
# dash in front of the command keeps the system from complaining
# if the files do not exist.

-include $(SRCS:.cc=.d)

