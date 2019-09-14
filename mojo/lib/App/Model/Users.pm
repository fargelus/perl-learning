package App::Model::Users;

use Mojo::Base -base;
use DBI;
use Carp qw(carp croak);


my $dbh = DBI->connect('dbi:SQLite:database.db', '', '') or croak 'Could not connect';

sub create_table {
  carp 'Creating table users...';
  my $query = 'CREATE TABLE users (id INTEGER PRIMARY KEY, name varchar(255), pwd varchar(255), avatar varchar(255))';
  $dbh->do($query);
}

sub select_all {
  carp 'Select all users';
  my $query = 'SELECT * FROM users';
  my $db = eval {$dbh->prepare($query)} || return undef;

  $db->execute();
  $db->fetchall_arrayref();
}

sub select {
  my $self = shift;
  my $id = $_[0];
  carp "Select data by id: $id...";

  my $query = "SELECT * FROM users WHERE id='$id'";
  my $db = eval {$dbh->prepare($query)} || return undef;

  $db->execute();
  $db->fetchrow_arrayref();
}

sub fetch {
  my $self = shift;
  my ($looking_name, $looking_pwd) = @_;
  carp "Checking for col: $looking_name AND pwd: $looking_pwd...";

  my $query = "SELECT * FROM users WHERE name='$looking_name' AND pwd='$looking_pwd'";
  my $db = eval {$dbh->prepare($query)} || return undef;

  $db->execute();
  $db->fetchrow_arrayref();
}

sub insert {
  my $self = shift;
  my ($name, $pwd) = @_;
  carp "Insert data $name, $pwd to DB...";

  my $query = 'INSERT INTO users (name, pwd) VALUES(?, ?)';
  my $db = eval {$dbh->prepare($query)} || return undef;

  $db->execute($name, $pwd) ? $dbh->last_insert_id : undef;
}

sub update {
  my $self = shift;
  my ($id, $fields) = @_;
  carp "Update record id = $id...";

  my $set_str = '';
  for (keys %{$fields}) {
    $set_str .= ',' unless ($set_str eq '');
    my $val = $fields->{$_};
    $set_str .= "$_='$val'";
  }

  my $query = "UPDATE users SET $set_str WHERE id=$id";
  my $db = eval {$dbh->prepare($query)} || return undef;
  $db->execute();
}


1;
