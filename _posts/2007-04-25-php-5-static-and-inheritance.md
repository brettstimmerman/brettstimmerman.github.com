---
title: PHP 5, Static and Inheritance
layout: post

notes:
    - date: 06 July 2009
      text: PHP 5.3.0, released last week, includes support for
            <a href="http://php.net/manual/en/language.oop5.late-static-bindings.php">
            late static binding</a>.
---

The object oriented features of PHP 5 are leaps and bounds more complete than
PHP 4. In fact, PHP 5 could almost pass for a true object oriented language in
many ways: visibility, overloading, reflection, etc. Yet there are quite a few
holes in its implementation that can make it painful to work with compared to
similar languages. One well-known issue is that parent constructors are not
implicitly called in derived classes; you must explicitly call
`parent::__construct()`.

I recently stumbled into a similar hole in PHP 5's OO implementation: class
methods and members declared as `static` do not behave as one might expect
with respect to inheritance. Given a base class, `Animal`, and two derived
classes, `Dog` and `Cat`, let's assume that all Animals have a color and that
it defaults to black.

{% highlight php %}
<?php
class Animal
{
  protected static $color = 'Black';

  public static function getColor()
  {
    return self::$color;
  }
}

class Cat extends Animal
{
  protected static $color = 'Brown';
}

class Dog extends Animal
{
  protected static $color = 'Grey';
}
?>
{% endhighlight %}

Nice and simple, short and sweet. Animal has a color that defaults to black,
and we've extended Animal with a Cat that defaults to brown and a Dog that
defaults to grey. All fine and good. That is, until I want to ask the Dog or
Cat classes what their default colors are.

{% highlight php %}
<?php
echo Animal::getColor(); // Black
echo Dog::getColor();    // Black (huh?)
echo Cat::getColor();    // Black (what?)
?>
{% endhighlight %}

It turns out that static methods are called within the scope of the class
where the method is defined. In this case, `Animal`. So, even though `Dog` and
`Cat` both inherit the static method `getColor()`, its scope is bound to
`Animal`.

The missing language feature that I want is called _late static binding_. The
PHP Manual attempts to explain how things currently work.

> ... static method calls are resolved at compile time. When using an explicit
> class name the method is already identified completely and no inheritance
> rules apply. If the call is done by self then self is translated to the
> current class, that is the class the code belongs to. Here also no
> inheritance rules apply.

This issue has been a pain point for me lately, and I've resorted to some
horrendous and clumsy workarounds to mimic the expected behavior. Until now
there has been very little standing in my way of accomplishing most anything
with PHP with relative ease. This is by far one of the most annoying dealings
I've had with PHP in over 8 years.
