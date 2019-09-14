#!/usr/bin/perl -w

use strict;

use Log::Any::Adapter;
Log::Any::Adapter->set('+Adapter');

use CoffeeMaker;


CoffeeMaker->make(80);
