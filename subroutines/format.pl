#!/usr/bin/perl -w
use strict;
use POSIX;

sub print_ruler {
  my $row_count = ceil($_[0] / 10);
  for(my $i = 0; $i < $row_count; $i++) {
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
my $line_len = shift @values;
print_ruler($line_len);
print "\n";
for (@values) {
  pretty_print($_, $line_len);
}
