#!/usr/bin/env ruby

require 'json'
require 'yaml'

puts JSON.dump YAML.load STDIN
