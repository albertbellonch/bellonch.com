---
layout: post
title: Mounting a Time Capsule in UNIX
description:
  A quick tip on how to mount a Time Capsule in UNIX
date: 2015-10-26 00:05
categories: tech
---

#### Have you ever thought about how to mount a Time Capsule in a UNIX system? Here's the answer.

Lately I have been playing with my old Raspberry Pi from 2012, resurrecting [an old project I had started some years ago](https://github.com/albertbellonch/walter-bishop){:target="_blank"}. After a few days of development in my MacBook, the next step was deploying it into that little computer, running the latest Raspbian available as of now: [Jessie](https://www.raspberrypi.org/downloads/raspbian/){:target="_blank"}.

One of the things I needed to be working was a straightforward access to my NAS, an Apple Time Capsule from 2009 that has been doing has job steadily ever since I bought it. I investigated about that and, after some research, [I found the answer](http://raspberrypi.stackexchange.com/questions/8386/how-to-mount-time-capsule-from-raspberry-pi){:target="_blank"}.

The more convenient solution was to add my Time Capsule to the **fstab**, the file systems table, which basically enumerates all available disks and disk partitions to the operating system. The nice thing about it is that it gets executed when booting, so your only work is writing the way to access the disk once, in the **/etc/fstab** file.

Thus, the only needed thing for a Time Capsule is adding this line (careful, horizontal scroll!):

{% highlight bash %}
//TIMECAPSULE_IP/TIMECAPSULE_NAME /mnt/timecapsule cifs pass=PASSWORD,rw,sec=ntlm,uid=1000,iocharset=utf8 0 0
{% endhighlight %}

where **TIMECAPSULE_IP** is its IP, **TIMECAPSULE_NAME** is the name of the volume, and **PASSWORD** is the public password to access it. Note that if your volume name includes spaces, you'd have to replace them for **\040**. In my case, I had to type:

{% highlight bash %}
//192.168.1.128/Time\040Capsule\040de\040Albert\040Bell /mnt/timecapsule cifs pass=******,rw,sec=ntlm,uid=1000,iocharset=utf8 0 0
{% endhighlight %}

Be careful to set the appropriate value to the **uid**, which establishes the user inside the operating system that will have access to it. If you want to know it for a specific user, just do:

{% highlight bash %}
id -u USERNAME
{% endhighlight %}

Finally, for testing purposes and in order to mount it in a specific moment in time (and not just when booting) you can do:

{% highlight bash %}
mount -a
{% endhighlight %}

That's it. I hope it's of use for you!
