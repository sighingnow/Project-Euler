Problem 73. Counting fractions in a range
========================================

## 题目

Consider the fraction, $n/d$, where $n$ and $d$ are positive integers. If $ n \lt d$ and $HCF(n,d)=1$, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for $d le 8$ in ascending order of size, we get:

$$1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8$$

It can be seen that there are $3$ fractions between $1/3$ and $1/2$.

How many fractions lie between $1/3$ and $1/2$ in the sorted set of reduced proper fractions for $d \le 12,000$?

[Problem 73. Counting fractions in a range](https://projecteuler.net/problem=73 title="Problem 73")

## 翻译

考虑分数 $n/d$, 其中$n$ 和 $d$ 是正整数。如果 $ n \lt d$ 并且最大公约数 $HCF(n,d)=1$, 它被称作一个最简真分数。

如果我们将$d \le 8$的最简真分数按照大小的升序列出来，我们得到：

$$1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8$$

可以看出$1/3$和$1/2$之间共有$3$个分数。

在$d \le 12,000$的升序真分数列表中，$1/3$和$1/2$之间有多少个分数？

[题目73：在$1/3$和$1/2$之间有多少个最简真分数？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/74-731312 title="题目73")

## 题解

答案(answer): 7295372

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from fractions import gcd

def euler_73():
    bound = 12000
    cnt = 0
    for n in range(2, bound+1):
        for m in range(n//3+1, (n+1)//2):
            cnt += gcd(n, m) == 1 and 1 or 0
    return cnt

if __name__ == '__main__':
    print(euler_73())

# vim: set sw=4, ts=4
~~~
