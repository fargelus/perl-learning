package App::Model::Users;

use Mojo::Base -base;
use DBI;
use Carp qw(carp croak);

my $dbh = DBI->connect('dbi:SQLite:database.db', '', '') or croak 'Could not connect';

sub create_table {
  carp 'Creating table users...';
  my $query = 'CREATE TABLE users (id INTEGER PRIMARY KEY, name varchar(255), pwd varchar(255))';
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
  my ($looking_name, $looking_pwd) = @_;
  carp "Select data by name: $looking_name AND pwd: $looking_pwd";

  my $query = "SELECT name, pwd FROM users WHERE name='$looking_name' AND pwd='$looking_pwd'";
  my $db = eval {$dbh->prepare($query)} || return undef;
  $db->execute();
  $db->fetchrow_arrayref();
}

sub insert {
  my $self = shift;
  my ($name, $pwd) = @_;
  carp "Insert data $name, $pwd to DB...";

  my $query = 'INSERT INTO USERS (name, pwd) VALUES(?, ?)';
  my $db = eval {$dbh->prepare($query)} || return undef;

  $db->execute($name, $pwd);
  1;
}

1;
