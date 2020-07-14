#!/usr/bin/perl -w
use strict;

undef $/;
my $text = <>; # загрузить файл из командной строки

$text =~ s/&/&amp;/g;
$text =~ s/</&lt;/g;
$text =~ s/>/&gt;/g;
$text =~ s/^s+$/<p>/g;

$text =~ s{
  \b
  (
    \w[-.\w]*
    \@
    [-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)
  )
  \b
}{<a href="mailto:$1">$1</a>}gix;

$text =~ s{
  \b
  (
    https?://[-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)( \b)?
    (
      / [-a-z0-9R:\@&?=+,.!/~+'%\$]*
      (?<![.,?!])
    )?
  )
}{<a href="$1">$1</a>}xgi;

print $text;
