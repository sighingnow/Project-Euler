Problem 78. Coin partitions
========================================

## 题目

Let p(n) represent the number of different ways in which n coins can be separated into piles. For example, five coins can separated into piles in exactly seven different ways, so p(5)=7.

    OOOOO
    OOOO   O
    OOO   OO
    OOO   O   O
    OO   OO   O
    OO   O   O   O
    O   O   O   O   O

Find the least value of n for which p(n) is divisible by one million.

[Problem 78. Coin partitions](https://projecteuler.net/problem=78 title="Problem 78")

## 翻译

用 p(n) 表示 n 个硬币可以被划分成堆的方式。例如，5个硬币可以被用7种方式划分成堆，所以p(5)=7。

    OOOOO
    OOOO   O
    OOO   OO
    OOO   O   O
    OO   OO   O
    OO   O   O   O
    O   O   O   O   O

找到 p(n)可以被一百万整除的最小的 n 。

[题目78：考察硬币划分的方式数量。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/79-78 title="题目78")

## 题解

答案(answer): 55374

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_78():

    m = 1000000

    def search(n):
        pool = [0]*n
        pool[0] = 1
        for i in range(1, n):
            for j in range(i, n):
                pool[j] = (pool[j]+pool[j-i]) % m
        for i in range(1, n):
            if pool[i] % m == 0:
                return i
        return -1

    n, k = 1, 1
    while True:
        n, k = n*2, search(n*2)
        if k != -1:
            break
    return k

if __name__ == '__main__':
    print(euler_78())

# vim: set sw=4, ts=4
~~~
