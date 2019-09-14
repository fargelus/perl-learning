package Logger;


use strict;
use warnings;
use v5.10;

use Term::ANSIColor ':constants';


sub Debug { say STDERR shift; }
sub Info { say STDERR GREEN, shift, RESET }
sub Warn { say STDERR YELLOW, shift, RESET }
sub Error { say STDERR RED, shift, RESET }


1;
