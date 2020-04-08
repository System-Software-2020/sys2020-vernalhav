TARGET=main001.c
LIBS=libfoo.a

CPP_OUT=main001_p.c
CC_OUT=main001.S
ASM_OUT=main001.o
LD_OUT=bin


CPPFLAGS=
CFLAGS=-S
ASM_FLAGS=-march=x86-64
LDFLAGS=-s -L. -r


$(CPP_OUT): $(TARGET)
	cpp $(CPPFLAGS) $(TARGET) -o $(CPP_OUT)


$(CC_OUT): $(CPP_OUT)
	gcc $(CFLAGS) $(CPP_OUT) -o $(CC_OUT)


$(ASM_OUT): $(CC_OUT)
	gcc $(ASM_FLAGS) $(CC_OUT) -c -o $(ASM_OUT)


$(LD_OUT): $(ASM_OUT) $(LIBS)
	ld $(LDFLAGS) $(ASM_OUT) $(LIBS) -o $(LD_OUT)


.PHONY: all clean preprocess compile assemble link

all:  $(LD_OUT)


clean:
	rm -f $(CPP_OUT) $(CC_OUT) $(LD_OUT) $(ASM_OUT)


preprocess: $(CPP_OUT)

compile: $(CC_OUT)

assemble: $(ASM_OUT)

link: $(LD_OUT)
