package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(nb_dig);
use feature qw(say);

sub nb_dig {
    my ($n, $d) = @_;
    my @squares = map {"$_"} map { $_ * $_ } 0..$n;
    my $counter = 0;
    foreach my $digits (@squares) {
      ++$counter while $digits =~ /$d/g;
    }

    $counter;
}

say nb_dig(25, 1);
