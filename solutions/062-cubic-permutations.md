Problem 62. Cubic permutations
========================================

## 题目

The cube, $41063625 (345^3)$, can be permuted to produce two other cubes: $56623104 (384^3)$ and
$66430125 (405^3)$. In fact, $41063625$ is the smallest cube which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are cube.

[Problem 62. Cubic permutations](https://projecteuler.net/problem=62 title="Problem 62")

## 翻译

立方数 $41063625 (345^3)$ 通过排列可以得到两个另外的立方数: $56623104 (384^3)$ 和 $66430125 (405^3)$。 实际上 $41063625$ 是最小的三个（不多不少）排列是立方数的立方数。

找出最小的立方数，其五个（不多不少）排列是立方数。

[题目62：找出最小的立方数，使得它各位的排列中五个是立方数。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/63-62 title="题目62")

## 题解

答案(answer): 127035954683

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_62():
    def digit_tuple(n):
        digits = list(map(int, str(n)))
        return tuple(digits.count(i) for i in range(10))
    pool = {}
    n, k = 0, (0)
    while True:
        cube = n*n*n
        k = digit_tuple(cube)
        pool.setdefault(k, [])
        pool[k].append(cube)
        if len(pool[k]) == 5:
            break
        n = n + 1
    return pool[k][0]

if __name__ == '__main__':
    t = time()
    print(euler_62(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
