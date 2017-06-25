---
title: OS X, tar and Resource Forks
layout: post

notes:
    - date: 15 October 2011
      text: Edited for clarity.
---

In preparing releases of [Jabber::Bot][1], I had my first experience using tar
in OS X to produce a tarball; I had previously only been a consumer of
tarballs in OS X.

Using OS X on the command line means dealing with [resource forks][2].
Especially when doing things like copying or archiving files for public
distribution. Most heavy OS X users are familiar with [.DS_Store][3] files.
They are a nuisance, but generally can be dealt with without much fuss.
Resource forks, on the other hand, can sometimes be tricky.

Resource forks serve no purpose to anyone but you or another OS X user, who
likely doesn't really care anyway. In order to create a public tarball, it's a
good idea to exclude resource forks since they are unnecessary. But, tar on
OS X (Tiger) likely won't exclude them, even if you specify an exclude pattern
like `--exclude='._*'`.

After a bit of tinkering, I found a solution:

```sh
$ export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
```

Then run tar and resource forks will be excluded.

[1]: https://github.com/brettstimmerman/jabber-bot/
[2]: http://en.wikipedia.org/wiki/Resource_fork
[3]: http://en.wikipedia.org/wiki/DS_Store
