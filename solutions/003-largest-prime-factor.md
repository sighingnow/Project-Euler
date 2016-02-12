Problem 3. Largest prime factor
==================================

## 题目

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

[Problem 3. Largest prime factor](https://projecteuler.net/problem=3 "Problem 3")

## 翻译

13195的质数因子有5,7,13和29.

600851475143的最大质数因子是多少？

[题目3：找出一个合数的最大质数因子](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/4-3 "题目3")

## 题解

答案(answer): 6857

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8

def euler_3():
    num, ans = 600851475143, 2
    while ans < num:
        while num % ans == 0:
            num //= ans
        ans += 1
    return num

if __name__ == '__main__':
    print(euler_3())

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell
import Data.List

main :: IO ()
main = print euler_3

euler_3 :: Int
euler_3 = last $ primefactors 600851475143

primefactors :: Int -> [Int]
primefactors n = factor n primes where
    factor n (p:ps)
        | p * p > n         = [n]
        | n `mod` p == 0    = p : factor (n `div` p) (p:ps)
        | otherwise         = factor n ps
    primes = 2 : filter (null . tail . primefactors) [3, 5 ..]
~~~
