---
title: How To Run IE on Your Mac with Virtualbox
layout: post

notes:
    - date: 09 Sep 2009
      text: Microsoft has
            <a href="/2009/09/09/ie-vpc-images-now-with-wga.html">added <abbr
            title="Windows Genuine Advantage">WGA</abbr></a> to their IE App
            Compat images, making them more difficult to use in VirtualBox.
            
    - date: 15 Oct 2011
      text: To this day, I still use some of the original VM images I created
            using this technique.
---

Recently at work I've switched from Parallels to
[VirtualBox](http://www.virtualbox.org/) for my virtualization needs.
VirtualBox has come a long way recently, and I'm very pleased with its
performance and ease of use. Parallels was starting to become noticeably slow,
and was generally not working well for me anymore.

At first, I tried to convert my Parallels `.hdd` images to VM Ware `.vmdk`
format, which is natively supported in VirtualBox. Virtual PC `.vhd` format
is also natively supported. Since my Parallels images are fully licensed
versions of Windows XP, I didn't want them to go to waste. Sadly, the
converted images were corrupt and  weren't recognized by VirtualBox, and I
ended up wasting several hours.

I decided to ignore Parallels completely and simply use the free Internet
Explorer Application Compatibility VPC Images from Microsoft. I should have
done this in the first place, because setting them up was a breeze with the
help of the internet and a few helpful how-to articles I found. I could link
to those how-to's here but instead I wanted to post my own condensed version
of the steps I took setting everything up. Mainly for myself for future
reference.

### Step 1

Download and install [VirtualBox](http://www.virtualbox.org/wiki/Downloads)
and [Stuffit Expander][1]. You can skip Stuffit Expander if you already have a
tool for opening self-extracting `.exe` files.

### Step 2

Download the free Windows XP [IE App Compat VPC images][2] that you'll need
and extract the `.vhd` images with Stuffit Expander (or your tool of choice).

Using Finder, navigate to `/Library/VirtualBox` and create a new folder for
each image. Move the extracted `.vhd` files into these new folders.

### Step 3

In Terminal, run the following for each image:

{% highlight text %}
$ cd /Library/VirtualBox/<image>
$ VBoxManage internalcommands sethduuid <image>.vhd
{% endhighlight %}

This undocumented command will avoid UUID conflicts when creating multiple
VMs. If you're only setting up one VM, you can skip this.

### Step 4

In VirtualBox, create a new Windows XP VM and follow the prompts. When asked,
choose _Use existing hard disk._ Click the folder icon to open the Virtual
Media Manager. Click _Add_ and navigate to  a `.vhd` file you extracted and
relocated in step 2. Click _Select_ to choose the new virtual disk. Finally,
click _Next_ then _Finish_.

### Step 5

Start your new VM. Close/cancel any Windows popups or dialogs that appear.
There will be quite a few.

From the VirtualBox VM menu bar in OS X select _Devices > Install Guest
Additions..._ and follow the Windows prompts. Reboot Windows when asked.

### Step 6

Now it's time to install the network drivers. Why this isn't covered by the
VirtualBox Guest Additions is beyond me.

In Windows go to _Start > Run..._ and run the following:

{% highlight text %}
D:\VBoxWindowsAdditions-x86.exe /extract /D=C:\Drivers
{% endhighlight %}

Back to _Start > Run..._ and run:

{% highlight text %}
devmgmt.msc
{% endhighlight %}

In Device Manager, find _Network adapters > Ethernet controller_. Right click
it, and select _Update Driver..._.

In the Hardware Update Wizard choose _No, not this time_ and click _Next_.
Select _Install from a list or specific location_ and click _Next_. Check the
option _Include this location in the search_ and paste the following into the
Location box:

{% highlight text %}
C:\Drivers\x86\Network\AMD
{% endhighlight %}

Alternatively, you can choose _Don't search ..._ and navigate to the location
manually. Click _Finish_ and you should have a working network connection.

### Step 7

In Device Manager, find _Batteries > Unknown device_. In my case, there were
two. Right click each and select _Disable_ and confirm. These appear to be
VirtualPC specific. In any case, they aren't really necessary anyway.

Next find _Universal Serial Bus controllers > Universal Serial Bus (USB)
Controller_. Again, there were two. Disable them as well.

Finally, find _Sound, video and game controllers > Multimedia Audio
Controller_ and disable it.

### Additional VMs

Repeat steps 4-7 to set up additional VMs, and enjoy your new VirtualBox
goodness.

[1]: http://www.stuffit.com/mac-expander.html
[2]: http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=11575
