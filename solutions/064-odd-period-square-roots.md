Problem 64. Odd period square roots
========================================

## 题目

All square roots are periodic when written as continued fractions and can be written in the form:
$$\sqrt{N} = a_0+\frac{1}{a_1+\frac{1}{a_2+\frac{1}{a_3+\dots}}}$$
For example, let us consider $\sqrt{23}$:
$$\sqrt{23} = 4+\sqrt{23}-4=4+\frac{1}{\frac{1}{\sqrt{23}-4}} = 4+\frac{1}{1+\frac{\sqrt{23}-3}{7}}$$
If we continue we would get the following expansion:
$$\sqrt{23}=4+\frac{1}{1+\frac{1}{3+\frac{1}{1+\frac{1}{8+\dots}}}}$$
The process can be summarised as follows:

+ $a_0 = 4, \frac{1}{\sqrt{23}-4} = \frac{\sqrt{23}+4}{7}     = 1+\frac{\sqrt{23}-3}{7}$
+ $a_1 = 1, \frac{7}{\sqrt{23}-3} = \frac{7(\sqrt{23}+3)}{14} = 3+\frac{\sqrt{23}-3}{2}$
+ $a_2 = 3, \frac{2}{\sqrt{23}-3} = \frac{2(\sqrt{23}+3)}{14} = 1+\frac{\sqrt{23}-4}{7}$
+ $a_3 = 1, \frac{7}{\sqrt{23}-4} = \frac{7(\sqrt{23}+4)}{7}  = 8+\sqrt{23}-4$
+ $a_4 = 8, \frac{1}{\sqrt{23}-4} = \frac{\sqrt{23}+4}{7}     = 1+\frac{\sqrt{23}-3}{7}$
+ $a_5 = 1, \frac{7}{\sqrt{23}-3} = \frac{7(\sqrt{23}+3)}{14} = 3+\frac{\sqrt{23}-3}{2}$
+ $a_6 = 3, \frac{2}{\sqrt{23}-3} = \frac{2(\sqrt{23}+3)}{14} = 1+\frac{\sqrt{23}-4}{7}$
+ $a_7 = 1, \frac{7}{\sqrt{23}-4} = \frac{7(\sqrt{23}+4)}{7}  = 8+\sqrt{23}-4$

It can be seen that the sequence is repeating. For conciseness, we use the notation $\sqrt{23} = [4;(1,3,1,8)]$, to indicate that the block $(1,3,1,8)$ repeats indefinitely.

The first ten continued fraction representations of (irrational) square roots are:

+ $\sqrt{2}=[1;(2)],          \textit{ period } = 1$
+ $\sqrt{3}=[1;(1,2)],        \textit{ period } = 2$
+ $\sqrt{5}=[2;(4)],          \textit{ period } = 1$
+ $\sqrt{6}=[2;(2,4)],        \textit{ period } = 2$
+ $\sqrt{7}=[2;(1,1,1,4)],    \textit{ period } = 4$
+ $\sqrt{8}=[2;(1,4)],        \textit{ period } = 2$
+ $\sqrt{10}=[3;(6)],         \textit{ period } = 1$
+ $\sqrt{11}=[3;(3,6)],       \textit{ period } = 2$
+ $\sqrt{12}= [3;(2,6)],      \textit{ period } = 2$
+ $\sqrt{13}=[3;(1,1,1,1,6)], \textit{ period } = 5$

Exactly four continued fractions, for $N \le 13$, have an odd period.

How many continued fractions for $N \le 10000$ have an odd period?

