#!/usr/bin/perl -w
use strict;

while($html =~ m{<a\b([^>]+)>(.*?)</a>}ig) {
  my $guts = $1;
  my $link = $2;

  if ($guts =~ m{
                  \b HREF
                  \s* = \s*
                  (?:
                    "([^"])"
                    |
                    '([^'])'
                    |
                    ([^'">\s]+)
                  )
                }xi) {
      my $url = $+;
      print "$url with link text: $link";
  }
}
