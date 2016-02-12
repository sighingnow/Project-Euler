Problem 56. Powerful digit sum
========================================

## 题目

A googol ($10^{100}$) is a massive number: one followed by one-hundred zeros; $100^{100}$ is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, $ab$, where $a, b < 100$, what is the maximum digital sum?

[Problem 56. Powerful digit sum](https://projecteuler.net/problem=56 title="Problem 56")

## 翻译

一个googol ($10^{100}$)是一个巨大的数字：1后面跟着100个0；$100^{100}$ 几乎是不可想象的大：1后面跟着200个0。它们虽然很大，但是它们的各位数之和却只有1。

考虑形如 $a^b$ 的数, 其中 $a, b < 100$，最大的各位和是多少？

[题目56：对于形如a的b次方的数字，找出最大的各位和。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/57-56ab title="题目56")

## 题解

答案(answer): 972

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_56():
    return max(sum(map(int, str(a**b))) for a in range(100) for b in range(100))

if __name__ == '__main__':
    t = time()
    print(euler_56(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
