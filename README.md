# YAML sucks.

| YAML source | yaml2json.hs | yaml2json.py | yaml2json.pl |
|---|---|---|---|
| - null<br>- false<br>- n<br>- off | [null,false,false,false] | [null, false, "n", false] | ["null","false","n","off"] |
|  | :x: UnexpectedEvent {_received = Nothing, _expected = Just EventStreamStart} | null | hash- or arrayref expected (not a simple scalar, use allow_nonref to allow this) at ./yaml2json.pl line 11.<br> |
| << | "\u003c\u003c" | :x: ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'<br>  in "<stdin>", line 1, column 1 | YAML Error: Expected separator '---'<br>   Code: YAML_PARSE_ERR_NO_SEPARATOR<br>   Line: 1<br>   Document: 2<br> at /usr/share/perl5/YAML/Loader.pm line 80.<br> |
| "<<" | "\u003c\u003c" | "<<" | YAML Error: Expected separator '---'<br>   Code: YAML_PARSE_ERR_NO_SEPARATOR<br>   Line: 1<br>   Document: 2<br> at /usr/share/perl5/YAML/Loader.pm line 80.<br> |
| <<: {} | {} | {} | {"<<":{}} |
| - <<: {} | [{}] | [{}] | ["<<: {}"] |
| "<<": {} | {} | {"<<": {}} | {"<<":{}} |
| <<: a | {"\u003c\u003c":"a"} | :x: ConstructorError: while constructing a mapping<br>  in "<stdin>", line 1, column 1<br>expected a mapping or list of mappings for merging, but found scalar<br>  in "<stdin>", line 1, column 5 | {"<<":"a"} |
| - 1_000_000 | ["1_000_000"] | [1000000] | ["1_000_000"] |
| - 8<br>- 08 | [8,8] | [8, "08"] | ["8","08"] |
