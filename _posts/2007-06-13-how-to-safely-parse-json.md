---
title: How To Safely Parse JSON
layout: post

notes:
   - date: 15 October 2011
     text: Updated this post to reflect native JSON support and JSON-js.
---

Over the past few weeks I've witnessed several discussions about how to safely
parse JSON in JavaScript. Most of these conversations hinge upon something
like "because `eval` is simply not enough." And they are right.

So how do you safely parse JSON in JavaScript? Luckily for us, most browsers
today have native JSON support. For older browsers, [Douglas Crockford][1]
created a polyfill called [JSON-js][2].

Here's a simple example of using the native or JSON-js `JSON` object:

{% highlight javascript %}
var obj1 = { "foo": 42 };

// Create a JSON string from an object.
var str = JSON.stringify(obj1);

// Parse the JSON string into a new object.
var obj2 = JSON.parse(str);
{% endhighlight %}

[1]: http://crockford.com/
[2]: https://github.com/douglascrockford/JSON-js
