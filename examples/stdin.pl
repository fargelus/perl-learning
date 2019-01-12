#!/usr/bin/perl
use strict;

while (<STDIN>) {
  chomp;
  last if ($_ eq 'exit');
  printf "Вы ввели %s. Для выхода введит exit\n", $_;
}
