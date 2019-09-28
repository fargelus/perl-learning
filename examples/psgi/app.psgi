use strict;
use Plack;
use Plack::Request;
use Plack::Builder;


sub build_app {
  my $mode = shift;

  return sub {
    my $env = shift;

    my $req = Plack::Request->new($env);
    my $res = $req->new_response(200);
    my $params = $req->parameters();

    my $body;
    my $string_param = $params->{string};
    if ($string_param) {
      if ($mode eq 'reverse') {
        $body = scalar reverse $string_param;
      } elsif ($mode eq 'palindrome') {
        $body = palindrome($string_param)
                  ? 'Palindrome'
                  : 'Not a palindrome';
      } else {
        $body = "string is $string_param";
      }
    } else {
      $body = 'empty string';
    }

    $res->body($body);
    return $res->finalize();
  };
}

sub palindrome {
  my $string = shift;

  $string = lc $string;
  $string =~ s/\s//gs;

  $string eq scalar reverse $string;
}


my $main_app = builder {
  mount "/palindrome" => builder {build_app ('palindrome')};
  mount "/reverse" => builder { build_app('reverse') };
  mount "/" => builder { build_app() };
};
