EXENAME := main
SRCDIR := src
OBJDIR := obj
INCLUDEDIR := include
COMPILEFLAGS := -Wall -I./include
LINKERFLAGS := -lncurses

CHILDDIRS := $(patsubst ./$(SRCDIR)/%,%,$(shell find ./$(SRCDIR) -mindepth 1 -type d))
#             convert cpp path to obj path                 find all cpp files
OBJFILES := $(patsubst ./$(SRCDIR)/%.cpp,./$(OBJDIR)/%.o,$(shell find . -name *.cpp))
.PHONY: clean include $(CHILDDIRS)

# Entry point
$(EXENAME): $(CHILDDIRS) include $(OBJFILES)
	g++ $(OBJFILES) -o $(EXENAME) $(LINKERFLAGS)

# Copy directory structure over to obj directory
$(CHILDDIRS):
	mkdir -p $(OBJDIR)/$@

./$(OBJDIR)/%.o: ./$(SRCDIR)/%.cpp
	g++ $(COMPILEFLAGS) -c -o $@ $<

clean:
	rm $(OBJDIR)/* $(EXENAME) -rf

# Copy src directory structure to include folder
include:
	for DIR in $(CHILDDIRS); do mkdir -p $(INCLUDEDIR)/$$DIR; done
