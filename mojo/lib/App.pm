package App;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;
  $self->secrets(['Simple app']);

  my $r = $self->routes();
  $r->any('/')->to('main#index')->name('index');
  $r->get('/greetings')->to('main#greetings');

  $r->get('/login')->name('login');
  $r->post('/login')->to('main#login');
  $r->get('/logout')->to('main#logout');
  $r->get('/reg')->name('registration');
  $r->post('/reg')->to('main#reg');
}

1;
