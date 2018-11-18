#!/usr/bin/perl -w
use strict;

my $filename = $ARGV[0];
unless (open NAMES, $filename) {
  die "Error, while opening $filename";
}

while (<NAMES>) {
  if (/(\w)\1+/) {
    print "$_";
  }
}
