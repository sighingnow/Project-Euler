Problem 66. Diophantine equation
========================================

## 题目

Consider quadratic Diophantine equations of the form:

$$x^2 – Dy^2 = 1$$

For example, when $D=13$, the minimal solution in $x$ is $6492 – 13 \times 1802 = 1$.

It can be assumed that there are no solutions in positive integers when $D$ is square.

By finding minimal solutions in $x$ for $D = \{2, 3, 5, 6, 7\}$, we obtain the following:

+ $3^2 – 2 \times 2^2 = 1$
+ $2^2 – 3 \times 1^2 = 1$
+ $9^2 – 5 \times 4^2 = 1$
+ $5^2 – 6 \times 2^2 = 1$
+ $8^2 – 7 \times 3^2 = 1$

Hence, by considering minimal solutions in $x$ for $D \le 7$, the largest $x$ is obtained when $D=5$.

Find the value of $D \le 1000$ in minimal solutions of $x$ for which the largest value of $x$ is obtained.

[Problem 66. Diophantine equation](https://projecteuler.net/problem=66 title="Problem 66")

## 翻译

考虑如下形式的二次丢番图方程：

$$x^2 – Dy^2 = 1$$

例如当 $D=13$ 时, $x$ 的最小解是 $6492 – 13 \times 1802 = 1$.

可以认为当 $D$ 时平方数时方程无正整数解。

通过寻找当 $D = \{ 2, 3, 5, 6, 7 \}$ 时 $x$ 的最小解，我们得到：

+ $3^2 – 2 \times 2^2 = 1$
+ $2^2 – 3 \times 1^2 = 1$
+ $9^2 – 5 \times 4^2 = 1$
+ $5^2 – 6 \times 2^2 = 1$
+ $8^2 – 7 \times 3^2 = 1$

因此对于 $D \le 7$, $x$ 的最小解的最大值在 $D=5$ 时取到。

找出 $D \le 1000$ 中使得 $x$ 的最小值取到最大的 $D$ 的值。

[题目66：丢番图方程。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/67-66x2-dy2-1 title="题目66")

## 题解

答案(answer): 661

### 分析

使用Chakravala Method迭代求解Pell's Equation的初始解。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_66():
    def pell(d):
        m, k, x, y, t = 1, 1, 1, 0, sqrt(d)
        while x*x-d*y*y != 1:
            '''
            The follow two lines ensure that x+m*y is divisable by k
            and m*m-d is minimal. This implementation is from
            <https://en.wikipedia.org/wiki/Chakravala_method>
            '''
            m = k * (m//k+1) - m
            m = m - (m-t)//k*k
            x, y, k = (m*x+d*y) / abs(k), (x+m*y) / abs(k), (m*m-d) / k
        return x

    bound = 1000
    ## When d is a perfect square, there's no solution in positive integers.
    ## An optimized solution is that only search in all prime numbers, why?
    not_square = lambda x: int(sqrt(x))*int(sqrt(x)) != x
    return max((pell(d), d) for d in filter(not_square, range(bound)))[1]

if __name__ == '__main__':
    t = time()
    print(euler_66(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
