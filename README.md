# YAML sucks.

YAML specification is so ambigous,
that you can't be sure if tomorrow you will parse the same data from YAML file
as you have yesterday.

Let's see how different implementations parse YAML code.
Settings are default or near to default or typical for that language.
We use JSON to represent data the uniform way.
<table>
<tr>
<th>YAML source</th>
<th>yaml2json.hs</th>
<th>yaml2json.pl</th>
<th>yaml2json.py</th>
<th>yaml2json.rb</th>
<th>rq</th>
</tr>
<tr>
<td>
<pre><code class=''>- false
- n
- off
</code></pre>
</td><td>
<pre><code class='haskell'>[false,false,false]
</code></pre>
</td><td>
<pre><code class='perl'>["","n","off"]
</code></pre>
</td><td>
<pre><code class='python'>[false, "n", false]
</code></pre>
</td><td>
<pre><code class='ruby'>[false,"n",false]
</code></pre>
</td><td>
<pre><code class=''>[false,"n","off"]
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>- 0:00
- 01:00
- 12:34
</code></pre>
</td><td>
<pre><code class='haskell'>["0:00","01:00","12:34"]
</code></pre>
</td><td>
<pre><code class='perl'>["0:00","01:00","12:34"]
</code></pre>
</td><td>
<pre><code class='python'>["0:00", "01:00", 754]
</code></pre>
</td><td>
<pre><code class='ruby'>[0,3600,45240]
</code></pre>
</td><td>
<pre><code class=''>["0:00","01:00","12:34"]
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''></code></pre>
</td><td>
<pre><code class='haskell'>null
</code></pre>
</td><td>
<pre><code class='perl'>null
</code></pre>
</td><td>
<pre><code class='python'>null
</code></pre>
</td><td>
<pre><code class='ruby'>false
</code></pre>
</td><td>
:x:
[ERROR] [rq] Encountered: EOF while parsing a value
[ERROR] [rq] (Re-run with --trace or RUST_BACKTRACE=1 for a backtrace)
</td>
</tr>
<tr>
<td>
<pre><code class=''>- -.inf
- .NaN
</code></pre>
</td><td>
<pre><code class='haskell'>["-.inf",".NaN"]
</code></pre>
</td><td>
<pre><code class='perl'>["-.inf",".NaN"]
</code></pre>
</td><td>
<pre><code class='python'>[-Infinity, NaN]
</code></pre>
</td><td>
<pre><code class='ruby'>[-Infinity,NaN]
</code></pre>
</td><td>
<pre><code class=''>["-.inf",".NaN"]
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>- 1.23015e+3
- 12.3015e+02
- 1230.15
</code></pre>
</td><td>
<pre><code class='haskell'>[1230.15,1230.15,1230.15]
</code></pre>
</td><td>
<pre><code class='perl'>["1.23015e+3","12.3015e+02","1230.15"]
</code></pre>
</td><td>
<pre><code class='python'>[1230.15, 1230.15, 1230.15]
</code></pre>
</td><td>
<pre><code class='ruby'>[1230.15,1230.15,1230.15]
</code></pre>
</td><td>
<pre><code class=''>[1230.15,1230.15,1230.15]
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>0xC
</code></pre>
</td><td>
<pre><code class='haskell'>"0xC"
</code></pre>
</td><td>
<pre><code class='perl'>"0xC"
</code></pre>
</td><td>
<pre><code class='python'>12
</code></pre>
</td><td>
<pre><code class='ruby'>12
</code></pre>
</td><td>
<pre><code class=''>12
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''><<
</code></pre>
</td><td>
<pre><code class='haskell'>"<<"
</code></pre>
</td><td>
<pre><code class='perl'>"<<"
</code></pre>
</td><td>
:x:
ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'
  in "<stdin>", line 1, column 1
