# On Abstractions And How I Approach Learning

> Written in January 15, 2026


This note will discuss my methods of learning and how I manage abstract concepts.

## The first contact

Usually, when I first approach content that I have never encountered before, I immediately go to its source and try to search for the best references possible. To be more clear and non-generic, I will give an example.

### The Bitmap Parser

One of my recent projects was a bitmap parser written in pure C++ (you can check it here on this website in the projects section, or directly on my [GitHub](https://github.com/carlosvts/raw-image-processor)), without the use of any libraries. At the beginning, I _didn't have any idea_ of how this worked, how a bitmap works, or even how to start. So my initial step was searching for renowned references and trying to build my foundations. I found some good resources with just a few minutes of searching. After some hours, I had a way to start coding and developing the project. After some days (and debugs), the bitmap was finally done.

## Abstraction as a temporary tool

In my journey of learning how to code, I realized that many websites and video tutorials use a lot of abstractions to explain concepts. That — in my opinion — is awesome! But it can lead to some misunderstandings, and I will explain why I like to say abstraction is a great temporary learning tool.

When you know nothing about a topic, using abstractions and real-life examples — like associating a doubly linked list with a train made of connected wagons (as you will see if you read my note about the difficulty of implementing a custom `malloc`) — is a great way to start learning. Having some “physical” concept that you can imagine in real life makes a good starting point to jump in at the beginning.

The problem is that, after some point, you can’t keep using these types of abstractions if you want a deep understanding of a topic. For example, I started my development journey with Python 3.10. It’s an awesome language for a variety of purposes (including getting started with coding), but it abstracts many programming concepts that — if you want to understand more about how computers work — require you to jump off the abstraction boat and move toward lower-level languages.

In Python, you simply type `print("Hello World")` and voilà, you have a Hello World in your terminal. But do you really understand how that text was displayed in the terminal? If you use a low-level language, like C or Assembly, even though they are more difficult to swallow at first and require more steps to do “simpler” things, you can actually **understand how a computer behaves**.

So that is my point. Yes, use abstractions. Yes, use analogies. Yes, use whatever tool you need to understand a topic. But if you want a deep understanding, you need to adopt a low-level approach at some point.

And this doesn’t apply only to programming. You can take math as an example. Most people create methods and abstractions for concepts like the butterfly method for fractions. If you apply them, you can manage to multiply or add fractions — but do you really understand how operations with fractions work?

## What this means for my notes?

All of the notes on this website will reflect my journey as a software developer. Some of them will have a more “dry and straightforward” approach; others will follow a more essayistic tone; some will mix both. The goal here is to use abstractions as tools that will slowly be replaced by a more low-level way of thinking. Abstraction ends at some point; fundamentals remain.


> To understand a program, you must become the machine and the program  
> — Alan Perlis