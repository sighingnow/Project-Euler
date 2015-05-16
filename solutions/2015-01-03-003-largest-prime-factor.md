---
title: Problem 3. Largest prime factor
author: DHDave
date: 2015-01-03
layout: post
---

## 题目
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

[Problem 3. Largest prime factor](https://projecteuler.net/problem=3 "Problem 3")
<!--more-->
## 翻译
13195的质数因子有5,7,13和29.

600851475143的最大质数因子是多少？

[题目3：找出一个合数的最大质数因子](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/4-3 "题目3")

## 题解(Python)
```python
#! /usr/bin/env python
# -*- coding: utf-8

if __name__ == '__main__':
    num, ans = 600851475143, 2
    while ans < num:
        while num % ans == 0:
            num //= ans
        ans += 1
    print(num)

# vim: set sw=4, ts=4
```