</td><td>
<pre><code class='ruby'>"<<"
</code></pre>
</td><td>
<pre><code class=''>"<<"
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''><<: {}
</code></pre>
</td><td>
<pre><code class='haskell'>{}
</code></pre>
</td><td>
<pre><code class='perl'>{"<<":{}}
</code></pre>
</td><td>
<pre><code class='python'>{}
</code></pre>
</td><td>
<pre><code class='ruby'>{}
</code></pre>
</td><td>
<pre><code class=''>{"<<":{}}
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>"<<": {}
</code></pre>
</td><td>
<pre><code class='haskell'>{}
</code></pre>
</td><td>
<pre><code class='perl'>{"<<":{}}
</code></pre>
</td><td>
<pre><code class='python'>{"<<": {}}
</code></pre>
</td><td>
<pre><code class='ruby'>{}
</code></pre>
</td><td>
<pre><code class=''>{"<<":{}}
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''><<: a
</code></pre>
</td><td>
<pre><code class='haskell'>{"<<":"a"}
</code></pre>
</td><td>
<pre><code class='perl'>{"<<":"a"}
</code></pre>
</td><td>
:x:
ConstructorError: while constructing a mapping
  in "<stdin>", line 1, column 1
expected a mapping or list of mappings for merging, but found scalar
  in "<stdin>", line 1, column 5
</td><td>
<pre><code class='ruby'>{"<<":"a"}
</code></pre>
</td><td>
<pre><code class=''>{"<<":"a"}
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>a: &alias
    k1: v1
    k2: v2

b:
    <<: *alias
    k1: override
    k3: v3

</code></pre>
</td><td>
<pre><code class='haskell'>{"a":{"k2":"v2","k1":"v1"},"b":{"k3":"v3","k2":"v2","k1":"override"}}
</code></pre>
</td><td>
<pre><code class='perl'>{"a":{"k2":"v2","k1":"v1"},"b":{"k3":"v3","k1":"override","<<":{"k2":"v2","k1":"v1"}}}
</code></pre>
</td><td>
<pre><code class='python'>{"a": {"k1": "v1", "k2": "v2"}, "b": {"k1": "override", "k2": "v2", "k3": "v3"}}
</code></pre>
</td><td>
<pre><code class='ruby'>{"a":{"k1":"v1","k2":"v2"},"b":{"k1":"override","k2":"v2","k3":"v3"}}
</code></pre>
</td><td>
<pre><code class=''>{"a":{"k1":"v1","k2":"v2"},"b":{"<<":{"k1":"v1","k2":"v2"},"k1":"override","k3":"v3"}}
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>- 1000
- +1000
- 1_000
</code></pre>
</td><td>
<pre><code class='haskell'>[1000,1000,"1_000"]
</code></pre>
</td><td>
<pre><code class='perl'>["1000","+1000","1_000"]
</code></pre>
</td><td>
<pre><code class='python'>[1000, 1000, 1000]
</code></pre>
</td><td>
<pre><code class='ruby'>[1000,1000,1000]
</code></pre>
</td><td>
<pre><code class=''>[1000,1000,"1_000"]
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>[8, 08, 0o10, 010]
</code></pre>
</td><td>
<pre><code class='haskell'>[8,8,"0o10",10]
</code></pre>
</td><td>
<pre><code class='perl'>["8","08","0o10","010"]
</code></pre>
</td><td>
<pre><code class='python'>[8, "08", "0o10", 8]
</code></pre>
</td><td>
<pre><code class='ruby'>[8,"08","0o10",8]
</code></pre>
</td><td>
<pre><code class=''>[8,8,8,10]
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code class=''>"Sosa did fine.\u263A"
</code></pre>
</td><td>
<pre><code class='haskell'>"Sosa did fine.☺"
</code></pre>
</td><td>
<pre><code class='perl'>"Sosa did fine.☺"
</code></pre>
</td><td>
<pre><code class='python'>"Sosa did fine.\u263a"
</code></pre>
</td><td>
<pre><code class='ruby'>"Sosa did fine.☺"
</code></pre>
</td><td>
<pre><code class=''>"Sosa did fine.☺"
</code></pre>
</td>
</tr>
</table>
