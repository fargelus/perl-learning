package Logger;
use Moo;
use Module::Runtime qw(require_module);

has 'storage' => (
  is => 'ro',
  isa => sub {
               die 'bad storage name'
               unless $_[0] && !ref $_[0]
             }
);

has 'storage_object' => (
  is => 'lazy'
);

sub _build_storage_object {
  my $self = shift;
  my $class = 'Logger::Storage::' . $self->storage;
  require_module($class);
  $class->new;
}

sub log {
  my ($self, $msg) = @_;

  $self->storage_object->log($msg);
}

1;
