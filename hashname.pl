#!/usr/bin/perl -w
use strict;

my %person = (
  "Michael" => "Jordan",
  "David" => "Beckham",
  "Homer" => "Simpson");

chomp(my $name = <STDIN>);
unless (exists $person{$name}) {
  die "Error: name does not exist\n";
}

print "$person{$name}\n";
