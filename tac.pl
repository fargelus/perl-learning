#!/usr/bin/perl -w
use strict;

sub change_stderr {
  unless (open STDERR, '>>files/error.log') {
    die "Could not opened error log file\n";
  }
}

sub get_file_content {
  my $filename = $_[0];
  unless (open "FILE", $filename) {
    die "error while opening";
  }

  my @lines;
  while (chomp(my $line = <FILE>)) {
    push @lines, $line;
  }
  @lines;
}

change_stderr();

my @files = reverse @ARGV;
foreach my $file (@files) {
  my @content = get_file_content($file);
  my @reversed = reverse @content;
  print "@reversed\n";
}
