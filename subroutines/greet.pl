#!/usr/bin/perl
use strict;
use warnings;
use feature 'state';

sub greet {
  my $arg = $_[0];
  state $name;

  if (defined $name) {
    print "Hi $arg. $name is also here\n";
  } else {
    $name = $arg;
    print "Hi $name. You are the first one here\n";
  }
}

greet('Fred');
greet('Barney');
greet('Wilma');
