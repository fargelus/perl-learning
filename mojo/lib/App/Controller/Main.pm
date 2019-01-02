package App::Controller::Main;
use Mojo::Base 'Mojolicious::Controller';

sub index {
  my $self = shift;

  # TODO Сессия
  my $user_id = $self->session('id');
  return $self->render unless ($user_id);
}

sub login {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  $self->flash(username => '123');
  # TODO Модель
  $self->redirect_to('greetings');
}

sub greetings {
  my $self = shift;
  my $username = $self->flash('username');
  $self->render(username => $username);
}

sub logout {
  my $self = shift;
  # TODO сессия
  $self->redirect_to('/');
}

sub reg {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  # TODO Сессия и Модель
  $self->flash('username' => $username);
  $self->redirect_to('greetings');
}

1;
