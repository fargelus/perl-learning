package App;

use Mojo::Base 'Mojolicious';
use App::Model::Users;


sub startup {
  my $self = shift;
  $self->secrets(['Simple app']);

  App::Model::Users->select_all() || App::Model::Users->create_table();

  defineRoutes($self);

  $self->helper(relative_path => sub {
    my $self = shift;
    my $page = shift;
    return $self->url_for.'/'.$page if $self->url_for =~ 'en';
    return $page;
  });
}

sub defineRoutes {
  my $self = shift;

  my $r = $self->routes();
  my @roots = ('', 'en');
  # Языковые маршруты
  foreach my $root (@roots) {
    my $root = $r->under($root);

    $root->any('/')->to('main#index');
    $root->get('/login')->to('user#getLogin');
    $root->get('/greetings')->to('main#greetings');
    $root->any('/user_empty')->to('main#userEmpty');
    $root->get('/reg')->to('user#getReg');
  }

  # Общие маршруты
  $r->post('/update')->to('user#update');
  $r->post('/reg')->to('user#register');
  $r->post('/translate')->to('main#translate');
  $r->post('/login')->to('user#postLogin');
  $r->get('/logout')->to('user#logout');
}

1;
