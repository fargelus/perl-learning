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
  name => 'Name',
  pwd => 'Password',
  create_acc => 'Create account',
  user_empty => 'Error. User not exist.',
  user_exist => 'Error. User already exist',
  hi => 'Hello',
  upload_ava => 'Upload avatar',
  update => 'Update',
  exit => 'Exit',
);


1;
