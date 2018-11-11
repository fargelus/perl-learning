#!/usr/bin/perl -w
use strict;

my @words = <STDIN>;
my %count_words;
foreach my $word (@words) {
  chomp($word);
  $count_words{$word}++;
}

# Print it in ASCII format
my @sorted_words = sort keys %count_words;
foreach my $ascii_word (@sorted_words) {
  print "$ascii_word: $count_words{$ascii_word}\n";
}
