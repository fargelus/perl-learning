#!/usr/bin/perl -w
use strict;

opendir HOME, '/home/dima' or die $!;
while (my $fname = readdir HOME) {
  print "$fname\n";
}
closedir HOME;
