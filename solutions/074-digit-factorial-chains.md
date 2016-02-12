Problem 74. Digit factorial chains
========================================

## 题目

The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

$$1! + 4! + 5! = 1 + 24 + 120 = 145$$

Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such
loops that exist:

+ $169 \to 363601 \to 1454 \to 169$
+ $871 \to 45361 \to 871$
+ $872 \to 45362 \to 872$

It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

+ $69 \to 363600 \to 1454 \to 169 \to 363601 (\to 1454)$
+ $78 \to 45360 \to 871 \to 45361 (\to 871)$
+ $540 \to 145 (\to 145)$

Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?

[Problem 74. Digit factorial chains](https://projecteuler.net/problem=74 title="Problem 74")

## 翻译

数字145有一个著名的性质：其所有位上数字的阶乘和等于它本身。

$$1! + 4! + 5! = 1 + 24 + 120 = 145$$

169不像145那么有名，但是169可以产生最长的能够连接回它自己的数字链。事实证明一共有三条这样的链：

+ $169 \to 363601 \to 1454 \to 169$
+ $871 \to 45361 \to 871$
+ $872 \to 45362 \to 872$

不难证明每一个数字最终都将陷入一个循环。例如：

+ $69 \to 363600 \to 1454 \to 169 \to 363601 (\to 1454)$
+ $78 \to 45360 \to 871 \to 45361 (\to 871)$
+ $540 \to 145 (\to 145)$

从69开始可以产生一条有5个不重复元素的链，但是以一百万以下的数开始，能够产生的最长的不重复链包含60个项。

一共有多少条以一百万以下的数开始的链包含60个不重复项？

[题目74：包含60个不重复项的阶乘链有多少个？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/75-7460 title="题目74")

## 题解

答案(answer): 402

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import factorial

def euler_74():
    bound = 1000000
    x = bound * 3 ## maximum sum of factorial, just guess it.
    fact = map(factorial, range(10))
    ## memorize all factorials.
    facts = [0] * x
    facts[:10] = fact[:]
    for n in range(10, x):
        facts[n] = facts[n//10] + fact[n%10]
    cnt = 0
    for n in range(bound):
        m, chain = n, {}
        while m not in chain:
            chain[m] = 1
            m = facts[m]
        if chain.__len__() == 60:
            cnt += 1
    return cnt

if __name__ == '__main__':
    print(euler_74())

# vim: set sw=4, ts=4
~~~
