Problem 71. Ordered fractions
========================================

## 题目

Consider the fraction, $\frac{n}{d}$, where $n$ and $d$ are positive integers. If $n < d$ and $HCF(n,d)=1$, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for $d \le 8$ in ascending order of size, we get:

$$1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8 $$

It can be seen that $\frac{2}{5}$ is the fraction immediately to the left of $\frac{3}{7}$.

By listing the set of reduced proper fractions for $d \le 1,000,000$ in ascending order of size, find the numerator of the fraction immediately to the left of $\frac{3}{7}$.

[Problem 71. Ordered fractions](https://projecteuler.net/problem=71 title="Problem 71")

## 翻译

考虑分数 $\frac{n}{d}$, 其中 $n$ 和 $d$ 是正整数。如果 $n < d$ 并且最大公约数 $HCF(n,d)=1$, 它被称作一个最简真分数。

如果我们将 $d \le 8$ 的最简真分数按照大小的升序列出来，我们得到：

$$1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8$$

可以看出 $\frac{2}{5}$ 是 $\frac{3}{7}$ 左边的第一个分数。

如果将 $d \le 1,000,000$ 的真分数按照大小升序列出，$\frac{3}{7}$ 左边第一个分数的分子是多少？

[题目71：将最简真分数按照升序排列。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/72-71 title="题目71")

## 题解

答案(answer): 428570

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time
from fractions import gcd

def euler_71():
    bound = 1000000
    a = bound//7*3
    b = bound//7*7
    k = gcd(a-1, b)
    return (a-1)//k

if __name__ == '__main__':
    t = time()
    print(euler_71(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
