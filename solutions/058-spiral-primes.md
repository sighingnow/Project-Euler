Problem 58. Spiral primes
========================================

## 题目

Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

    37 36 35 34 33 32 31
    38 17 16 15 14 13 30
    39 18  5  4  3 12 29
    40 19  6  1  2 11 28
    41 20  7  8  9 10 27
    42 21 22 23 24 25 26
    43 44 45 46 47 48 49

It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of $8/13 \approx 62\%$.

If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below $10\%$?

[Problem 58. Spiral primes](https://projecteuler.net/problem=58 title="Problem 58")

## 翻译

从1开始逆时针旋转，可以得到一个边长为7的螺旋正方形。

    37 36 35 34 33 32 31
    38 17 16 15 14 13 30
    39 18  5  4  3 12 29
    40 19  6  1  2 11 28
    41 20  7  8  9 10 27
    42 21 22 23 24 25 26
    43 44 45 46 47 48 49

有趣的是奇数的平方数都处于右下对角线上。更有趣的是，对角线上的13个数字中有8个质数，其百分比是 $8/13 \approx 62\%$。

如果在上面的螺旋正方形上再加一层，可以得到一个边长为9的螺旋正方形。如果这个过程继续，到螺旋正方形的边长为多少时，对角线上的质数百分比第一次降到 $10\%$ 以下？

[题目58：考察螺旋网格中对角线上质数的数量。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/59-58 title="题目58")

## 题解

答案(answer): 26241

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_58():
    def is_prime(n):
        '''Detect if n is a prime number.'''
        if n <= 1: return False
        if n <= 3: return True
        if n % 2 == 0 or n % 3 == 0: return False
        x, k = int(sqrt(n)), 5
        while k <= x:
            if n % k == 0 or n % (k+2) == 0:
                return False
            k += 6
        return True

    a, b, m, n = 0, 1, 1, 2
    while True:
        for i in range(0, 4):
            a += is_prime(m+n*i) and 1 or 0
        b += 4
        if 10*a < b:
            break
        m, n = m + n*4, n+2
    return n+1

if __name__ == '__main__':
    t = time()
    print(euler_58(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
