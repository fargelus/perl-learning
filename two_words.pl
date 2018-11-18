#!/usr/bin/perl -w
use strict;

my $filename = $ARGV[0];
unless (open NAMES, $filename) {
  die "Error, while opening $filename";
}

while (<NAMES>) {
  if (/((W|w)ilma.*fred|(F|f)red.*wilma)/) {
    print "$_";
  }
}
