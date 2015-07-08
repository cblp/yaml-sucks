# YAML sucks.

| YAML source | yaml2json.hs | yaml2json.py | yaml2json.pl |
|---|---|---|---|
| << | "\u003c\u003c" | could not determine a constructor for the tag 'tag:yaml.org,2002:merge' in "<stdin>", line 1, column 1 | YAML Error: Expected separator '---' Code: YAML_PARSE_ERR_NO_SEPARATOR Line: 1 Document: 2 at /usr/share/perl5/YAML/Loader.pm line 80. |
| "<<" | "\u003c\u003c" | "<<" | YAML Error: Expected separator '---' Code: YAML_PARSE_ERR_NO_SEPARATOR Line: 1 Document: 2 at /usr/share/perl5/YAML/Loader.pm line 80. |
| <<: {} | {} | {} | {"<<":{}} |
| "<<": {} | {} | {"<<": {}} | {"<<":{}} |
| <<: a | {"\u003c\u003c":"a"} | while constructing a mapping in "<stdin>", line 1, column 1 expected a mapping or list of mappings for merging, but found scalar in "<stdin>", line 1, column 5 | {"<<":"a"} |
