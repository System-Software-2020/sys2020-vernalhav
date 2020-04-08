TARGET=main001.c
LIB=libfoo.a

CPP_OUT=main001_p.c
CC_OUT=main001.S
ASM_OUT=main001.o
LD_OUT=bin


CPPFLAGS=
CFLAGS=-S -fno-pie -fno-pic	# Flags for gcc when going from preprocessed to assembly
ASM_FLAGS=-fno-pie -fno-pic # Flags for gcc when going from assembly to object
LDFLAGS=-L.


$(CPP_OUT): $(TARGET)
	cpp $(CPPFLAGS) $(TARGET) -o $(CPP_OUT)


$(CC_OUT): $(CPP_OUT)
	gcc $(CFLAGS) $(CPP_OUT) -o $(CC_OUT)


$(ASM_OUT): $(CC_OUT)
	gcc $(ASM_FLAGS) $(CC_OUT) -c


$(LD_OUT): $(ASM_OUT)
	ld $(LDFLAGS) $(ASM_OUT) $(LIB) -o $(LD_OUT)


.PHONY: all clean preprocess compile assemble link

all:  $(LD_OUT)


clean:
	rm -f $(CPP_OUT) $(CC_OUT) $(LD_OUT) $(ASM_OUT)


preprocess: $(CPP_OUT)

compile: $(CC_OUT)

assemble: $(ASM_OUT)

link: $(LD_OUT)
