Problem 86. Cuboid route
========================================

## 题目

A spider, S, sits in one corner of a cuboid room, measuring 6 by 5 by 3, and a fly, F, sits in the opposite corner. By travelling on the
surfaces of the room the shortest "straight line" distance from S to F is 10 and the path is shown on the diagram.

However, there are up to three "shortest" path candidates for any given cuboid and the shortest route doesn't always have integer length.

It can be shown that there are exactly 2060 distinct cuboids, ignoring rotations, with integer dimensions, up to a maximum size of
M by M by M, for which the shortest route has integer length when M = 100. This is the least value of M for which the number of solutions
first exceeds two thousand; the number of solutions when M = 99 is 1975.

Find the least value of M such that the number of solutions first exceeds one million.

[Problem 86. Cuboid route](https://projecteuler.net/problem=86 title="Problem 86")

## 翻译

一只蜘蛛S坐在一个6 * 5 * 3的长方体屋子的一个角落里，一个苍蝇F坐在与之相对的角落里。如果只允许在屋子的表面行走的话，从S到F的最短“直线”距离是10，路线在图中标
出。

但是，每个长方体都有三条可能的最短路径，而且最终的最短路径并不一定是整数。

考虑所有整数边长的长方体屋子，最大不超过M*M*M，当M=100时一共有2060个长方体的最短路径是整数，而且这也是解超过2000的最小的M；M=99时又1975个长方体的最短路径
是整数。

找出解超过一百万的最小的M。

[题目86：考察立方体两个角落间的最短距离。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/87-86 title="题目86")

## 题解

答案(answer): 1818

+ 分析

枚举M，令最长边的长度为 M，再枚举另外两条边的长度之和。

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import sqrt

def euler_86():
    def perfect_square(u, v):
        s = u*u+v*v
        t = int(sqrt(s))
        return s == t * t
    bound = 1000000
    m, c = 0, 0
    while ss < L:
        m += 1
        for x in range(2, m+1):
            if perfect_square(m, x):
                c += x//2
        for x in range(m+1, 2*m):
            if perfect_square(m, x):
                c += (2*m+2-x)//2
    return m

if __name__ == '__main__':
    print(euler_86())

# vim: set sw=4, ts=4
~~~
