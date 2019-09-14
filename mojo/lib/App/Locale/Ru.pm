package App::Locale::Ru;

use strict;
use warnings;

use encoding 'utf8';
use Exporter qw(import);


our @EXPORT = qw(%LEXICON);

our %LEXICON = (
  home_page => 'Главная',
  greetings_page => 'Приветствую',
  enter => 'Войти',
  reg => 'Регистрация',
  lang_chooser => 'Выберите язык',
  ru => 'Русский',
  en => 'Английский',
  tr => 'Перевести',
  name => 'Имя',
  pwd => 'Пароль',
  create_acc => 'Создать аккаунт',
  user_empty => 'Ошибка. Пользователя не существует.',
  user_exist => 'Ошибка. Пользователь уже существует.',
  hi => 'Привет',
  upload_ava => 'Загрузить аватарку',
  update => 'Обновить',
  exit => 'Выход',
);


1;
