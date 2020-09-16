---
title: "Moving from GitHub to Self Hosted GitLab"
date: 2020-09-16T11:44:01+05:30
draft: false
categories:
 - Sysadmin
tags:
 - self-hosting
---

As the owner of a dedicated server, which I am not entirely so why/if I need, I finally decided to make the shift from [GitHub](https://github.com) to self-hosting my own git server. GitLab. No, I'm not a masochist, I have enough RAM available to self-host that big a software. Thank you Hetzner for providing a 64GB RAM server at just 54€ a month[^1]!

If you wanna take a look at my Git server: [here you go!](https://git.sohamsen.me)

## Why not just use GitHub?

This is a question I get a lot. Like, "But Soham, why not just github?" or "Wait, you mean to say github and git aren't the same thing?! Is this a conspiracy?"[^2].

There are multiple answers why:

1. Github is lacking in features. Gitlab is pr0 when it comes to features. Granted, I probably won't use 90% of those features, but hey, it feels good.
2. A quick google search on "why should I self host git?" reveals a lot of reasons: it is more secure (I am in full ownership of my data), it's very flexible (I can configure the git server instance the way I want; for example I can modify the defaults, add faster CI runners etc.), and thirdly (and the most important for me) is speed: for some reason, on my 100 Mbps connection, github rarely provides over 5 Mbps. My own server can saturate my home connection (aka, 100 Mbps) easily.
3. It's fun! I like managing systems and managing your own git instance is quite fun.

People might say "self-hosting git is only for teams". Block those people. Don't let them convince you otherwise. All the cool kids self host their git repositories.

## Why not just something that's more lightweight, like Gitea, then?

Most people do indeed use Gitea for self-hosting git repos. It's much more lightweight (a mere few hundred MBs of RAM compared to 4GB of GitLab) and it's very similar to GitHub. If this is your first time self-hosting git repos, you should definitely go with Gitea, even setting it up and managing is much easier.

And why I use it? I'd be tempted to say features. Gitlab is much more powerful than Gitea (hey, the 4GB RAM it uses has to account for something!). Built-in CI/CD, GitLab Pages, Registry, Mattermost, and so much more. **It's way more powerful than GitHub** (honestly, just use https://gitlab.com if you don't want to self-host). It's not owned by Microsoft and that's probably(?) a good thing.

But nay, the real reason is that I had RAM to burn. I was using only 32GB of RAM out of the 64GB I have (even after over-allocating). Also, I had already hosted multiple Gitea instances before and never Gitlab. I like doing sysadmin-y things so might as well self-host GitLab.

Spoiler alert: It's really easy to self-host GitLab, especially if you are using Docker (I'm going to sing the praises of Docker in another post). Took me just 15 mins to set it up.

Oh, and it's really easy (literally 1-click) to import repos from GitHub (or any other git server or even bitbucket and similar) into GitLab. Yay!

## B-but I want my GitHub profile to look good for my CV!

And that's where the magic of GitLab (and Gitea) comes in! It can mirror repositories to and from any other git server, including GitHub. And it's impossible to tell it's mirrored. Just take a look at [my dotfiles on my git server](https://git.sohamsen.me/GhostDev/dotfiles) and [it's mirror on GitHub](https://github.com/FadedCoder/dotfiles).

Of course, I still use GitHub if I want to contribute to public repos hosted on GitHub. For all other purposes, mirroring is sufficient.

## I've never hosted a git server before, how do I get started?

I recommend you to start with [Gitea](https://gitea.io/) (and [Drone](https://drone.io/) if you want CI/CD). You just need a server with 512MB of RAM (you can even use a Raspberry Pi!). Follow their official installation docs and you should be set up perfectly!

## Footer

Oh right - another benefit of hosting my own git server. My servers are interconnected in an intranet which isn't exposed to the outside world for security. So I couldn't just add a `rsync` command to my CD pipelines if I wasn't self-hosting, cause it wouldn't be able to connect. But now, I can just push this blog to my git server, press `Deploy` button on my CD (Drone) and ta-da, blog published without me even having to sign into my server. A definite win, I'd say.

[^1]: This blog post is not sponsored by Hetzner but... Hetzner if you are reading this, I advertised you for free, pls give me 1 free month of server thx :D
[^2]: You'd be surprised at the number of people who think git and github are same. Spoiler: that number is greater than 0.
