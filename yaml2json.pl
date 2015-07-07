#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

use JSON::PP;
use YAML;

eval {
    say encode_json Load <>;
};
say $@ if $@;
