#!/usr/bin/perl
use strict;

# Создаем файловый дескриптор
open FID, '../assets/names' or die 'Error. Could not open';
my $i = 0;
print "line " . ++$i . ": $_" while (<FID>);
close FID;
