---
title: "Breaking Math.random() and Predicting Random Numbers (Housecat RTCP CTF Writeup: JS Lotto)"
date: 2020-04-26T19:07:36+05:30
draft: false
categories:
 - CTF Writeups
 - Housecat RTCP CTF
tags:
 - miscellaneous-ctf
 - housecat-rtcp-ctf
---

TL;DR? [Here](https://gist.github.com/FadedCoder/b7f23039e8933bcc07d0dc61da093b29).
**PS: You need to do `pip install z3-solver requests` for this to work.**

---

Okay so a little confession: Before the CTF challenge, I didn't think much of Cryptographically Secure Pseudo Random Generators (CSPRNGS), and thought they were just for very high security purposes, like defence against a state level hacking agency. I thought normal PRNGs were enough for day-to-day purposes and no one could realistically break it.

After this CTF...oh boy, it takes 30 mins to break PRNGs (the one used by Javascript in Chrome/Firefox) and I'm never going to use those for security again. I should've never...

Anyway, let's get started!

## Challenge

**Challenge Name: JS Lotto**

**Challenge Description:**

> I found this lotto website called JS Lotto. Wanna test your luck? I heard if you guess all 5 numbers correctly, you can win a flag!
[Link](http://challs.houseplant.riceteacatpanda.wtf:30006/)

So, there was this [challenge](http://challs.houseplant.riceteacatpanda.wtf:30006/) where you had to enter 5 numbers between 1 to 1000 and the server would match these numbers with 5 randomly generated ones. It was sending a POST request:

```
POST http://challs.houseplant.riceteacatpanda.wtf:30006/guess
Content-Type: application/json
Data: [1,2,3,4,5]

Returns: {"results":[858.7939810434016,511.14241319962207,251.7950653388974,371.5915221535004,262.29409707684704]}
```


## Solution

After a bit of fiddling, I realized I had to break the random number generator and predict the numbers in future to win this challenge. From the name (JS Lotto) I guessed the backend was in JavaScript and `Math.random()` was being used (cause this won't be a break-random() anymore if a CSPRNG was being used).

After a bit of googling, I came to know XORShift128+ is used in JavaScript for generating random numbers. And [it can be broken by a high-schooler](https://lemire.me/blog/2017/08/22/cracking-random-number-generators-xoroshiro128/). Which I am. Lucky.

I came across [XorShift128Plus](https://github.com/TACIXAT/XorShift128Plus) predictor Python code on Github which had the code for Google Chrome and Firefox based JS engines. (Safari is there too but broken).

So first I got 2 random numbers from the site using CURL (1 for using as a generation seed and one for validation):

```
$ curl 'http://challs.houseplant.riceteacatpanda.wtf:30006/guess' -H 'Content-Type: application/json' --data '[2,2,2,2,2]' & curl 'http://challs.houseplant.riceteacatpanda.wtf:30006/guess' -H 'Content-Type: application/json' --data '[2,2,2,2,2]'

{"results":[858.7939810434016,511.14241319962207,251.7950653388974,371.5915221535004,262.29409707684704]}{"results":[862.676114246725,526.9341585672347,396.08207314621023,634.2906066568407,603.2069164482145]}
```

[The original code](https://github.com/TACIXAT/XorShift128Plus/blob/master/xs128p.py#L147) required the numbers to be in 0-1 range so I divided all numbers by 1000:

```
dubs = [858.7939810434016,511.14241319962207,251.7950653388974,371.5915221535004,262.29409707684704]
dubs = [i/1000 for i in dubs]
validation_numbers = [862.676114246725,526.9341585672347,396.08207314621023,634.2906066568407,603.2069164482145]
```
It worked with the default browser config (Chrome) but there was another issue in the code, that the first generated number (862.676114246725 in this case) was getting skipped. It was relatively easy to fix, on [line 189](https://github.com/TACIXAT/XorShift128Plus/blob/master/xs128p.py#L189), changed `generated = []` to:

```
generated = [to_double(browser, state0 & MASK)]
```
After it's generated, I had to remultiply the numbers by 1000 by using:
```
generated = [i*1000 for i in generated]
```
Now, I did some `print` statements to check if validation numbers were in `generated`, and voila! It worked.

```
print(generated)
print([i in generated for i in validation_numbers])
# prints True if the number is in generated, else False. 5 True means everything is working!
```

Now I had to just add in `requests` and automate it, and print the flag. It was relatively simple:

```
dubs = requests.post(
    "http://challs.houseplant.riceteacatpanda.wtf:30006/guess",
    json=[1,2,3,4,5]).json()['results']
... # After generation is done
# Had to send integers
z = requests.post(
    "http://challs.houseplant.riceteacatpanda.wtf:30006/guess",
    json=[int(i) for i in generated[:5]]).json()
print(z)
```

Flag is: `rtcp{th3_h0us3_d1dnt_w1n_th15_t1m3_5bcbf4}`. GGWP.

## Conclusion

**Note:** It may not always work since the requests have to be consecutive. A fast internet will greatly help.

Here is the full code on [GitHub Gist](https://gist.github.com/FadedCoder/b7f23039e8933bcc07d0dc61da093b29). Ask me in the comments for any issues!

It was a fun challenge and it made me realize: NEVER use non-cryptographically secure PRNGs for ANYTHING related to security. Thanks jammy for the challenge!