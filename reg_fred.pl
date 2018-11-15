#!/usr/bin/perl -w
use strict;

my $filename = $ARGV[0];
unless (open NAMES, $filename) {
  die "Error, while opening $filename";
}

while (<NAMES>) {
  # \A - начало строки
  if (/\A(F|f)red +/) {
    print "$_\n";
  }
}

close NAMES;
