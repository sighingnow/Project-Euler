---
title: Problem 4. Largest palindrome product
author: DHDave
date: 2015-01-04
layout: post
---

## 题目
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

[Problem 4. Largest prime factor](https://projecteuler.net/problem=4 "Problem 4")
<!--more-->
## 翻译
一个回文数指的是从左向右和从右向左读都一样的数字。最大的由两个两位数乘积构成的回文数是9009 = 91 * 99.

找出最大的有由两个三位数乘积构成的回文数。

[题目4：找出由两个三位数乘积构成的回文](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/5-4 "题目4")

## 题解(Python)
```python
#! /usr/bin/env python
# -*- coding: utf-8

def main():
    ans = -1
    for i in range(999, 99, -1):
        for j in range(999, 99, -1):
            t = i * j
            a, b= list(str(t)), list(str(t))
            a.reverse()
            if a == b:
                ans = max(ans, t)
    return ans
                
if __name__ == '__main__':
    ans = main()
    print(ans)

# vim: set sw=4, ts=4
```

