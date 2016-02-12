Problem 77. Prime summations
========================================

## 题目

It is possible to write ten as the sum of primes in exactly five different ways:

    7 + 3
    5 + 5
    5 + 3 + 2
    3 + 3 + 2 + 2
    2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over five thousand different ways?

[Problem 77. Prime summations](https://projecteuler.net/problem=77 title="Problem 77")

## 翻译

10可以以5种方式写成质数之和：

    7 + 3
    5 + 5
    5 + 3 + 2
    3 + 3 + 2 + 2
    2 + 2 + 2 + 2 + 2

第一个能够以五千种以上的方式写成质数之和的数是多少？

[题目77：最小的可以以五千种以上的方式写成质数之和的数是多少？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/78-77 title="题目77")

## 题解

答案(answer): 71

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import sqrt

def euler_77():

    bound = 5000

    def is_prime(n):
        if n == 0 or n == 1:
            return False
        if n == 2:
            return True
        for i in range(2, int(sqrt(n))+1):
            if n % i == 0:
                return False
        return True

    def search(n):
        pool = [0] * n
        pool[0] = 1
        for i in range(1, n):
            if not is_prime(i):
                continue
            for j in range(i, n):
                pool[j] = pool[j]+pool[j-i]
        for i in range(1, n):
            if pool[i] > bound:
                return i
        return -1

    n, k = 1, 1
    while True:
        n, k = n*2, search(n*2)
        if k != -1:
            break
    return k

if __name__ == '__main__':
    print(euler_77())

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell
main :: IO ()
main = print euler_77

-- | Analysis:
--
-- * P(i, 0) = 1 for all i.
-- * P(0, n) = 0 for all n > 0.
-- * If i is 1 or composite then P(i, n) = P(i - 1, n).
-- * Otherwise i is prime:
--   * If i <= n then P(i, n) = P(i - 1, n) + P(i, n - i).
--   * Else           P(i, n) = P(i - 1, n).

euler_77 :: Int
euler_77 = head $ dropWhile (\n -> partial n n <= bound) [0..]
    where
        bound       = 5000
        partial _ 0 = 1
        partial 0 _ = 0
        partial i n = mem !! (i-1) !! n + if (i <= n && prime i) then mem !! i !! (n-i) else 0
            where
                mem     = [[partial i n | n <- [0..]] | i <- [0..]]
                prime n = n >= 2 && null [() | k <- [2..n-1], mod n k == 0]
~~~
