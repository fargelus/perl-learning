#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $self = shift;
  $self->render(text => 'Hello, world!!!');
};

get '/form' => sub {
  my $self = shift;
  $self->render('form');
};

post '/form' => sub {
  my $self = shift;
  my $username = $self->param('username');
  $self->render('greetings', username => $username);
};

app->start;

__DATA__

@@ form.html.ep
% title 'Form';
<form method="post" action="/form">
  <input type="text" name="username" placeholder="Введите имя" required pattern="[А-Яа-яЁё]+">
  <button>Отправить</button>
</form>

@@ greetings.html.ep
% title 'Greetings';
<p>Привет, <%=$username%></p>
