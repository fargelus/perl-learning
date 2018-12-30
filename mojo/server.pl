use Mojolicious::Lite;
use DBI;

my $dbh = DBI->connect('dbi:SQLite:database.db', '', '') or die 'Could not connect';

get '/' => sub {
  my $self = shift;

  my $username = $self->session('username');
  if ($username) {
    $self->render('greetings', username => $username);
  } else {
    $self->render('index');
  }
};

get '/login' => sub {
  my $self = shift;
  $self->render('login');
};

post '/login' => sub {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  # TODO Авторизация юзера
  $self->render('greetings', username => $username);
};

get '/reg' => sub {
  my $self = shift;
  $self->render('registration');
};

post '/reg' => sub {
  my $self = shift;
  my $username = $self->param('username');
  my $pwd = $self->param('password');

  # TODO Регистрация юзера
  $self->session('username' => $username);
  $self->render('greetings', username => $username);
};

get '/logout' => sub {
  my $self = shift;
  delete $self->session->{'username'};
  $self->render('index');
};

app->start;
