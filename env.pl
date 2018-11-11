#!/usr/bin/perl -w
use strict;

sub print_env_table {
  my $keys_formatter = get_key_formatter();

  my $filename = "files/env_table";
  unless (open ENV_TABLE, ">$filename") {
    die "Error: can't open file $filename";
  }

  select ENV_TABLE;
  
  $ENV{"MY"} = "env.pl";
  foreach my $key (sort keys %ENV) {
    printf "$keys_formatter", $key;
    print "|";
    print "$ENV{$key}\n";
  }

  close ENV_TABLE;
}

sub get_key_formatter {
  my $keys_line_len = find_max_length_of_env_keys();
  get_str_formatter($keys_line_len);
}

sub find_max_length_of_env_keys {
  my @array = keys %ENV;
  my $max_length = length $array[0];
  my $array_size = @array;

  for(my $i = 1; $i < $array_size; $i++) {
    my $current_length = length $array[$i];
    if ($current_length > $max_length) {
      $max_length = $current_length;
    }
  }

  $max_length;
}

sub get_str_formatter {
  my $len = $_[0];
  "%" . "$len" . "s";
}

print_env_table();
