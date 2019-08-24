#!/usr/bin/perl

use AnyEvent;

my $done = AnyEvent->condvar;
my ($w, $t);

$w = AnyEvent->io(
  fh => \*STDIN,
  poll => 'r',
  cb => sub {
    chomp (my $input = STDIN);
    warn "read: $input\n";
    undef $w;
    undef $t;
    $done->send;
  }
);

$t = AnyEvent->timer(
  after => 4.2,
  cb => sub {
    if (defined $w) {
      warn "no input after 4.2sec\n";
      undef $w;
      undef $t;
    }

    $done->send;
  }
);

$done->recv;
