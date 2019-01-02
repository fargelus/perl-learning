package App::Model::Users;

use Mojo::Base -base;
use DBI;
use Carp qw(carp croak);

my $dbh = DBI->connect('dbi:SQLite:database.db', '', '') or croak 'Could not connect';

sub create_table {
  my $self = shift;
  carp 'Creating table users';
}

sub select_all {
  my $self = shift;
  carp 'Select all users';
}

sub select {
  my $self = shift;
  carp 'Select data';
}

sub insert {
  my $self = shift;
  carp 'Insert data';
}

1;
