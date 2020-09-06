use strict;
use warnings;

use Plack;
use Plack::Request;
use Plack::Builder;
use lib './lib';


my $api_app = sub {
  my $env = shift;

  my $req = Plack::Request->new($env);
  my $res = $req->new_response(200);

  my $params = $req->parameters();
  if ($params->{string} && $params->{string} eq 'data') {
    $res->body('ok');
  } else {
    $res->body('not ok');
  }

  return $res->finalize();
};

my $main_app = builder {
  mount '/' => builder {
    mount '/post' => builder {
      enable 'Only', method => 'POST';
      $api_app;
    };

    mount '/get' => builder {
      enable 'Only', method => 'GET';
      $api_app;
    };

    mount '/' => builder { $api_app };
  };
};
