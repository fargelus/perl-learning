package App;

use Mojo::Base 'Mojolicious';
use App::Model::Users;


sub startup {
  my $self = shift;
  $self->secrets(['Simple app']);

  App::Model::Users->select_all() || App::Model::Users->create_table();

  my $r = $self->routes();
  $r->any('/')->to('main#index');
  $r->get('/greetings')->to('main#greetings');
  $r->post('/translate')->to('main#translate');
  $r->any('/user_empty')->to('main#userEmpty');

  $r->get('/login')->to('user#getLogin');
  $r->post('/login')->to('user#postLogin');
  $r->get('/logout')->to('user#logout');
  $r->get('/reg')->to('user#getReg');
  $r->post('/reg')->to('user#register');
  $r->post('/update')->to('user#update');
}


1;
