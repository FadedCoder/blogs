---
title: "How Computer Storage Works"
date: 2021-08-25T03:57:16+05:30
draft: true
categories:
 - Educational
tags:
 - storage
 - educational
---

This is going to be a long blog post, and will have an accompanying presentation (and possibly a lightning talk!).

## The (very) basic categories of storage

Computer storage can be broadly divided into two categories: **primary** and **secondary** storage.

 - **Primary storage**: Data storage that can be directly accessed by the CPU. Such as the processor registers, L2/L3 cache or RAM. Since these are directly accessed by the CPU, the latency is very low at the expense of small amounts of storage.
 - **Secondary storage**: Data storage that typically requires the CPU to use input/output channels to access the data. Because of this, the latency is many orders of magnitudes higher but a very large amount of data can be stored.

| ![](/images/storage-latency-size-pyramid.png) |
|:---:|
| *Latency vs Size of different storage mediums. The last two, SSD and HDD are secondary, and the rest are primary.* |

This blog post will cover just **secondary storage mediums**. If this blog post is well-receieved, I'll write a post on that too!

We can next divide our secondary storage medium into two broad categories: **Electro-mechanical storage** and **Solid state storage**

## Electro-mechanical Storage

These involve some moving components like spinning disks or a moving head to access or modify the data.

### How CDs and its family work

There are small differences between the different types of CDs: Read-only vs Writeable, DVD, BluRay, etc. but they all share the same basic principle. A laser is fixed onto a head which can move in a radial direction (either towards the center or away from it), and the disc spins. In this way, the entire surface area of the disc can be covered.

The head contains not only the laser but also a sensor. When this laser strikes the surface of the CD, it is reflected back onto the sensor. Now, a CD surface has tiny bumps on it that will reflect the light _differently_, either reflecting more or less. This change in reflection is recorded by the sensor.

 | ![](/images/storage-cd-workings.jpg) |
|:---:|
| *These pits (also called bumps) reflect the light differently* |

This reflection data is read, error-corrected and demodulated to retrieve the digital data.

**Note that** in a CD, things are typically on the micrometer scale (like, each bump is 1.6 µm wide and for reference, a human hair is 50 µm thick) and the RPM is usually below 1000 RPM. Also, this is a optical system, that is, it uses light to read and write data.

### The mysterious hard drives

Hard drives might _sound_ similar to CDs, in the sense both involve a rotating disc (known as platter) and a stationary head that accesses the data but there are a lot of differences. A standard Blu-ray disk might store just around 50 GB of data, whereas hard disks can easily store 18 TBs! That's a 360x increase in storage capacity. Not just that, hard drives can read, and especially write data, at MUCH faster rates than CDs (the access times for HDDs being 2.5 to 10 ms, whereas CDs are in the 80-200 ms range).

Of course, a part of it is because hard drives have multiple platters, and both the surfaces of each platter are used to store data. And also because it spins at much faster rates, 5400 RPM, 7200 RPM, or for server needs, even 15k RPM.

But the largest difference is in the way data is stored and accessed. Unlike CDs, they magnetically store the information. These platters have a thin magnetic layer with tiny grains that can have a north or south orientation. Think of it as having a lot of tiny magnets on the disk.



When writing data, an electromagnet is used to change the polarity of each tiny "magnet", making it either North (assume, bit 1) or South (bit 0). When reading data, we use something known as the [Faraday's Law of Electromagnetic Induction](https://en.wikipedia.org/wiki/Faraday%27s_law_of_induction), which says that when a magnetic field is moved over a conductor, electricity is produced. So the change of each tiny magnet from north to south or vice versa creates a tiny electrical current which is then used to read the data.

Thanks to this method, and countless innovations in this field, a typical hard drive nowadays operates on the nanometer scale. The electromagnetic head is barely 5 nm (about 2 strands of DNA thick) away from the platter itself. A modern hard drive can store 1.3 terabits of data per square inch as of 2020!

## Solid State Storage

There are no moving parts involved here. Examples are typically flash memory, EEPROMS etc. These rely on quantum physics magic to work, making electrons dance to access or modify the data.

### EEPROMs, EPROMs, PROMs and ROMs