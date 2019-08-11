package Logger::Storage::Screen;

use Moo;
with 'Logger::Role::Storage';

sub log {
  my ($self, $msg) = @_;
  print $msg;
}

1;
