# YAML sucks.

<table>
<tr>
<th>YAML source</th>
<th>yaml2json.hs</th>
<th>yaml2json.py</th>
<th>yaml2json.pl</th>
</tr>
<tr>
<td>
```
- null
- false
- n
- off
```
</td><td>
```
[null,false,false,false]
```
</td><td>
```
[null, false, "n", false]
```
</td><td>
```
["null","false","n","off"]
```
</td>
</tr>
<tr>
<td>
```
```
</td><td>
:x:
```
UnexpectedEvent {_received = Nothing, _expected = Just EventStreamStart}
```
</td><td>
```
null
```
</td><td>
```
hash- or arrayref expected (not a simple scalar, use allow_nonref to allow this) at ./yaml2json.pl line 11.

```
</td>
</tr>
<tr>
<td>
```
<<
```
</td><td>
```
"\u003c\u003c"
```
</td><td>
:x:
```
ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'
  in "<stdin>", line 1, column 1
```
</td><td>
```
YAML Error: Expected separator '---'
   Code: YAML_PARSE_ERR_NO_SEPARATOR
   Line: 1
   Document: 2
 at /usr/share/perl5/YAML/Loader.pm line 80.

```
</td>
</tr>
<tr>
<td>
```
"<<"
```
</td><td>
```
"\u003c\u003c"
```
</td><td>
```
"<<"
```
</td><td>
```
YAML Error: Expected separator '---'
   Code: YAML_PARSE_ERR_NO_SEPARATOR
   Line: 1
   Document: 2
 at /usr/share/perl5/YAML/Loader.pm line 80.

```
</td>
</tr>
<tr>
<td>
```
<<: {}
```
</td><td>
```
{}
```
</td><td>
```
{}
```
</td><td>
```
{"<<":{}}
```
</td>
</tr>
<tr>
<td>
```
- <<: {}
```
</td><td>
```
[{}]
```
</td><td>
```
[{}]
```
</td><td>
```
["<<: {}"]
```
</td>
</tr>
<tr>
<td>
```
"<<": {}
```
</td><td>
```
{}
```
</td><td>
```
{"<<": {}}
```
</td><td>
```
{"<<":{}}
```
</td>
</tr>
<tr>
<td>
```
<<: a
```
</td><td>
```
{"\u003c\u003c":"a"}
```
</td><td>
:x:
```
ConstructorError: while constructing a mapping
  in "<stdin>", line 1, column 1
expected a mapping or list of mappings for merging, but found scalar
  in "<stdin>", line 1, column 5
```
</td><td>
```
{"<<":"a"}
```
</td>
</tr>
<tr>
<td>
```
- 1_000_000
```
</td><td>
```
["1_000_000"]
```
</td><td>
```
[1000000]
```
</td><td>
```
["1_000_000"]
```
</td>
</tr>
<tr>
<td>
```
- 8
- 08
```
</td><td>
```
[8,8]
```
</td><td>
```
[8, "08"]
```
</td><td>
```
["8","08"]
```
</td>
</tr>
</table>
