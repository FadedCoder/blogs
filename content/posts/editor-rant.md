---
title: "Just a rant about text editors"
date: 2021-07-18T03:55:45+05:30
draft: false
categories:
 - Miscellaneous
tags:
 - miscellaneous
 - editors
---

**Disclaimer: This blog post contains personal opinions. Please don't come at me with pitchforks**

I've been using computers since pre-historic times and have managed to use most (good) text editors in existence. Ranging from the classics such as Windows Notepad, to Notepad++, to Codeblocks and Eclipse, to IDEs such as Jetbrains IntelliJ and finally, the 1337h4xx0r editors: vim and emacs. But recently, I've started using Virtual Studio Code (VS Code) and it's replacing my Emacs.

This rant will mostly be about Emacs vs VS Code, and the features I look for in a text editor. But before that, 2 things:

1. Emacs \>\>\> Vim. 'Nuff said. Like, the internet is full of emacs vs vim comparisons, rants and more. Go somewhere else for that.
2. I use IDEs such as the ones made by Jetbrains (thanks [Github Education](https://education.github.com/pack) Pack for free access) but in specific cases. They are good for big projects, but for anything else, IDEs aren't that versatile.

| ![XKCD #378 - Real Programmers](https://imgs.xkcd.com/comics/real_programmers.png) |
|:---:|
| *Compulsory relevant XKCD post* |

Now that's over, let's get started.

# Customizability

I love to customize my editors to meet my needs. I like it when it does exactly what I want. And that's why I switched to Emacs, the most customizable editor ever. VSCode is okay-ish in terms of customizability, but in Emacs, you can just write some Lisp scripts and configure the editor to do just about anything. Just to compare, here is the welcome screen of my Emacs and VSCode:

| ![Emacs](/images/editor-emacs-home-page.png) | ![VS Code](/images/editor-vscode-home-page.png) |
|:---:|:---:|
| *Perfect weeb home page* | *Boring corporate home page* |

However, the same reason that brought me to Emacs is pushing me away from it. As I get older (okay, I'm 19 years old, sounds weird when I say this), I realize that often, out-of-the-box support is more important than customizability.

Sure, I can customize my Emacs installation and change the font color, tab size, LSP[^1], keybindings, tooltips, or just about anything. But it takes time to do so. A bare installation is pretty much unusable and it takes a few days worth of work (or stealing someone else's dotfiles) to get Emacs up and running.

Meanwhile, in VSCode, I can head to the plugin store and download the plugin I need. I can get a fully working environment for Python within 2 minutes in VSCode, whereas the same will take me a few hours in Emacs.

While I *can* spend a few hours to get something working, I can better utilize that time by playing games, grinding on FFXIV or Genshin Impact, or watching anime. Yes, I utilize my time very well.

Now you might say, "why not use Spacemacs for Emacs? It makes Emacs useable out-of-the-box", to which I would reply: VSCode and Spacemacs are millenia apart. I still have to configure some stuff in Spacemacs. Meanwhile, in VSCode: install plugin -> select interpreter -> ??? -> profits.

# Keybindings

I'm going to miss Emacs for this. Literally everything possible can be done with the keyboard and the mouse is essentially useless in Emacs. This greatly increases productivity since you don't have to waste time fixing cursor position. Also, it just feels good and geeky to utilize only the keyboard.

While VSCode has keybindings too, they're okay-ish at best. Better than just about anything else (excluding Vim), but not as good as Emacs.

In Emacs, you can type `M-x` (equivalent to <kbd><kbd>Alt</kbd>+<kbd>x</kbd></kbd>) and type a command (such as `search` or `search-replace` or `take-over-the-planet-and-make-me-emperor`). The closest similar thing would be the command palette in VS Code but it can't do everything.

# Speed and Bugs

I am actually very impressed with VS Code. Despite being made with Electron, it is unlike the other Electron apps and is extremely fast. For me, it starts within 0.5s.

Compared to that, Emacs is slow. After tonnes of optimization, I was able to bring down the boot time to just over a second. Well, this won't be a fair comparison since some plugins of Emacs don't lazy load. I ran into enough problems and bugs to justify lazy-loading them, so I just load those at boot time itself.

Also, I like it when my text editor does not randomly crash. Or worse yet, cause a kernel panic while it crashes (my old system + Emacs did it, switched to a new system before I could debug why it happened). I have had issues with the LSP in Emacs not working as expected or being slow for large files. Probably because I optimized it a bit too much, it used to crash at times while editing files. Again, I could have debugged and tried to fix the issues, but I decided it's better to utilize that time for something else instead. 

# Plugins

Both VS Code and Emacs have a *huge* repository of plugins available. VS Code has the Plugin marketplace whereas Emacs has MELPA (and other repositories, MELPA is the biggest).

You can find just about anything in it, although if I had to compare apples-to-apples, Emacs probably has more. I mean, I even saw some games in the MELPA repository. Don't ask me why you would play games inside a text editor, though.

# Design

In this regard, I like the design of both Emacs and VS Code. Both are good in their own ways. VS Code looks a like 2020-tech, while Emacs looks like 1980-tech. Both have their own charms.

# Conclusion

So... I guess it's time for me to say goodbye to Emacs. I won't completely stop using it, but I'm switching over to VS Code as my primary text editor.

Thanks for listening to my rant.

[^1]: [Language Server Protocol](https://en.wikipedia.org/wiki/Language_Server_Protocol) is what powers most autocompletion and other IDE-like things in text editors nowadays. An example would be Pylance for Python. While Pylance is made by Microsoft for VS Code, it can be used over a wide variety of text editors thanks to them using the LSP.