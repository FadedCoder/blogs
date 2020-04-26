---
title: "Listening to NOAA 19 With RTL-SDR"
date: 2020-04-06T04:46:04+05:30
draft: false
tags:
  - radio
  - satellite
  - noaa
categories:
 - Radio
---

I recently got my hands on a RTL-SDR (I’m currently using NooElec SmarTEE), short for Software Defined Radio. Basically a tool which lets you hook up your PC to an external antenna, in layman’s term.

And oh boy, the things you can do with it is beyond words, literally. Radio waves are not sent with words... Bad joke. Sorry.

First, I did what everyone does at the beginning: FM Radio. Then Air Traffic Control. Then more random gibberish. And then finally, NOAA 19 weather satellite!

> NOAA 19: An old weather satellite that has some cool cameras that enables anyone with a SDR to get low quality realtime pictures of Earth.
 https://en.wikipedia.org/wiki/NOAA-19

## First Attempt: Complete Failure

For reasons I can’t explain myself, I decided it would be worth a try to see if I can receive the signals with the default monopole antenna (a simple straight antenna) that shipped with my SDR. As you can expect, or guess with common sense what should happen when you use an ordinary antenna to receive a weak signal from 700km away, I did not receive the slightest bit of a signal.

**Result: FAIL. The most basic component, the antenna itself was wrong.**

## Second Attempt: Mostly Failure

After lots of research, I found out that there are mainly 3 types of antenna that can be used to receive the NOAA signal. Those are the **Quadrifilar Helix Antenna** (QFH for short, looks like two DNA strands mixed together), the **Turnstile antenna** (four metal rods at 90deg angles), and the easiest **V-Dipole antenna** (two metal rods in a V-shape, 120deg between them). If you want to read more about these, [here is the link](https://www.rtl-sdr.com/rtl-sdr-tutorial-receiving-noaa-weather-satellite-images/).

**NOTE:** You can also use a directional antenna like a yagi, if you have the patience to point it towards the satellite for 14 minutes. Or you cam build a tracker. Directional scanners have a lot of gain. Yagi has, on average, 10-12 dB of gain which is equivalent to a 1000% to 1500% increase in reception power. Yes.

I wanted to build a QFH antenna as it had the best reception quality, but could not source all raw materials. After a lot of thinking, I bought off the RTL-SDR V-Dipole Antenna kit which came with a tripod for ease-of-mounting.

I happily waited for the next satellite pass, and went on the roof, excited to get my first satellite pictures.

The good part? I detected the satellite signal. The bad part? The satellite signal was too low for a proper conversion to image.

**Result: FAIL. The satellite was at a very low elevation (25 degree), which meant that the signals were blocked by other buildings and the satellite itself was a lot further away.**

## Third Attempt: Partial Success

To my surprise, the very next day had a good NOAA 19 pass at an elevation of 65 degrees. I went to the roof 30 minutes before the pass and set up my equipment. This is how it looked:

| ![My Setup](/images/sat_receive_setup.jpg) |
|:---:|
| *My laptop, my headphones, the SDR, and the dipole antenna.* |


…And it worked! After days, even weeks, of waiting, I got my first proper view of India through the NOAA 19 telescope. Here is the image:

| ![The Result](/gallery/earth-n-space/NOAA19_Earth.jpg) |
|:---:|
| *Beautiful, innit?* |

Full of static in edges, but the beautiful sea looks like bliss
**Result: PARTIAL SUCCESS. I got a picture, but the quality was lower than I expected. Could be much more improved.**

## Future Attempts

Here is a list of lessons I learnt:

1. Don’t experiment with antennas unless you have a lot of free time, and V-Dipoles are cheap and easy, but not the best. V-Dipole antennas have a 2 dB, or roughly 63% power loss because the signal polarity does not match.
2. For a good reception, maximum elevation must be a minimum of 50-60 degrees. Any less and you will get a very weak signal with lots of static.
3. [r/RTLSDR](https://www.reddit.com/r/RTLSDR/) is a very friendly and nice subreddit that helped me find my mistakes and correct them. Kudos to them.

For my future attempts, I have some ideas that I want to test:

1. A pass that has a maximum elevation above 85 degrees.
2. My LNA (Low-Noise Amplifier. A tool to amplify the signal strength without increasing the background static/noise. Basically, magic.) which I recently bought (an [LNA4ALL](https://lna4all.blogspot.com/)). Have not yet tested it for satellites, but listened to Air Traffic Control and it magically boosted the signal. 10/10 would recommend.
3. A handheld yagi antenna for better signal reception. Basically I have to hold this antenna in my hand for 14 minutes, while moving it slowly such that it points towards the satellite. A tedious job. Or at the very least, I want to use a QFH.

In the future, I am going to expand from NOAA to Meteor to other satellites that others don’t commonly use.

There are about **five thousand active satellites** as of now. Some of those have an unencrypted downlink that allows people with SDRs and good antennas to receive their signals. Sadly, many require a directional antenna... and I don't have enough money to buy one. (Well, the shipping costs. The dish itself is cheap, but shipping is nearly 1k$. Big sad.) Donations welcome!