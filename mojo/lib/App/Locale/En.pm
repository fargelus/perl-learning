package App::Locale::En;

use strict;
use warnings;

use Exporter qw(import);


our @EXPORT = qw(%LEXICON);

our %LEXICON = (
  enter => 'Login',
  reg => 'Registration',
  lang_chooser => 'Choose lang',
  ru => 'Russian',
  en => 'English',
  tr => 'Translate',
);


1;
