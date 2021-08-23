#!/usr/bin/perl -w

$line = 'Ten Thousand,10000, 2710,,"10000",10k,"It\'s "" 10 Grand"", baby"';
while ($line =~ m/([^",]+)|"((?:[^"]|"")*)"/g) {
  if (defined $1) {
    $field = $1;
  } else {
    $field = $2 || $3;
    $field =~ s/""/"/g;
  }
  print "[$field]";
}
print "\n";
