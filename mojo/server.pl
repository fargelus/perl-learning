#!/usr/bin/env perl
use strict;
use Mojolicious::Lite;

get '/' => 'index';
app->start;

__DATA__

@@ index.html.ep
% layout 'default';
% title 'Превееед!';
<p> Test </p>
