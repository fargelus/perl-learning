package Logger::Role::Storage;

use strict;
use warnings;

use Moo::Role;

requires 'log';

before log => sub {
  chomp $_[1];
  $_[1] .= "\n";
};

1;
