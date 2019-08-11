use strict;
use warnings;
use Logger;
use 5.010;

my $log = Logger->new( storage => 'Screen');
$log->log('Another one');
