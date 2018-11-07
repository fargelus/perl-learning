#!/usr/bin/perl -w
use strict;

sub print_ruler {
  for(my $i = 0; $i < 3; $i++) {
    my @seq = 1..9;
    push @seq, 0;
    print @seq;
  }
}

sub pretty_print {
  my ($val, $str_len) = @_;
  my $formatter = "%" . ($str_len + 1) . "s";
  printf "$formatter", $val;
}

my @values = <STDIN>;
print_ruler();
print "\n";
for (@values) {
  pretty_print($_, 20);
}
