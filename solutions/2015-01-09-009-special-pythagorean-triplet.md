---
title: Problem 9. Special Pythagorean triplet
author: DHDave
date: 2015-01-09
layout: post
---

## 题目
A Pythagorean triplet is a set of three natural numbers, <i>a < b < c</i>, for which,

<center>$$a^2 + b^2 = c^2$$</center>

For example, 
<!--more-->
<center>$$32 + 42 = 9 + 16 = 25 = 52.$$</center>

There exists exactly one Pythagorean triplet for which <i>a + b + c = 1000.</i>

Find the product abc.

[Problem 9. Special Pythagorean triplet](https://projecteuler.net/problem=9 "Problem 9")

## 翻译
一个毕达哥拉斯三元组是一个包含三个自然数的集合，<i>a < b < c</i>，满足条件：

<center>$$a^2 + b^2 = c^2$$</center>

例如：

<center>$$32 + 42 = 9 + 16 = 25 = 52.$$</center>


已知存在并且只存在一个毕达哥拉斯三元组满足条件 <i>a + b + c = 1000.</i>

找出该三元组中abc的乘积。

[题目9：找出唯一的满足a + b + c = 1000的毕达哥拉斯三元组{a, b, c}](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/10-9a--b--c--1000a-b-c "题目9")

## 题解(Python)
```python
#! /usr/bin/env python
# -*- coding: utf-8

def solve():
    for a in range(3, 999):
        for b in range(2, a):
            for c in range(1, b):
                if a+b+c == 1000 and a*a==b*b+c*c:
                    return a*b*c
            
if __name__ == '__main__':
    ans = solve()
    print(ans)

# vim: set sw=4, ts=4
```

