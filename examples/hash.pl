#!/usr/bin/perl -w

%hash = (
  'x' => 12,
  y => 53,
  'z' => -10.5
);

$hash{x}++;
$hash{y}--;

print "x = $hash{x}, y = $hash{y}\n";
