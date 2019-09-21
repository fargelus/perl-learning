package App::Helpers;


use strict;
use warnings;

use App::Locale::Ru;
use App::Locale::En;
use Exporter qw(import);


our @EXPORT = qw(stashLexer getTranslatedPageURL);

sub stashLexer {
  my $self = shift;

  my $lexer = getLexer($self);
  $self->stash(
    DICT => $lexer,
  );
}

sub getLexer {
  my $self = shift;

  my $url = $self->url_for;

  return \%App::Locale::En::LEXICON if $url =~ m/\/en\/?/;
  return \%App::Locale::Ru::LEXICON;
}

sub getTranslatedPageURL {
  my ($lang, $originPage) = @_;

  $originPage =~ s{en\/}{};
  if ($lang eq 'en') {
    $originPage =~ s{(?<=\w)\/}{\/en\/};
  }

  $originPage;
}


1;
