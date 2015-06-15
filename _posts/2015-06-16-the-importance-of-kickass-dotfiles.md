---
layout: post
title: The importance of kick-ass dotfiles
description:

date: 2015-06-16 00:20
categories: tech
---

####Your experience, knowledge and talent are key to success, but some kick-ass dotfiles speed you up.

I remember my first day as a Ruby programmer, some four years ago. I just got landed in this world, started learning about RVM, gems, bundler, Rails and so many things. And one of the things my then mentor talked about was **dotfiles**.

### But what are dotfiles?

**dotfiles** are basically all those config files that begin with a dot for *nix-based systems*. This makes them invisible when you use your computer in a *normal* way, navigating through folders and so on, but are essential to setting up key components in your day to day life as a programmer. We are talking about all sorts of your terminal config: the way it looks and behaves, the way you launch and use your editor (either if it's [vim](http://www.vim.org/){:target="_blank"}, [Emacs](http://www.gnu.org/software/emacs/){:target="_blank"} or [Atom](https://atom.io/){:target="_blank"}), the aliases you have for repeated tasks, or even the custom binaries you might want to use.

### Doing dotfiles right

It's not only important to know what you can do with dotfiles, but also to take advantage of what they offer, and use them to customize your computer so they perfectly fit for you. Good, well-organized, understandable dotfiles basically allow you to automatize complex tasks that you repeat everyday. You have unlimited power with this, but it's your call to know when something can be improved thanks to an alias, a custom binary  or a specific shell config.

Utimately, whichever path you choose, it is highly recommended to push your dotfiles into a version control software. This way, you will be able to sync your config across several computers (like home and work) and, also, you'll be able to track all the changes you made, and even offer them to anyone else who might be interested in them.

### Setting up your shell

Whatever shell you have (I personally use [zsh](http://www.zsh.org/){:target="_blank"} through [this framework](https://github.com/robbyrussell/oh-my-zsh){:target="_blank"}), you always have a shell startup script that gets executed when you fire up a new terminal. Since there is quite a bit of logic inside the script and you will want to keep things organized, a good approach is to reduce it into the head script that will be executed, and a folder where you store all the logic in recognizable pieces.

In my case, each time that I set up a computer for me, I just:

- Link the head script: `ln -s ~/code/dotfiles/zsh/zshrc.symlink .zshrc`
- And then the `zsh` folder: `ln -s ~/code/dotfiles/zsh .zsh`

### Cowfiles, rainbows, and your terminal theme

It is fairly common to personalize this script to your needs in many ways, like shaping the way your prompt looks, customizing your text editor of choice, and even crafting the exact `PATH` in the exact order you want.

Anyway, it's entirely up to you! Just two examples from my dotfiles:

- In my `.zsh` file I source for a `.localrc` (if any), not committed to my Github repository, where I store aliases I don't want in public or I just want for that specific computer.
- I want my terminal to cheer me up and suprise me, so I combine the quote-based wisdom of [fortune](https://en.wikipedia.org/wiki/Fortune_(Unix)){:target="_blank"}, a tweaked version of [cowsay](https://en.wikipedia.org/wiki/Cowsay){:target="_blank"} and the never boring colors of [lolcat](https://github.com/busyloop/lolcat){:target="_blank"} with awesome results.

And all in all, my terminal looks like this...

{% image posts/dotfiles/albertbellonch.png %}

...so I guess you now know which one is my favorite animal.

### Aliases and binaries: automate everything!

Apart from rainbows and nice animals, one of the things I **love** from my dotfiles are the aliases. Basically, aliases are shortcuts for a command or set of commands, and they are really helpful to shorten the time it takes for you to do a specific task on the terminal.

You want examples? `git pull --rebase` is `gpl` (git-pulling with rebase in your current branch), `be rspec spec/` (firing up all tests with `rspec`) is reduced into `t`, and, hold your horses... `git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --` (a really nice git log formatting) is just `gl` for me. Use your imagination!

Sometimes there are things that cannot be *aliased*, maybe because the commands you are shortening need some parameter, or maybe there is some logic behind them. This is where having binaries in your dotfiles is helpful! An example for removing a branch in git, both remote and local:
{% highlight ruby %}
#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Please provide a branch name."
  exit
end

branch_name = ARGV[0]
if branch_name == "master"
  puts "No way you're deleting master"
  exit
end
`git checkout master` # checkout to master
puts "Removing branch #{branch_name}..."
`git branch -D #{branch_name}` # delete local branch
`git push origin :#{branch_name}` # delete remote branch
{% endhighlight %}

You just add them to your path in some shell dotfile, and you're ready to use them whenever you please.

### You'll never walk alone

Writing all your dotfiles on your own might be difficult, mostly in the beginning. In order to avoid feeling lost, it is highly recommendable to observe several dotfiles from several people, and ultimately start from scratch (maybe leave it for some months later!) or, even better, fork a particular set of dotfiles that you like, and continue the work from there.

In case you are interested, my complete dotfiles are [here](https://github.com/albertbellonch/dotfiles){:target="_blank"}. Feel free to fork them!
