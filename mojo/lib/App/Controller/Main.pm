package App::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use App::Model::Users;

sub index {
  my $self = shift;

  if ( $self->session('username') ) {
    $self->redirect_to('greetings');
  }

  $self->render;
}

sub login {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  my $fetch_rec = App::Model::Users->select($username, $pwd);
  return $self->render(text => 'Ошибка. Пользователя не существует.') unless ($fetch_rec);

  $self->session(username => $username);
  $self->redirect_to('greetings');
}

sub greetings {
  my $self = shift;
  my $username = $self->session('username');
  $self->render(username => $username);
}

sub logout {
  my $self = shift;
  delete $self->session->{'username'};
  $self->redirect_to('/');
}

sub reg {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  my $is_user_exist = App::Model::Users->select($username, $pwd);
  return $self->render(text => 'Ошибка. Пользователь уже существует.') if ($is_user_exist);

  if (App::Model::Users->insert($username, $pwd)) {
    $self->session(username => $username);
    $self->redirect_to('greetings');
  }
}

1;
