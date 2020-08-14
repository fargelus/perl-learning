#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <math.h>

MODULE = My::Libm		PACKAGE = My::Libm

double
ceil(x)
  double  x
  PROTOTYPE: $

double
floor(x)
  double  x
  PROTOTYPE: $

double pow(x, y)
  double x
  double y
  PROTOTYPE: $$
