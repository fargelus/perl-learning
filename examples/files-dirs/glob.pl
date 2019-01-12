#!/usr/bin/perl -w
use strict;

my @flist = glob '~/.tar.bz';
print "$_\n" for (@flist);
