---
layout: post
title: Building my blog and portfolio
description:
  A deep look on how this blog and portfolio is built, by using technologies such as Jekyll and Capistrano. The first techie post!
date: 2015-05-10 22:45
categories: tech
---

#### Some say that the journey is the reward, which is really true for my blog. The journey of building it has been one of my favourite parts of it.

As I explained [in the "hello" series of posts](https://bellonch.com/hello-part-one), I got back to this blogging world lately. I wanted a personal space in which I could talk about several topics, ranging from my own view about some subjects to tech posts of several sorts, as well as explaining some of the things I am doing these days.

With that decided, I had to choose the base technology for the blogging platform. I wanted simplicity, minimalism and focus on content and, technology-wise, something attractive enough. Even something that I could (partially or totally) code myself would be pleasant. For one, doing it all by myself, using a web framework like [Rails](http://rubyonrails.org/){:target="_blank"}, was too much on my opinion. I also knew [Wordpress](https://wordpress.com/){:target="_blank"}, an excellent, versatile tool that I have used several times in the past (like [Quipu's blog](http://getquipu.com/blog/){:target="_blank"}), but that would have easily been an overkill. So I investigated and asked some friends, and I ended up settling with [Jekyll](http://jekyllrb.com/){:target="_blank"}, a simple framework based in Ruby, perfect for static blogs and websites.

Then it was the turn for choosing a template that would give some styling to the platform. I discussed it with my friend [Hayk](http://hihayk.com/){:target="_blank"}, our designer at Quipu and a talented musician, and he kindly offered to do it himself. I had a long conversation with him about what I wanted and whatnot, and he came back with a beautiful, minimal design a couple weeks later. He described it like this:

> I wanted to make it feel like a senior developer website, with a confident introduction about him and his work. It is minimalistic but with a bit of character. There are no unnecessary elements, just two main topics: about Albert and his thoughts.

I had a platform and an awesome design: now it was the time for setting it up. I wanted for it to be state of the art, even if it was a really simple web application, so I applied the best development techniques I had been using professionally these last years. I follow the [git flow](http://nvie.com/posts/a-successful-git-branching-model/){:target="_blank"}, for instance: new posts, features and bugfixes are developed separately in branches, and then merged to master.

Speed was also a priority. Being static pages (compiled after each change), it was already pretty fast, but the assets were not. So I found out the [Jekyll::Assets](https://github.com/jekyll-assets/jekyll-assets){:target="_blank"} plugin for Jekyll, an awesome tool that I could make work together with special fonts needed by the blog & portfolio design, and helped me achieve [incredible WPO results](https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fbellonch.com){:target="_blank"}. Finally, I wanted painless deployment, so I went straight to [Capistrano](http://capistranorb.com/){:target="_blank"}, and after some inspiration from [here](https://www.digitalocean.com/community/tutorials/how-to-get-started-with-jekyll-on-an-ubuntu-vps){:target="_blank"} and [here](https://gist.github.com/uhlenbrock/286293){:target="_blank"}, I came up with a clean solution that deploys a new version within roughly 30 seconds to my personal VPS in [Digital Ocean](https://www.digitalocean.com/){:target="_blank"}.

All in all, I came up with [bellonch.com](/), and I am really happy with the result. Everything is open source, [available at GitHub](https://github.com/albertbellonch/bellonch.com){:target="_blank"}. Feel free to use it, or even contribute by issuing a pull request!
