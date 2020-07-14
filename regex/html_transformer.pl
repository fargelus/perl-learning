#!/usr/bin/perl -w
use strict;

undef $/;
my $text = <>; # загрузить файл из командной строки

$text =~ s/&/&amp;/g;
$text =~ s/</&lt;/g;
$text =~ s/>/&gt;/g;
$text =~ s/^s+$/<p>/g;

my $hostname_regex = qr/[-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)/i;

$text =~ s{
  \b
  (
    \w[-.\w]*
    \@
    $hostname_regex
  )
  \b
}{<a href="mailto:$1">$1</a>}gix;

$text =~ s{
  \b
  (
    https?://$hostname_regex( \b)?
    (
      / [-a-z0-9R:\@&?=+,.!/~+'%\$]*
      (?<![.,?!])
    )?
  )
}{<a href="$1">$1</a>}xgi;

print $text;
