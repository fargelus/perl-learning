#!/usr/bin/perl
use strict;
use warnings;
use feature 'state';

sub greet_all {
  state @store;
  my $name = $_[0];

  # Скалярный контекст
  my $len = @store;
  unless ($len) {
    print "Hi, " . $name . "! You are the first here\n";
  } else {
    print "Hi, " . $name . "! I've seen @store here\n";
  }

  push @store, $name;
}

greet_all('Fred');
greet_all('Barney');
greet_all('Wilma');
greet_all('Betty');
