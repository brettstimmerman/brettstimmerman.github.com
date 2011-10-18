---
title: User Preferences are a Huge Pain
layout: post

notes:
    - date: 15 Oct 2011
      text: Edited for clarity and tone.
---

Recently while working on a project at work, I realized that one of the most
frustrating aspects of software development is also one of the most mundane:
user preferences. Building out the main application is tremendously rewarding,
but providing users with preferences is a huge pain.

Most applications provide some way for a user to modify how the application
behaves at run time. In fact, users expect some level of control over the
application's behavior. As a user, I like having such options, even options I
know I won't need right away but might like to use in the future. But users
&mdash; myself included until recently &mdash; don't realize that, as a
developer, providing users with options is much easier said than done.

First, the preferences need a place to live. As developer, I need a way to
retrieve preferences from somewhere and store them back again. This storage
system could be a text file of key-value pairs, more complex XML data, an
OS-provided data store (e.g. Windows registry), a relational database, or
umpteen other possibilities. Choosing the proper way to handle the storage of
user preferences depends on the size of the project, but is by no means a
simple matter. Simple applications with many simple options can quickly
outgrow a simple storage system.

Once I've decided on a storage system and implemented an API for manipulating
it, it's time to give the user a UI to view and modify the current
configuration. There are no standard conventions for creating preferences UIs.
Because the preferences for a unique application are, well, unique, there
isn't one, generalized UI that has already been built that can easily be
reused.

During the development of a project that requires modest user preferences, I
had an epiphany.

> A user preferences UI and storage system is a complete project in and of
> itself, with a purpose entirely separate from that of the application to
> which it provides configuration abilities.

First and foremost, the preferences UI has to make sense. The user has to be
able to quickly find where a setting can be changed. If the preferences UI is
too convoluted the application becomes difficult to configure, and the overall
experience using the application can be adversely affected. I would advise
against letting a strictly developer-type build your preferences UI. This is
something that a user will use from time to time. It needn't be pretty, but it
must be easy to use. This is a task best left to information architects and
designers, and it should not be an afterthought.

Once I've sufficiently sketched a preferences UI (or reviewed a designer's
sketches) and feel I'm confident I understand how it will work, I must now
translate thoughts and drawings into code. This is perhaps the most time
consuming step in the process. The preferences system I create must present a
simple UI to the user and also be easily maintained by the developer when
requirements change.

Designing the UI itself isn't terribly difficult, but because preferences
often use a myriad of UI controls such as text fields, select lists, drop
downs, and check boxes, the logic behind each control must be fleshed out and
properly bound to the storage system.  to avoid configuration errors, controls
often have unique validation requirements. Creating this _controller_ layer
of the user preferences system is the most tedious and time consuming, and is
very often the least rewarding, since it's development time not spent directly
on the core of the main application.

After the UI is designed and created, and the controls are bound to the
storage system, and all input is properly validated, and modification are
persisted, and the main application responds to the changes &mdash; only then
is my job complete. I've just spent a few hours, likely days, and potentially
weeks allowing Joe User to change his text color from Medium Quasar Blue to
Metallic Pearl Shine. And because my application is not a Medium Quasar Blue
to Metallic Pearl Shine font color changerator, I've just spent many hours on
code that does not help accomplish my application's main goals.

At this point, my user is happy with their new font color, and if I happen to
work on another application that needs a Medium Quasar Blue to Metallic Pearl
Shine font color changerator, I've already got some code to work with.
However, I'll still need to decide upon the proper preference storage system,
create a unique UI and write the tedious controller logic fluff. There's got
to be a better way.
