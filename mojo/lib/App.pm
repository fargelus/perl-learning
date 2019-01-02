package App;
use Mojo::Base 'Mojolicious';

use App::Model::Users;

sub startup {
  my $self = shift;
  $self->secrets(['Simple app']);

  $self->helper(init_store => sub {
    App::Model::Users->create_table;
  });
  $self->helper(get_all_from_store => sub {
    App::Model::Users->select_all;
  });
  $self->helper(insert_to_store => sub {
    App::Model::Users->insert;
  });
  $self->helper(select_from_store => sub {
    App::Model::Users->select;
  });

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
