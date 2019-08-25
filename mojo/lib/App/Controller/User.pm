package App::Controller::User;

use Mojo::Base 'Mojolicious::Controller';
use App::Helpers;
use App::Model::Users;
use Cwd;


sub getLogin {
  my $self = shift;

  stashLexer($self);
  $self->render(template => 'user/login');
}

sub postLogin {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  my $fetch_rec = App::Model::Users->exist($username, $pwd);
  return $self->redirect_to('/user_empty') unless ($fetch_rec);

  $self->session(id => @$fetch_rec[0]);
  $self->redirect_to('greetings');
}

sub logout {
  my $self = shift;
  delete $self->session->{'id'};
  $self->redirect_to('/');
}

sub getReg {
  my $self = shift;

  stashLexer($self);
  $self->render(template => 'user/registration');
}

sub register {
  my $self = shift;
  my ($username, $pwd) = (
    $self->param('username'),
    $self->param('password')
  );

  my $is_user_exist = App::Model::Users->exist($username, $pwd);
  return $self->render(text => 'Ошибка. Пользователь уже существует.') if ($is_user_exist);

  my $inserted_id = App::Model::Users->insert($username, $pwd, '');
  if ($inserted_id) {
    $self->session(id => $inserted_id);
    $self->redirect_to('greetings');
  }
}

sub update {
  my $self = shift;

  my $avatarFile = $self->req->upload('avatar');
  if ($avatarFile) {
    my $filename = $avatarFile->filename;
    my $dir = getcwd();
    my $path = $dir."/public/store/$filename";
    $avatarFile->move_to($path);

    my $cur_id = $self->session('id');
    my $saving_path = "/store/$filename";
    my $is_updated = App::Model::Users->update($cur_id, { 'avatar' => $saving_path });
    my %response;
    if ($is_updated) {
      $self->flash('update' => 1);

      %response = (
        text => 'Avatar was sucessfully updated',
        status => 200,
        format => 'txt',
      );
    } else {
      %response = (
        text => 'Error while updating avatar',
        status => 500,
        format => 'txt',
      )
    }

    $self->render(%response);
  }
}


1;