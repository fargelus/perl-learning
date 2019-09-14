package CoffeeMaker;


use strict;
use warnings;
use utf8;

use Log::Any '$log';


binmode(STDERR, ':utf8');

sub make {
  my $self = shift;

  my ($temperature) = @_;

  $log->debug('лоток загружен, вода есть');
  $log->info("варю кофе, температура $temperature");
  $log->warn('осторожно горячо!') if $temperature > 70;
  $log->error('непредвиденная проблема');
  $log->info('готово');
}


1;
