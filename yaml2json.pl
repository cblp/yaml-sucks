#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

use JSON::PP;
use YAML::XS;

eval {
    say encode_json Load join '', <>;
};
say $@ if $@;
