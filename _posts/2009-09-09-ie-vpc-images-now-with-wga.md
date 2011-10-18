---
title: IE VPC Images Now with WGA
layout: post
---

Just when I was on a virtualization roll [using VirtualBox for testing IE on
my Mac][1], Microsoft stopped me dead in my tracks. The latest version of
[Internet Explorer Application Compatibility VPC Images][2] now have the
anti-piracy features of Windows Genuine Advantage enabled.

The hardware signature detected when a VPC image first boots in a non-VPC host
is different from the signature present when the image was first created,
presumably in VPC. This difference triggers WGA's re-activation requirement to
make sure you're not a dirty pirate. Of course you're not a dirty pirate, but
if you wish to  re-activate Windows you're going to need the original Windows
Product Key which isn't provided with the VPC images. Microsoft has
effectively blocked end users from hosting the VPC images with anything but
Virtual PC.

To their credit, Microsoft has done a great thing by providing these VPC
images free of charge, and it makes sense they would use their own virtual
disk format for distribution. But it doesn't make sense for them to deny
non-Windows (thus, non-VPC users) the ability to use the images.

One of the largest complaints I hear from web developers who work in a
non-Windows environment is the difficulty of testing in IE. Until recently,
VirtualBox was working quite nicely for me in this regard. Microsoft would be
doing another great thing by loosening the reigns a bit. Alternatively, they
could release Virtual PC for other operating systems.

[1]: /2009/08/11/how-to-run-ie-on-your-mac-with-virtualbox.html
[2]: http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=11575
