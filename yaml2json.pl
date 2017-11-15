#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
binmode(STDOUT, ':utf8');

use JSON::PP;
use YAML::XS;

say JSON::PP->new->allow_nonref->encode(Load join '', <>);
