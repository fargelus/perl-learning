#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);

my $a = do { say "one"; 3 }, do { say "two"; 7 };
print '$a:' . $a . "\n"; # return 3
