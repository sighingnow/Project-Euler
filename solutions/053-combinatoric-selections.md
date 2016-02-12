Problem 53. Combinatoric selections
========================================

## 题目

There are exactly ten ways of selecting three from five, $12345$:

$$123, 124, 125, 134, 135, 145, 234, 235, 245, \textrm{ and } 345$$

In combinatorics, we use the notation, $^5C_3 = 10$.

In general,

$$^nC_r =\frac{n!}{r!(n-r)!}, \textrm{ where } r \le n, n! = n\times(n-1)\times\dots\times3\times2\times1, \textrm{ and } 0! = 1.$$
It is not until $n = 23$, that a value exceeds one-million: $^{23}C_{10} = 1144066$.

How many, not necessarily distinct, values of $^nC_r, for $1 \le n \le 100$, are greater than one-million?

[Problem 53. Combinatoric selections](https://projecteuler.net/problem=53 title="Problem 53")

## 翻译

从五个数 $12345$ 中选出三个数一共有十种方法:

$$123, 124, 125, 134, 135, 145, 234, 235, 245, \textrm{ and } 345$$

在组合数学中我们用 $^5C_3 = 10$ 来表示.

概括来说：

$$^nC_r =\frac{n!}{r!(n-r)!}, \textrm{ where } r \le n, n! = n\times(n-1)\times\dots\times3\times2\times1, \textrm{ and } 0! = 1.$$
$n = 23$ 时产生第一个超过一百万的数: $^{23}C_{10} = 1144066$.

对于 $^nC_r$，$1 \le n \le 100$，有多少超过 $100$ 万的值？包括重复的在内。

[题目53:对于 $1 \le n \le 100, C(n,r)$ 有多少超过 $1000,000$？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/54-531n100cnr100 title="题目53")

## 题解

答案(answer): 4075

### 分析

使用杨辉三角快速迭代计算 $1 \le n \le 100$ 的所有的 $n \choose r$，时间复杂度为 $O(N^2)$。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_53():
    bound, limit = 100+1, 1000000
    pool = [[1]*(i+1)+[0] for i in range(bound)]
    def initialize():
        for i in range(1, bound):
            for j in range(1, i+1):
                pool[i][j] = pool[i-1][j-1]+pool[i-1][j]
    initialize()
    count = lambda line: len(filter(lambda k: k > limit, line))
    return sum(map(count, pool))

if __name__ == '__main__':
    t = time()
    print(euler_53(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
