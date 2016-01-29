Problem 80. Square root digital expansion
========================================

## 题目

It is well known that if the square root of a natural number is not an integer, then it is irrational. The decimal expansion of such
square roots is infinite without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of the first one hundred decimal
digits is 475.

For the first one hundred natural numbers, find the total of the digital sums of the first one hundred
decimal digits for all the irrational square roots.

[Problem 80. Square root digital expansion](https://projecteuler.net/problem=80 title="Problem 80")

## 翻译

众所周知，如果一个自然数的平方根不是整数，那么就是无理数。这样的平方根的小数部分是无限并且没有任何重复模式的。

2的平方根是 1.41421356237309504880..., 小数部分的前一百位和是475。

对于前一百个自然数，找出其中无理平方根的小数部分前一百位的总和。

[题目80：计算无理平方根小数部分的各位和。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/81-80 title="题目80")

## 题解

答案(answer): 40886

+ 分析

开平方算法。

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import sqrt

def euler_80():
    def calc_root_dot(n, m):
        t = int(sqrt(n))
        n -= t * t
        if n == 0:
            return 0
        c, x = t, 0
        for i in range(m):
            n, x = n*100, c * 20
            for k in range(9, -1, -1):
                if k*(x+k) < n:
                    c, n = c * 10 + k, n - k*(x+k)
                    break
        return sum(map(int, str(c)))
    return sum(map(lambda n: calc_root_dot(n, 99), range(0, 100)))

if __name__ == '__main__':
    print(euler_80())

# vim: set sw=4, ts=4
~~~
