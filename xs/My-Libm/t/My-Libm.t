# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl My-Libm.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More;
BEGIN { use_ok('My::Libm') };

is floor(1.9), 1, "floor()";
is ceil(1.9), 2, "ceil()";
is pow(2, 3), 8, "pow()";

done_testing();
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
