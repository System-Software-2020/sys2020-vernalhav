TARGET=main001.c
LIBS=libfoo.a

CPP_OUT=main001_p.c
CC_OUT=main001.S
LD_OUT=bin


CPPFLAGS=
CFLAGS=-S
LDFLAGS=-L


preprocess: $(TARGET)
	cpp $(CPPFLAGS) $(TARGET) -o $(CPP_OUT)


assembly: $(CPP_OUT)
	gcc $(CFLAGS) $(CPP_OUT) -o $(CC_OUT)


link: $(CC_OUT) $(LIBS)
	ld $(LDFLAGS) $(CC_OUT) $(LIBS) -o $(LD_OUT)


all:
	gcc $(CPPFLAGS) $(CGLAGS) $(LDFLAGS) $(TARGET) $(LIBS)
