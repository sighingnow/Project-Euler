Problem 6. Sum square difference
==================================

## 题目

The sum of the squares of the first ten natural numbers is,
$$1^2 + 2^2 + ... + 10^2 = 385$$
The square of the sum of the first ten natural numbers is,
$$(1 + 2 + ... + 10)^2 = 55^2 = 3025$$

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is
$$3025 - 385 = 2640.$$

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

[Problem 6. Sum square difference](https://projecteuler.net/problem=6 "Problem 6")

## 翻译

前十个自然数的平方和是：
$$1^2 + 2^2 + ... + 10^2 = 385$$
前十个自然数的和的平方是：
$$(1 + 2 + ... + 10)^2 = 55^2 = 3025$$
所以平方和与和的平方的差是 $$3025 - 385 = 2640.$$

找出前一百个自然数的平方和与和平方的差。

[题目6：找出最小的能被1-20中每个数整除的数](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/6-51-20 "题目6")

## 题解

答案(answer): 25164150

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8

def euler_6():
    return sum([i for i in range(1, 101)])**2 - sum([i**2 for i in range(1, 101)])

if __name__ == '__main__':
    print(euler_6())

~~~
