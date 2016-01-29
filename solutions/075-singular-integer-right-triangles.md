Problem 75. Singular integer right triangles
========================================

## 题目

It turns out that 12 cm is the smallest length of wire that can be bent to form an integer sided right angle
triangle in exactly one way, but there are many more examples.

+ 12 cm: (3,4,5)
+ 24 cm: (6,8,10)
+ 30 cm: (5,12,13)
+ 36 cm: (9,12,15)
+ 40 cm: (8,15,17)
+ 48 cm: (12,16,20)

In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer sided right angle triangle, and other lengths allow more than one solution to be found; for example, using 120 cm it is possible to form exactly three different integer sided right angle triangles.

+ 120 cm: (30,40,50), (20,48,52), (24,45,51)

Given that L is the length of the wire, for how many values of L <= 1,500,000 can exactly one integer sided right angle triangle be formed?

[Problem 75. Singular integer right triangles](https://projecteuler.net/problem=75 title="Problem 75")

## 翻译

事实证明12 cm是最短的只能够以一种方式弯曲成整数边直角三角形的电线长度。但是还有很多其他例子：

+ 12 cm: (3,4,5)
+ 24 cm: (6,8,10)
+ 30 cm: (5,12,13)
+ 36 cm: (9,12,15)
+ 40 cm: (8,15,17)
+ 48 cm: (12,16,20)

与之相反，有一些长度，例如20cm，不能够弯曲形成整数边的直角三角形。而其他的一些长度则可以以多于一种的方式弯曲成整数边直角三角形；例如，120cm可以构成三种不同的整数边直角三角形。

+ 120 cm: (30,40,50), (20,48,52), (24,45,51)

L为电线的长度，对于 L <= 1,500,000，有多少个只能以一种方式构成整数边直角三角形？

[题目75：找出只能以一种方式构成直角三角形的电线长度的数目。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/76-75 title="题目75")

## 题解

答案(answer): 161667

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import sqrt
from fractions import gcd

def euler_75():
    '''Euclid's formula.'''
    bound = 1500000
    x = int(sqrt(bound))
    pool = [0]*bound
    for i in range(1, x, 2):
        for j in range(2, x-i, 2):
            if gcd(i, j) == 1: ## coprime
                s = abs(j*j-i*i) + 2 * i * j + i * i + j * j
                for k in range(s, bound, s):
                    ## all pythagorean triplets
                    pool[k] += 1
    return pool.count(1)

if __name__ == '__main__':
    print(euler_75())

# vim: set sw=4, ts=4
~~~
