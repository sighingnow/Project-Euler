---
title: Problem 98. Anagramic squares
author: He Tao
date: 2016-01-26
layout: post
---

## 题目

By replacing each of the letters in the word CARE with 1, 2, 9, and 6 respectively, we form a square number: $1296 = 36^2$. What is remarkable
is that, by using the same digital substitutions, the anagram, RACE, also forms a square number: $9216 = 96^2$. We shall call CARE (and RACE) a
square anagram word pair and specify further that leading zeroes are not permitted, neither may a different letter have the same digital value
as another letter.

Using [words.txt](../resource/p098-words.txt) (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, find all the square anagram word pairs (a palindromic word is NOT considered to be an anagram of itself).

What is the largest square number formed by any member of such a pair?

**NOTE**: All anagrams formed must be contained in the given text file.

[Problem 98. Anagramic squares](https://projecteuler.net/problem=98 "Problem 98")

## 翻译

将单词CARE中的字母分别用1,2,9和6替换，我们得到一个平方数：$1296 = 36^2$。令人惊奇的是，用同样的数字替换，CARE的变位词RACE，同样能够构成一个平方数：$9216 = 96^2$。
我们将CARE（和RACE）叫做一个平方变位词对，并规定前置的0是不允许的，同时也不允许不同的字母用相同的数字替换。

[words.txt](../resource/p098-words.txt) 包含将近两千个常用英语单词，找出其中所有的平方变位词对（一个回文单词不被认为是它自己的变位词）。

这些变位词对中能形成的最大的平方数是多少？

**注意**：所有的变位词必须是文件中包含的单词。

[题目98：考察能组成平方数的词和它们的变位词。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/99-98 title="题目98")

## 题解

答案(answer): 18769

+ 分析

首先，根据NOTE中的"All anagrams formed must be contained in the given text file."条件筛选出所有的anagramic pairs，
然后，枚举每个字母的值，判断是否满足完全平方，找出数值最大值。

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import floor, sqrt
from functools import reduce
from itertools import permutations

def euler_98():
    def gen_replace(s):
        alphas = list(dict(zip(s, s)).keys())
        return [dict(zip(alphas, d)) for d in permutations(range(1, 10), len(s))]

    def is_square(s, d):
        x = reduce(lambda a, b: a*10+b, [d[c] for c in s], 0)
        t = floor(sqrt(x))
        return (t*t == x, x)

    def calc_max(w, a):
        mapping = gen_replace(w)
        result = 0
        for m in mapping:
            t, s = is_square(w, m), is_square(a, m)
            result = t[0] and s[0] and max(result, t[1], s[1]) or result
        return result

    words = [(w[1:-1], sorted(w[1:-1])) for w in open('p098-words.txt').read().split(',')]
    ## select all anagrams.
    anagrams = []
    while words:
        w = words.pop()
        anagrams += [(w[0], a[0]) for a in words if w[1] == a[1]]
    return max(map(lambda (w, a): calc_max(w, a), anagrams))

if __name__ == '__main__':
    print(euler_98())

# vim: set sw=4, ts=4
~~~

