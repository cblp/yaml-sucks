require "yaml"
require "json"

f_name = ARGV[0].not_nil!

yaml = File.open(f_name) do |file_io|
  puts YAML.parse(file_io).to_json
end