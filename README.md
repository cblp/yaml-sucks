# YAML sucks.

| YAML | read from Haskell | read from Python |
|---|---|---|
| << | "\u003c\u003c" | could not determine a constructor for the tag 'tag:yaml.org,2002:merge' in "<stdin>", line 1, column 1 |
| "<<" | "\u003c\u003c" | "<<" |
| <<: {} | {} | {} |
| "<<": {} | {} | {"<<": {}} |
| <<: a | {"\u003c\u003c":"a"} | while constructing a mapping in "<stdin>", line 1, column 1 expected a mapping or list of mappings for merging, but found scalar in "<stdin>", line 1, column 5 |
