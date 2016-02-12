Problem 1. Multiples of 3 and 5
==================================

## 题目

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

[Problem 1. Multiples of 3 and 5](https://projecteuler.net/index.php?section=problems&id=1 "Problem 1")

## 翻译

10以下的自然数中，属于3和5的倍数的有3,5,6和9，它们之和是23.

找出1000以下的自然数中，属于3和5的倍数的数字之和。

[题目1: 找出1000以下自然数中3和5的倍数之和。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/2-1100035 "题目1")

## 题解

答案(answer): 233168

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8

def euler_1():
    return sum([i if(i%3==0 or i%5==0) else 0 for i in range(0, 1000)])

if __name__ == '__main__':
    print(euler_1())

# vim: set sw=4, ts=4
~~~

### Haskell

~~~Haskell
main :: IO ()
main = print euler_01

euler_01 :: Int
euler_01 = (sum . filter times) [0..1000-1]
    where times n = rem n 3 == 0 || rem n 5 == 0
~~~
