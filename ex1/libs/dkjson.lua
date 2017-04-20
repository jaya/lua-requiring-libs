<!DOCTYPE html>
<html>
<head>
<base href="http://dkolf.de/src/dkjson-lua.fsl/home?name=dkjson" />
<title>dkjson - dkjson</title>
<link rel="alternate" type="application/rss+xml" title="RSS Feed"
      href="/src/dkjson-lua.fsl/timeline.rss" />
<link rel="stylesheet" href="/src/dkjson-lua.fsl/style.css?default" type="text/css"
      media="screen" />
</head>
<body>
  <h1>dkjson &mdash; dkjson</h1>
<div class="mainmenu">
<a href='/'>dkolf.de</a>
<a href='/src/dkjson-lua.fsl/home'>dkjson</a>
<a href='/src/dkjson-lua.fsl/timeline'>Timeline</a>
<a href='/src/dkjson-lua.fsl/brlist'>Branches</a>
<a href='/src/dkjson-lua.fsl/taglist'>Tags</a>
<a href='/src/dkjson-lua.fsl/wiki'>Wiki</a>
<a href='/src/dkjson-lua.fsl/login'>Login</a>
</div>
<div class="content">
<script>
function gebi(x){
if(/^#/.test(x)) x = x.substr(1);
var e = document.getElementById(x);
if(!e) throw new Error("Expecting element with ID "+x);
else return e;}
</script>
<h1>JSON Module for Lua</h1>

<h2>Introduction</h2>

<p>This is a JSON module written in <a href="http://www.lua.org/">Lua</a>. It supports UTF-8.

<p><a href="http://www.json.org/">JSON (JavaScript Object Notation)</a> is a format for serializing data based on the syntax for JavaScript data structures.  It is an ideal format for transmitting data between different applications and commonly used for dynamic web pages.  It can also be used to save Lua data structures, but you should be aware that not every Lua table can be represented by the JSON standard.  For example tables that contain both string keys and an array part cannot be exactly represented by JSON.  You can solve this by putting your array data in an explicit subtable.

<p>dkjson is written in Lua without any dependencies, but
when <a href="http://www.inf.puc-rio.br/~roberto/lpeg/">LPeg</a> is available dkjson uses it to speed up decoding.

<h2>Download</h2>
<ul><li><a href="./raw/dkjson.lua?name=16cbc26080996d9da827df42cb0844a25518eeb3">dkjson.lua</a></li></ul>

<h2>Usage</h2>

<p>The full <a href="/src/dkjson-lua.fsl/wiki?name=Documentation">documentation including the license</a> is available here in the wiki or as Markdown text in the readme.txt file.

<p>dkjson is free software released under the same conditions as the Lua interpreter.  Please remember to mention external code you are using in your software.

<h2>Examples</h2>

<h3>Encoding</h3>

<pre><code>
<span class="luakeyword">local</span> json = <span class="lualibrary">require</span> (<span class="luastring">"dkjson"</span>)

<span class="luakeyword">local</span> tbl = {
  animals = { <span class="luastring">"dog"</span>, <span class="luastring">"cat"</span>, <span class="luastring">"aardvark"</span> },
  instruments = { <span class="luastring">"violin"</span>, <span class="luastring">"trombone"</span>, <span class="luastring">"theremin"</span> },
  bugs = json.null,
  trees = <span class="luakeyword">nil</span>
}

<span class="luakeyword">local</span> str = json.encode (tbl, { indent = <span class="luakeyword">true</span> })

<span class="lualibrary">print</span> (str)
</code></pre>

<h4>Output</h4>

<pre><code>
{
  "bugs":null,
  "instruments":["violin","trombone","theremin"],
  "animals":["dog","cat","aardvark"]
}
</code></pre>

<h3>Decoding</h3>

<pre><code>
<span class="luakeyword">local</span> json = <span class="lualibrary">require</span> (<span class="luastring">"dkjson"</span>)

<span class="luakeyword">local</span> str = <span class="luastring">[[
{
  "numbers": [ 2, 3, -20.23e+2, -4 ],
  "currency": "\u20AC"
}
]]</span>

<span class="luakeyword">local</span> obj, pos, err = json.decode (str, 1, <span class="luakeyword">nil</span>)
<span class="luakeyword">if</span> err <span class="luakeyword">then</span>
  <span class="lualibrary">print</span> (<span class="luastring">"Error:"</span>, err)
<span class="luakeyword">else</span>
  <span class="lualibrary">print</span> (<span class="luastring">"currency"</span>, obj.currency)
  <span class="luakeyword">for</span> i = 1,#obj.numbers <span class="luakeyword">do</span>
    <span class="lualibrary">print</span> (i, obj.numbers[i])
  <span class="luakeyword">end</span>
<span class="luakeyword">end</span>

</code></pre>

<h4>Output</h4>

<pre>
currency	€
1	2
2	3
3	-2023
4	-4
</pre>

<h2>Versions</h2>

<h3>Version 2.5 (2014-04-28)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=16cbc26080996d9da827df42cb0844a25518eeb3">dkjson.lua version 2.5</a>
</li><li>Read the <a href="./raw/readme.txt?name=8bb9c56a6f08adbfca24d4b7f06d66914914520f">documentation</a></li></ul>

<p>Changes since version 2.4:

<ul><li>Added customizable exception handling.
</li><li>Decode input that contains JavaScript comments.</li></ul>

<h3>Version 2.4 (2013-09-28)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=0b725e9e99117b71a1f62e921c98bf3327ac8809">dkjson.lua version 2.4</a></li></ul>

<p>Changes since version 2.3:

<ul><li>Fixed encoding and decoding of numbers in different numeric locales.
</li><li>Prevent using version 0.11 of LPeg (causes segmentation faults on
     some systems).</li></ul>

<h3>Version 1.3 (2013-09-28)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=142fe16d14a71a477eee9822133e2d61eaf35443">dkjson.lua version 1.3</a></li></ul>

<p>Changes since version 1.2:

<ul><li>Fixed encoding and decoding of numbers in different numeric locales.</li></ul>

<h3>Version 2.3 (2013-04-14)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=1a7969ae3ff9a6e0268e6555d31092213060fd62">dkjson.lua version 2.3</a></li></ul>

<p>Changes since version 2.2:

<ul><li>Corrected the range of escaped characters.  Among other characters
     U+2029 was missing, which would cause trouble when <a href="http://timelessrepo.com/json-isnt-a-javascript-subset">parsed by a
     JavaScript interpreter.</a>
</li><li>Added options to register the module table in a global variable.
     This is useful in environments where functions similar to require are
     not available.</li></ul>

<h3>Version 1.2 (2013-04-14)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=4a05ad81d10e8cd5c27f7eb985717fefb26f8044">dkjson.lua version 1.2</a></li></ul>

<p>Changes since version 1.1:

<ul><li>Corrected the range of escaped characters.  Among other characters
     U+2029 was missing, which would cause trouble when parsed by a
     JavaScript interpreter.
</li><li>Locations for error messages were off by one in the first line.</li></ul>

<h3>Version 2.2 (2012-04-28)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=2e0832b4027614d5d5c708a971d4f1c6ec04affb">dkjson.lua version 2.2</a></li></ul>

<p>Changes since version 2.1:

<ul><li>__jsontype is only used for empty tables.
</li><li>It is possible to decode tables without assigning metatables.
</li><li>Locations for error messages were off by one in the first line.
</li><li>There is no LPeg version of json.quotestring anymore.</li></ul>

<h3>Version 2.1 (2011-07-08)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=6bb6b9b6a57c0013caaf74a0be212c20ce6cf689">dkjson.lua version 2.1</a></li></ul>

<p>Changes since version 2.0:

<ul><li>Changed the documentation to Markdown format.
</li><li>LPeg is now parsing only a single value at a time to avoid running
     out of Lua stack for big arrays and objects.
</li><li>Read __tojson, __jsontype and __jsonorder even from blocked metatables
     through the debug module.
</li><li>Fixed decoding single numbers (only affected the non-LPeg mode).
</li><li>Corrected the range of escaped Unicode control characters.</li></ul>

<h3>Version 1.1 (2011-07-08)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=32a53e69326ac6231c942f0175700cb119ac8108">dkjson.lua version 1.1</a></li></ul>

<p>Changes since version 1.0:

<ul><li>The values NaN/+Inf/-Inf are recognised and encoded as "null" like in
     the original JavaScript implementation.
</li><li>Read __tojson even from blocked metatables through the debug module.
</li><li>Fixed decoding single numbers.
</li><li>Corrected the range of escaped Unicode control characters.</li></ul>

<h3>Version 2.0 (2011-05-30)</h3>

<ul><li>Download <a href="./raw/dkjson.lua?name=35630290e43b332a84fb3a5504765ef6db8b7c49">dkjson.lua version 2.0</a></li></ul>

<p>Changes since version 1.0:

<ul><li>Optional LPeg support.
</li><li>Invalid input data for encoding raises errors instead of returning nil
     and the error message. (Invalid data for encoding is usually a
     programming error. Raising an error removes the work of explicitly
     checking the result).
</li><li>The metatable field __jsontype can control whether a Lua table is
     encoded as a JSON array or object. (Mainly useful for empty tables).
</li><li>When decoding, two metatables are created. One is used to mark the arrays
     while the other one is used for the objects. (The metatables are
     created once for each decoding operation to make sandboxing possible.
     However, you can specify your own metatables as arguments).
</li><li>There are no spaces added any longer when encoding.
</li><li>It is possible to explicitly sort keys for encoding by providing an array with key
     names to the option "keyorder" or the metatable field __jsonorder.
</li><li>The values NaN/+Inf/-Inf are recognised and encoded as "null" like in
     the original JavaScript implementation.</li></ul>

<h3>Version 1.0 (2010-08-28)</h3>

<p>Initial version.

<ul><li>Download <a href="./raw/dkjson.lua?name=718e2b58667c2ef544fed4e28fc474267e260cb1">dkjson.lua version 1.0</a>
</li></ul>
</div>
<div class="footer">
  <a href="./">dkolf.de</a>
  <a href="/contact">contact</a>
  (This page was generated by <a class="extlink" href="http://www.fossil-scm.org/">Fossil</a>.)
</div>
</body></html>
