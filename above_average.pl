#!/usr/bin/perl
use strict;

sub above_average {
  my @list = @_;
  my $list_length = @_;
  my $total_sum = total(@list);
  my $average = average($total_sum, $list_length);

  my @above;
  foreach my $item(@list) {
    if ($item > $average) {
      push @above, $item;
    }
  }

  @above;
}

sub total {
  my @arguments = @_;
  my $sum;
  foreach my $arg (@arguments) {
    $sum += $arg;
  }

  return $sum;
}

sub average {
  @_[0] / @_[1];
}

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
