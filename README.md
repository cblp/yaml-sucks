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
<pre><code>- null
- false
- n
- off
</code></pre></td><td>
<pre><code>[null,false,false,false]
</code></pre></td><td>
<pre><code>[null, false, "n", false]
</code></pre></td><td>
<pre><code>["null","false","n","off"]
</code></pre></td>
</tr>
<tr>
<td>
<pre><code></code></pre></td><td>
:x:
<pre><code>UnexpectedEvent {_received = Nothing, _expected = Just EventStreamStart}
</code></pre></td><td>
<pre><code>null
</code></pre></td><td>
<pre><code>hash- or arrayref expected (not a simple scalar, use allow_nonref to allow this) at ./yaml2json.pl line 11.

</code></pre></td>
</tr>
<tr>
<td>
<pre><code><<
</code></pre></td><td>
<pre><code>"\u003c\u003c"
</code></pre></td><td>
:x:
<pre><code>ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'
  in "<stdin>", line 1, column 1
</code></pre></td><td>
<pre><code>YAML Error: Expected separator '---'
   Code: YAML_PARSE_ERR_NO_SEPARATOR
   Line: 1
   Document: 2
 at /usr/share/perl5/YAML/Loader.pm line 80.

</code></pre></td>
</tr>
<tr>
<td>
<pre><code>"<<"
</code></pre></td><td>
<pre><code>"\u003c\u003c"
</code></pre></td><td>
<pre><code>"<<"
</code></pre></td><td>
<pre><code>YAML Error: Expected separator '---'
   Code: YAML_PARSE_ERR_NO_SEPARATOR
   Line: 1
   Document: 2
 at /usr/share/perl5/YAML/Loader.pm line 80.

</code></pre></td>
</tr>
<tr>
<td>
<pre><code><<: {}
</code></pre></td><td>
<pre><code>{}
</code></pre></td><td>
<pre><code>{}
</code></pre></td><td>
<pre><code>{"<<":{}}
</code></pre></td>
</tr>
<tr>
<td>
<pre><code>- <<: {}
</code></pre></td><td>
<pre><code>[{}]
</code></pre></td><td>
<pre><code>[{}]
</code></pre></td><td>
<pre><code>["<<: {}"]
</code></pre></td>
</tr>
<tr>
<td>
<pre><code>"<<": {}
</code></pre></td><td>
<pre><code>{}
</code></pre></td><td>
<pre><code>{"<<": {}}
</code></pre></td><td>
<pre><code>{"<<":{}}
</code></pre></td>
</tr>
<tr>
<td>
<pre><code><<: a
</code></pre></td><td>
<pre><code>{"\u003c\u003c":"a"}
</code></pre></td><td>
:x:
<pre><code>ConstructorError: while constructing a mapping
  in "<stdin>", line 1, column 1
expected a mapping or list of mappings for merging, but found scalar
  in "<stdin>", line 1, column 5
</code></pre></td><td>
<pre><code>{"<<":"a"}
</code></pre></td>
</tr>
<tr>
<td>
<pre><code>- 1_000_000
</code></pre></td><td>
<pre><code>["1_000_000"]
</code></pre></td><td>
<pre><code>[1000000]
</code></pre></td><td>
<pre><code>["1_000_000"]
</code></pre></td>
</tr>
<tr>
<td>
<pre><code>- 8
- 08
</code></pre></td><td>
<pre><code>[8,8]
</code></pre></td><td>
<pre><code>[8, "08"]
</code></pre></td><td>
<pre><code>["8","08"]
</code></pre></td>
</tr>
</table>
