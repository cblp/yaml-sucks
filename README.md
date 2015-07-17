# YAML sucks.

| YAML source | yaml2json.hs | yaml2json.py | yaml2json.pl |
|---|---|---|---|
| << | "\u003c\u003c" | could not determine a constructor for the tag 'tag:yaml.org,2002:merge'<br>  in "<stdin>", line 1, column 1 | YAML Error: Expected separator '---'<br>   Code: YAML_PARSE_ERR_NO_SEPARATOR<br>   Line: 1<br>   Document: 2<br> at /usr/share/perl5/YAML/Loader.pm line 81.<br> |
| "<<" | "\u003c\u003c" | "<<" | YAML Error: Expected separator '---'<br>   Code: YAML_PARSE_ERR_NO_SEPARATOR<br>   Line: 1<br>   Document: 2<br> at /usr/share/perl5/YAML/Loader.pm line 81.<br> |
| <<: {} | {} | {} | {"<<":{}} |
| "<<": {} | {} | {"<<": {}} | {"<<":{}} |
| <<: a | {"\u003c\u003c":"a"} | while constructing a mapping<br>  in "<stdin>", line 1, column 1<br>expected a mapping or list of mappings for merging, but found scalar<br>  in "<stdin>", line 1, column 5 | {"<<":"a"} |
| - undefined<br>- null<br>- false<br>- true<br>- n<br>- y<br>- off<br>- on | ["undefined",null,false,true,false,true,false,true] | ["undefined", null, false, true, "n", "y", false, true] | ["undefined"] |
| - 8<br>- 08 | [8,8] | [8, "08"] | ["8"] |
