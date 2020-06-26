#!/usr/bin/perl -w
use strict;

print "Enter a temperature (e.g., 32F, 100C):\n";
my $input = <STDIN>;
chomp($input);

if ($input =~ /^([-+]?[0-9]+)([CF])$/) {
  my $input_num = $1;
  my $type = $2;
  my ($farenheit, $celsius);

  if ($type eq 'C') {
    $celsius = $input_num;
    $farenheit = ($celsius * 9 / 5) + 32;
  } else {
    $farenheit = $input_num;
    $celsius = ($farenheit - 32) * 5 / 9;
  }

  printf "%.2f C is %.2f F\n", $celsius, $farenheit;
} else {
  print "Expecting a number followed by \"C\" or \"F\",\n";
  print "so I don't understand \"$input\".\n";
}
