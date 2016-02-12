Problem 57. Square root convergents
========================================

## 题目

It is possible to show that the square root of two can be expressed as an infinite continued fraction.

$$\sqrt{2} = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213 \dots$$

By expanding this for the first four iterations, we get:

+ $1 + 1/2 = 3/2 = 1.5$
+ $1 + 1/(2 + 1/2) = 7/5 = 1.4$
+ $1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666 \dots$
+ $1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379 \dots$

The next three expansions are $99/70$, $239/169$, and $577/408$, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

[Problem 57. Square root convergents](https://projecteuler.net/problem=57 title="Problem 57")

## 翻译

$2$ 的平方根可以被表示为无限延伸的分数：

$$\sqrt{2} = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213 \dots$$

将其前四次迭代展开，我们得到：

+ $1 + 1/2 = 3/2 = 1.5$
+ $1 + 1/(2 + 1/2) = 7/5 = 1.4$
+ $1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666 \dots$
+ $1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379 \dots$

接下来三次迭代的展开是 $99/70$, $239/169$，和 $577/408$, 但是第八次迭代的展开, $1393/985$, 是第一个分子的位数超过分母的位数的例子。

在前1000次迭代的展开中，有多少个的分子位数超过分母位数？

[题目57：考察2的平方根的展开。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/58-572 title="题目57")

## 题解

答案(answer): 153

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import log10

def euler_57():
    bound = 1000
    num, den = 1, 1 ## numerator and denominator
    cnt = 0
    for i in range(bound):
        num, den = num+2*den, num+den
        if int(log10(num)) > int(log10(den)):
            cnt += 1
    return cnt

if __name__ == '__main__':
    t = time()
    print(euler_57(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
