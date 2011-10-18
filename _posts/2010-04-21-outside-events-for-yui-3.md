---
title: Outside Events for YUI 3
layout: post

notes:
    - date: 18 August 2011
      text: Beginning with YUI 3.4.0, outside events are officially supported
            via the <a href="http://yuilibrary.com/yui/docs/event/outside.html">
            event-outside</a> module.
---

[Outside Events][1] is a spankin' new YUI 3 Gallery module that allows
elements to subscribe to DOM events that occur outside of them. An event
occurs outside the subscriber if the target it is not the subscriber itself,
or any of the subscriber's ancestors. Many common outside events are
pre-defined and ready to use, and defining new outside events is a cinch.

Outside Events is tiny weighing in at 475 bytes minified and gzipped. It's
also hosted on the same CDN as YUI 3, so including it in your projects is
simple and fast.

{% highlight javascript %}
YUI({
    // Last Gallery Build of this module
    gallery: 'gallery-2010.04.21-21-51'
}).use('gallery-outside-events', function(Y) {
    // Outside events are ready to go!
});
{% endhighlight %}

Subscribe to outside events just like any other DOM event. Here is the
pre-defined `clickoutside` event in action.

{% highlight javascript %}
Y.one('#dialog').on('clickoutside', function (e) {
    this.addClass('hidden');
});
{% endhighlight %}

Let's say you've defined a sweet new `swipe` event with the YUI 3
[Synthetic DOM Event API][2]. Defining `swipeoutside` is easy.

{% highlight javascript %}
Y.Event.defineOutside('swipe');
{% endhighlight %}

New outside events are named `<event>outside` by default. You can
optionally give new outside events a custom name.

{% highlight javascript %}
Y.Event.defineOutside('swipe', 'outerswipe');
Y.one('#foo').on('outerswipe', ... );
{% endhighlight %}

Outside event handlers receive the originating DOM event object as an
argument.

{% highlight javascript %}
Y.one('#foo').on('keyupoutside', function (e) {
    var tag  = e.target.get('tagName'),
        text = 'A keyup event occured on a ' + tag + ' element ' +
            'outside of #foo';

    alert(text);
});
{% endhighlight %}

To learn more about Outside Events and view the list of pre-defined outside
events, have a look at the [YUI Library page][1] and the [README][3], which
goes into detail about a few general caveats and specific known issues with IE
6, 7 and 8 you should be aware of.

[1]: http://yuilibrary.com/gallery/show/outside-events
[2]: http://yuilibrary.com/yui/docs/event/#synthetic-events
[3]: http://github.com/brettstimmerman/outside-events/blob/master/README.md
