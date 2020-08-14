#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"


MODULE = Hello::World		PACKAGE = Hello::World
void
greeting()
    CODE:
        printf("Hello World!\n");
