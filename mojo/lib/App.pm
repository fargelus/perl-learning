package App;
use Mojo::Base 'Mojolicious';
use App::Model::Users;

sub startup {
  my $self = shift;
  $self->secrets(['Simple app']);

  App::Model::Users->select_all() || App::Model::Users->create_table();

  my $r = $self->routes();
  $r->any('/')->to('main#index')->name('index');
  $r->get('/greetings')->to('main#greetings');

  $r->get('/login')->name('login');
  $r->post('/login')->to('main#login');
  $r->get('/logout')->to('main#logout');
  $r->get('/reg')->name('registration');
  $r->post('/reg')->to('main#reg');
  $r->post('/update')->to('main#update');
  $r->post('/translate')->to('main#translate');
}

1;