[Problem 64. Odd period square roots](https://projecteuler.net/problem=64 title="Problem 64")

## 翻译

所有的平方根写作连分数的时候都是周期性的，并且可以写成如下形式：
$$\sqrt{N} = a_0+\frac{1}{a_1+\frac{1}{a_2+\frac{1}{a_3+\dots}}}$$
例如 $\sqrt{23}$:
$$\sqrt{23} = 4+\sqrt{23}-4=4+\frac{1}{\frac{1}{\sqrt{23}-4}} = 4+\frac{1}{1+\frac{\sqrt{23}-3}{7}}$$
如果继续下去我们得到如下展开式：
$$\sqrt{23}=4+\frac{1}{1+\frac{1}{3+\frac{1}{1+\frac{1}{8+\dots}}}}$$

这个过程可以被总结如下：

+ $a_0 = 4, \frac{1}{\sqrt{23}-4} = \frac{\sqrt{23}+4}{7}     = 1+\frac{\sqrt{23}-3}{7}$
+ $a_1 = 1, \frac{7}{\sqrt{23}-3} = \frac{7(\sqrt{23}+3)}{14} = 3+\frac{\sqrt{23}-3}{2}$
+ $a_2 = 3, \frac{2}{\sqrt{23}-3} = \frac{2(\sqrt{23}+3)}{14} = 1+\frac{\sqrt{23}-4}{7}$
+ $a_3 = 1, \frac{7}{\sqrt{23}-4} = \frac{7(\sqrt{23}+4)}{7}  = 8+\sqrt{23}-4$
+ $a_4 = 8, \frac{1}{\sqrt{23}-4} = \frac{\sqrt{23}+4}{7}     = 1+\frac{\sqrt{23}-3}{7}$
+ $a_5 = 1, \frac{7}{\sqrt{23}-3} = \frac{7(\sqrt{23}+3)}{14} = 3+\frac{\sqrt{23}-3}{2}$
+ $a_6 = 3, \frac{2}{\sqrt{23}-3} = \frac{2(\sqrt{23}+3)}{14} = 1+\frac{\sqrt{23}-4}{7}$
+ $a_7 = 1, \frac{7}{\sqrt{23}-4} = \frac{7(\sqrt{23}+4)}{7}  = 8+\sqrt{23}-4$

可以看出这个序列是重复的。简明起见，我们用 $\sqrt{23} = [4;(1,3,1,8)]$, 来表示 $(1,3,1,8)$ 这个部分不断重复出现。

前十个无理平方根的连续分数表示为：

+ $\sqrt{2}=[1;(2)],          \textrm{ period } = 1$
+ $\sqrt{3}=[1;(1,2)],        \textrm{ period } = 2$
+ $\sqrt{5}=[2;(4)],          \textrm{ period } = 1$
+ $\sqrt{6}=[2;(2,4)],        \textrm{ period } = 2$
+ $\sqrt{7}=[2;(1,1,1,4)],    \textrm{ period } = 4$
+ $\sqrt{8}=[2;(1,4)],        \textrm{ period } = 2$
+ $\sqrt{10}=[3;(6)],         \textrm{ period } = 1$
+ $\sqrt{11}=[3;(3,6)],       \textrm{ period } = 2$
+ $\sqrt{12}= [3;(2,6)],      \textrm{ period } = 2$
+ $\sqrt{13}=[3;(1,1,1,1,6)], \textrm{ period } = 5$

可以看出对于 $N \le 13$, 有四个连分数的周期是奇数。

对于 $N \le 10000$，有多少连分数的周期是奇数？

[题目64：$10000$ 以下的连分数中有多少拥有奇数周期？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/65-6410000 title="题目64")

## 题解

答案(answer): 1322

### 分析

首先，$a_0 = \lfloor \sqrt{N} \rfloor$，设分子$k_0 = 1$，以此为基础开始化简。若需要化简的项为 $\frac{k_x}{\sqrt{N}-a_x}$。化简过程：
$$\frac{k_x}{\sqrt{N}-a_x} = \frac{k_x \times (\sqrt{N}+a_x)}{N-{a_x}^2} = t + \frac{\sqrt{N}-a_{x+1}}{k_{x+1}}$$
其中，$\frac{\sqrt{N}-a_{x+1}}{k_{x+1}}$ 满足大于 $0$ 且保持最小且保证 $\sqrt{N}$ 前的系数为 $1$。
**一旦能找到重复出现的 $(a_t, k_t)$ 组合，就找到了循环节**。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt
from fractions import gcd

def euler_64():
    def iterate(n):
        a, k = int(sqrt(n)), 1
        if a*a == n: ## perfect square, only consider irrational numbers.
            return 0
        pool = set()
        while (a, k) not in pool:
            pool.add((a, k))
            assert((n-a*a) % k == 0) ## if not, the iteration can't continue.
            k = (n - a*a) // k     ## update k
            while sqrt(n)+a-k > 0:
                a -= k
            a = -a                 ## update a
        return len(pool)
    return len(filter(lambda t: t % 2 == 1, map(iterate, range(0, 10000+1))))

if __name__ == '__main__':
    t = time()
    print(euler_64(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
