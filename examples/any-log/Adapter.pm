package Adapter;


use strict;
use warnings;

use Log::Any::Adapter::Util 'make_method';
use Logger;
use base 'Log::Any::Adapter::Base';


my %pairs = (
  Debug => [qw/debug/],
  Info => [qw/info inform/],
  Warn => [qw/notice warn warning/],
  Error => [qw/err error fatal crit critical alert emergency/],
);

while(my ($func, $methods) = each %pairs) {
  my $code = <<EOC;
sub {
  shift;
  \@_ = (join '', \@_);
  \&Logger:\:$func;
}
EOC

  my $sub = eval $code;
  for my $method (@$methods) {
    make_method($method, $sub);
  }
}

for my $method (Log::Any->detection_methods) {
  make_method($method, sub { 1 });
}


1;
