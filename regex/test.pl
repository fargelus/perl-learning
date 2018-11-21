#!/usr/bin/perl -w
while (<>) {
  chomp;
  if (/test/) {
    print "Matched: |$`<$&>$'|\n'`";
  } else {
    print "No match: |$_|\n";
  }
}
