Problem 63. Powerful digit counts
========================================

## 题目

The 5-digit number, $16807=7^5$, is also a fifth power. Similarly, the 9-digit number, $134217728=8^9$, is a ninth power.

How many $n-digit$ positive integers exist which are also an $n_{th}$ power?

[Problem 63. Powerful digit counts](https://projecteuler.net/problem=63 title="Problem 63")

## 翻译

五位数 $16807=7^5$ 同时也是一个数的五次方。类似的，九位数 $134217728=8^9$,同时也是一个数的九次方。

有多少 $n$ 位正整数同时也是某个数的 $n$ 次方？

[题目63：有多少 $n$ 位正整数同时也是一个数的 $n$ 次方？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/64-63nn title="题目63")

## 题解

答案(answer): 49

### 分析

设底数为 $k (k \in [1, 9])$，指数为 $m (m \in N^+)$，求解对于每一个 $k$，都多少个 $m$，满足 $k^m$ 是一个 $m$ 位的数。设这个值为 $a \times 10^m = k^m$，$k, m, a$ 满足：$$a \times 10^{m-1} \le k^m \textrm{ and } 1 \le a < 10.$$
因此：$$1 \le \frac{k^m}{10^{m-1}} < 10.$$
化简，得：$$m \le \frac{1}{1-\log_{10}{k}}.$$
$m$ 的取值为正整数，因此 $m$ 的解的个数为：$$ count(m) = \lfloor \frac{1}{1-\log_{10}{k}} \rfloor.$$

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import log10

def euler_63():
    return sum(int(1/(1-log10(k))) for k in range(1, 10))

if __name__ == '__main__':
    t = time()
    print(euler_63(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
