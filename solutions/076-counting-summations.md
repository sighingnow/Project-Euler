Problem 76. Counting summations
========================================

## 题目

It is possible to write five as a sum in exactly six different ways:

    4 + 1
    3 + 2
    3 + 1 + 1
    2 + 2 + 1
    2 + 1 + 1 + 1
    1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two positive integers?

[Problem 76. Counting summations](https://projecteuler.net/problem=76 title="Problem 76")

## 翻译

5可以以6种方式写成至少两个正整数之和：

    4 + 1
    3 + 2
    3 + 1 + 1
    2 + 2 + 1
    2 + 1 + 1 + 1
    1 + 1 + 1 + 1 + 1

100可以以多少种方式写成至少两个正整数之和？

[题目76:100可以以多少种不同方式写成至少两个正整数的和？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/77-76100 title="题目76")

## 题解

答案(answer): 190569291

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_76():

    def partial(n):
        pool = [0] * n
        pool[0] = 1
        for i in range(1, n):
            for j in range(i, n):
                pool[j] = pool[j]+pool[j-i]
        return pool[n-1]

    return partial(100+1)-1

if __name__ == '__main__':
    print(euler_76())

# vim: set sw=4, ts=4
~~~

+ Haskell

~~~haskell
main :: IO ()
main = print euler_76

euler_76 :: Int
euler_76 = partial n n - 1
    where
        n           = 100
        partial _ 0 = 1
        partial 0 _ = 0
        partial i n = mem !! (i-1) !! n + if i <= n then mem !! i !! (n-i) else 0
            where
                mem = [[partial i n | n <- [0..]] | i <- [0..]]
~~~
