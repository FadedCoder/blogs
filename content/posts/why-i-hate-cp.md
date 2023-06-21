---
title: "Why I Hate Competitive Programming (and JEE)"
date: 2023-06-22T03:58:42+05:30
draft: false
categories:
 - Miscellaneous
tags:
 - miscellaneous
 - personal
 - competitive-programming
 - dsa
---

**Disclaimer:** I only hate competitive programming (henceforth, CP), not the people who do CP. I just pity those people (including myself) who are forced to do it for the sake of getting a job, but I absolutely respect those who participate in CP contents for the sake of fun and learning.

## What is Competitive Programming?

If you are not someone involved in the software field, you might not be familiar with this term.

It was originally a sport where people would compete against each other to solve algorithmic problems. The problems are sometimes mathematical in nature, and the solutions that solve the problem fastest and/or using least amount of memory wins. This was the kind of competitive programming I respected. It was a sport, and people did it for fun.

## Why do you hate it, then? It sounds fun!

Cause CP has now devolved into a job requirement. Let me explain with an analogy.

### Analogy - Joint Entrance Examination (JEE) vs what is really taught in universities

According to [wikipedia](https://en.wikipedia.org/wiki/Joint_Entrance_Examination),

> The Joint Entrance Examination (JEE) is an engineering entrance assessment conducted for admission to various engineering colleges in India. It is constituted by two different examinations: the JEE-Main and the JEE-Advanced.

#### Small detour on JEE-Advanced

The subjects for the exam are physics, chemistry and mathematics. This is really weird, since say, you like playing with computers, and taught yourself programming since a young age. You like physics and mathematics too, but aren't a big fan of chemistry (even though you binge-watch [NileRed](https://www.youtube.com/channel/UCFhXFikryT4aFcLkLw2LBLA)). Of course, your skills in physics and mathematics are not as good as your programming skills, something which you have been doing since a long time.

It makes sense that **if you want to pursue a career in computer science and want to join university for it, you should be tested on your CS skills** (and mathematics too). But in India, your fate is determined by your proficiency in only 3 subjects, even if you won't be using them much in your career. Mind you, people not from Southern/Eastern Asia, in India the examinations, especially JEE, have a MUCH higher level of difficulty. The questions asked in JEE are often taught at the university level in other countries, and while I believe everyone must be taught basic-to-intermediate levels of core STEM subjects, it sounds a bit ridiculuous to be taught something in such a high depth when you won't be using it much or at all in your career.

I was able to clear the examination and get admitted into an [IIT](https://en.wikipedia.org/wiki/Indian_Institutes_of_Technology), which are often considered as India's premier institutes for tertiary education in engineering. Based on my rank, I was able to join the Mechanical Engineering department at IIT Kharagpur, but later on was able to change my department to **Electrical Engineering** (this, again, is done somewhat on the basis of my grade and everyone else who applied for a department change). My first priority was ofcourse the Computer Science department, but again, I was tested not only on the basis of my CS skills (which I aced) but also my mechanical (messed up), chemical (badly messed up), mathematics (aced), physics (okay-ish), etc. skills.

Anyway, back to the main topic for the analogy.

As I said in the last paragraph, I am in the department of Electrical Engineering. From my personal experience, I can say that the things I am taught in my department are not even remotely close to what I was taught in JEE. I do not have to meaninglessly calculate the resistance of an obscure circuit using Kirchoff's laws. The circuits are usually pretty simple (since in the real world, we do not _usually_ place discrete resistors in parallel and/or series 5-6 times to get a resistance value, that will be inaccurate since resistors are not ideal). There are some very niche cases where the stuff I learned during JEE was somewhat useful, but even if I hadn't cleared JEE, it would have taken me just a few hours of googling to learn the stuff I needed to know. Which I anyway did, since I forgot most of what I learned during JEE.

What I learnt instead was how to _design_ circuits. I was taught methods of analysis, how to simulate them, and how to build circuits that actually are useable in the real world, and also tested on the same.

### But how is this related to CP?

The same goes for people who practice CP for the sake of getting a job. They learn CP skills but those skills will not really be useful in their job. Sure, there might be some cases where they are useful, especially people who work in the field of algorithms, but in most cases you will either take just a few hours to learn a specific algorithm, or you will just be using a library.

The [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) is a good example. It is a really cool algorithm that can be used, in layman terms, to find the shortest path between two points (like how Google Maps is able to find the shortest routes). It, or a variation of it, is often asked in CP competitions, but in the real world, you rarely if ever use it. I have not yet used it at any of the places I worked at. Again, there might already be libraries doing the exact same thing, and if there aren't any for your particular use case, it will take a very short time to learn the algorithm and implement it. As they say: do not reinvent the wheel, use libraries.

## But wait, you cannot be a professional programmer if you do not know data structures and algorithms!

I agree, somewhat. It is essential to know what trees and graphs are, how databases operate, some basic and widely used data structures, etc. to become a professional programmer. But honestly, for getting a job you should not have to learn the implementation of a [Red-Black Tree](https://en.wikipedia.org/wiki/Red%E2%80%93black_tree) (well unless you are applying for jobs that revolve around algorithms). You should know what they are so that you are able to identify a problem, and then maybe learn it quickly if you need to implement it in your job. Or again, use a library.

**Interviews are a game of chance.**

The sea of algorithms is vast, and you cannot possibly know all of them. There is a chance that you might be asked a question that you know the answer to, but there is also a chance that you do not know a question. You might be a really good programmer who knows a lot of algorithms and DSA, but might not be able to know or remember one specific algorithm in an interview. That too, in just 30 minutes in a stressful environment.

**And DSA is not the only thing that a professional programmer needs to have.**

In my opinion, professional programmers are experts at pinpointing bugs, designing architectures and have the ability to learn quickly. After all, even ChatGPT can write code.

## My opinion on how interviews should be conducted

Through my past interviews, below are some points I can think of. I have never conducted a (proper) job interview, so take my opinion with a grain of salt, and do tell me what is feasible and what is not.

1. You can give them a small project to complete, which might be using specific algorithms. This will test their ability to learn quickly, and also their ability to design and implement a system.
2. Allow them to Google during the interview. If you need a programmer who does not need to Google, you have ChatGPT. I hate memorizing stuff, and I am sure most people do too. I would rather spend my time learning something new than memorizing something I can just Google. **Especially if it some obscure standard library function.** If you spend enough time with a language, you will automatically remember the most used functions. But what is the point of asking about functions that rarely get used?
3. Ask about past experiences and projects, and how they solved problems. Maybe the most difficult problems they encountered and how they solved it.

## Conclusion

I am not saying that CP is bad. It is fun at times. But it is not the only way to learn programming, and it SHOULD NOT be the only way to get a job.

Essentially, if you are practicing something just to crack an interview, you will end up forgetting most it anyway after you get a job. Then, you end up Googling to re-learn it if you face an algorithmic problem.

So then, **what are job interviews (that ask algorithmic questions) really testing for?**