---
title: "My History of Operating Systems"
date: 2023-01-03T05:46:04+05:30
draft: false
categories:
 - Miscellaneous
tags:
 - Miscellaneous
 - personal
 - operating-system
---

I've used quite some operating systems throughout my life: Unix based ones like Linux, BSD and MacOS; Windows, and even some RTOS-es on my embedded devices. This post is mostly going to be about the ones I have used as a daily driver.

If you want to see the comparisons between Windows, MacOS and Linux, [skip to the very end](#comparison-between-the-3-giants).

## The Very Beginnings

I think I was around five years old, when I got to use a computer for a first time. My dad bought it for the family and it ran Windows XP. I used it mostly for, well, whatever a five-year old does with a computer with a DSL connection. Ocassional websites and mostly gaming. It was back in the early 2000s, back when floppy disks were still available desktops (even though I don't remember ever using one, CDs had gained popularity). This part of my life is going to be short, simply cause I don't remember much. I just remember I used to play [Delta Force](https://en.wikipedia.org/wiki/Delta_Force_(video_game)) and [Return To Castle Wolfenstein](https://en.wikipedia.org/wiki/Return_to_Castle_Wolfenstein).

{{< img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Windows_XP_ITA.png" title="Windows XP" caption="The good ol' days" alt="Windows XP" position="center" >}}

## A Glimpse into Programming

When I was in grade 2, we got a new PC. It was an HP all-in-one (which is basically an unholy mixture of a desktop and a laptop, with the cons of both and the pros of none). It ran Windows 7. I had skipped Windows Vista, pretty much. I don't think I ever used it. This was the time [I first got into programming]({{< ref "journey-of-my-life#where-the-journey-to-coding-began" >}} "Journey of My Life"), and I started with Android development.

It is a real pain to download Eclipse (the precursor to Android Studio) along with the Android Development Tools on a meagre 2GB data cap per month[^1]. Windows added to this pain exponentially, and installing _anything_ remotely related to programming on Windows 7 is enough to give serious headaches.

{{< img src="/images/programming-on-win-7.jpeg" caption="It was easier to burn the PC" alt="Programming on Windows 7" position="center" >}}

These were the days I first dabbled into programming, although I used my PC to mostly just play games. The one game I most vividly remember is [Grand Theft Auto: San Andreas](https://en.wikipedia.org/wiki/Grand_Theft_Auto:_San_Andreas).

{{< img src="/images/windows-7.jpeg" title="Windows 7" caption="Back when I became a power user" alt="Windows 7" position="center" >}}

## (Script Kiddie) Hacker Culture

When I was in grade 8, I had a workshop on ethical hacking presented by some "hacker". He showed us how to "hack": he opened a web-page in which there was a password input, and then he entered his password. He then proceeded to Inspect Element it, and change the input type from `password` to `text`, revealing the password.

Even 13 year old me thought it was pretty dumb.

But what caught my attention wasn't what he did, but what he used: (Windows in a VM running on) Kali Linux (yep, dude was a script kiddie too). I was mesmerized by it. It looked so foreign to anything I used prior to that, and the hacking tools in it caught my attention.

That day, I went home and tried dual-booting it onto my laptop. Took me a few days and one or two accidental Windows deletions, but I was able to finally get it running in the end.

{{< img src="/images/kali-desktop-gnome.jpg" caption="Wait, where is the green text on black background???" alt="Kali Linux with GNOME" title="Kali Linux (GNOME)" position="center" >}}

Those were the days I spent a lot of time being a script kiddie. Hacking into vulnerable websites found with Google Dorks[^2], installing backdoors on RATs on phones (back when Android actually allowed installing viruses), hacking into WiFi networks[^3], and even hacking my school's website to get personal information of every student. Looking back, I probably broke a few laws. But hey, if you show a 13 year old Kali Linux _at a school workshop on hacking_, what else do you expect?

## I use(d) Arch, btw

I got tired of Kali Linux pretty soon. It was fun to mess around with, but that's about it. I was starting to get more into programming, and turns out it's not really that great for it. Missing or broken packages, outdated repositories, and broken GPU drivers made me look for something more.

I was an avid Redditor back then, whose users made me try out Arch Linux. Thankfully I did not know what 4chan was, otherwise I would've been forced to install Gentoo.

{{< img src="/images/install-gentoo.png" caption="It may be fun if you are a masochist and have infinite patience" alt="Install Gentoo" position="center" >}}

I spent the first few _weeks_ trying to install it. I did not just blindly copy commands from the wiki, or use a graphical installer like I had done with Kali Linux. Instead, I figured out what each and every command did, how to tweak it, and how to do something my way. The side-effect was again wiping Windows and my personal data a few times. It's funny how what took me several weeks (and even months) to learn properly, I can do in 5 minutes now. Installing Arch Linux has become a cake-walk since then, thanks to those painstaking efforts I took when I started.

And oh boy, what a refreshing experience it was as a programmer. I felt truly at home. It became my primary operating system, and I did not use Windows for weeks at a time.

I used KDE as my desktop environment cause Windows UI kind of stuck onto me.

I continued using it till very recently, till I moved onto NixOS and MacOS. However, I will still recommend new programmers or tech geeks to try out Arch Linux. It really teaches you the fundamentals of GNU/Linux and the proper use of a terminal. And using a terminal is way more productive than using GUIs. Thanks to Arch Linux, I was able to become properly versed in using Linux.

{{< img src="/images/arch-kde.png" title="Arch Linux (KDE)" caption="The overall best tool for programmers" alt="Arch Linux (KDE)" position="center" >}}

### NixOS: A brief dive into something cool

This section is going to be small cause I did not really use NixOS for a long time, but I can tell that it is by far one of the most interesting Linux distros I have tried out so far. There are already a lot of great blogs and posts on Nix, so I won't delve into it much, but TL;DR: it creates perfectly reproducible environments.

Wiped your PC accidentally? Bought a new one? With NixOS, you just have to copy 2-3 configuration files and you will have your previous environment running again in a few minutes.

It also comes with the Nix package manager, which ensures that the dependencies for a package are always working, and avoiding the dependency hell that other package managers have without using 100s of GBs of statically linked binaries.

## Modern Day

Nowadays, I use a Macbook Air for development and Windows 11 for gaming. I love both of these operating systems equally, and neither can really replace the other. They both have their own uses.

It has been a while I last used Linux, and I don't really see myself booting into one again anytime soon. Do mind that I still regularly Linux - on my servers. I ocassionally also use it inside VMs and using WSL on Windows, but I don't really see the point of booting into it. I don't do much linux kernel development - the only times I contributed to it was when I was trying to fix some bugs on my laptop.

I don't really get much time for customizing and "perfecting" my desktop - nowadays I prefer solutions that just work right from the moment I start using them (like my [text editors]({{< ref "editor-rant" >}} "Rant on text editors")).

Despite what others say, MacOS on ARM processors are really good. I get a battery life of 12+ hours, enough to last a day and intense programming sessions, without being wired. It can also run x86 architecture applications smoothly. The only issues are running an x86 operating system inside a VM, which it is not capable of, and that's why I use Windows on a traditional laptop and desktop. Also, Docker runs properly and can run both amd64 and arm64 images. That's pretty much all I need nowadays from my development PC.

{{< img src="/images/macos-desktop-current.png" caption="My current love" alt="MacOS Ventura" title="MacOS Ventura" position="center" >}}

{{< img src="/images/windows-11-current.png" caption="My gaming buddy. BTW, the wallpaper was generated with AI." alt="Windows 11" title="Windows 11" position="center" >}}


## Comparison between the 3 giants

Finally, what you probably have been waiting for. I will just create a points table between 1 (being the worst) to 5 (the best) for now. Let me know in the comments if you want a detailed post.

| Keyword | Description | Windows | MacOS | Linux |
| :---: | :---: | :---: | :---: | :---: |
| **Beauty** | How good it looks just after installation | 4 | 5 | 2* |
| **Versatility** | What all you can do with it | 4 | 3 | 4.5 |
| **Polishedness** | How bug-free the experience will be | 4.5 | 5 | 1 |
| **Customizability** | How much you can customize it | 3 | 2 | 5 |
| **Gaming** | How good it is to play games on | 5 | 2 | 3 |
| **Coding** | How good it is to code on | 2 (4**) | 4 | 5 |
| **Simple User** | How good it is for a non-tech user | 5 | 5 | 1 |


\* Linux is customizable, so depends on the user. Ubuntu and Arch Linux look bad out of the box, hence the lower rating. ElementaryOS looks stunning, though.
\*\* WSL on Windows is _technically_ Linux, not Windows.


[^1]: Back then, we had 3G networks which provided bandwidths roughly from 800 Kbps to 5-6 Mbps. They also had pretty strict data caps, and the network slowed down to 64 Kbps if you exceeded it. And no, I did not have wired internet. Funnily enough, I checked my data usage last month, and it was 4 TB on a 300 Mbps connection.

[^2]: Yes, [you can find vulnerable websites with Google](https://www.exploit-db.com/google-hacking-database). Or atleast, you could. I haven't tried it in a long time.

[^3]: Back then, a lot of networks still used [WEP](https://en.wikipedia.org/wiki/Wired_Equivalent_Privacy), which is pretty easy to crack.