#!/usr/bin/perl -w

$i = 0;
print ++$i." " while ($i < 5);
print "\n";

$i = 0;
print ++$i." " until ($i == 5);
print "\n";

print $_." " for(1..5);
print "\n";

for ($i = 0; $i <= 10; $i++) {
  next if $i == 2;
  print "$i ";
  last if $i == 8;
}
print "\n";
