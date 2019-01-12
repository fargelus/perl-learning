#!/usr/bin/perl
use strict;

my $barney_path = '../assets/barney';

open BARNEY, '>' . $barney_path or die 'Error while opening to write';
print BARNEY "1234\n";
close BARNEY;

open BARNEY, '>>' . $barney_path or die 'Error while opening to append';
print BARNEY "456777\n";
close BARNEY;
