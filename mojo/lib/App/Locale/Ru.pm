package App::Locale::Ru;

use strict;
use warnings;

use encoding 'utf8';
use Exporter qw(import);


our @EXPORT = qw(%LEXICON);

our %LEXICON = (
  enter => 'Войти',
  reg => 'Регистрация',
  lang_chooser => 'Выберите язык',
  ru => 'Русский',
  en => 'Английский',
  tr => 'Перевести',
);


1;
