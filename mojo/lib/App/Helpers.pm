package App::Helpers;

use strict;
use warnings;

use App::Locale::Ru;
use Exporter qw(import);


our @EXPORT = qw(stashLexer);

sub stashLexer {
  my $self = shift;

  my $CURRENT_LEXER = \%App::Locale::Ru::LEXICON;
  if ( $self->session('lexer') ) {
    $CURRENT_LEXER = $self->session('lexer');
  }
  $self->stash(
    DICT => $CURRENT_LEXER,
  );
}


1;
