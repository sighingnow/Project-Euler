Problem 164. Numbers for which no three consecutive digits have a sum greater than a given value
==============================================================================================

## 题目

How many $20$ digit numbers $n$ (without any leading zero) exist such that no three consecutive digits of n have a sum greater than $9$?

[Problem 164. Eight Divisors](https://projecteuler.net/problem=164 "Problem 164")

## 翻译

请问，存在多少个位数为 $20$（没有前导 $0$）,并且任意三个相邻数位之和不超过 $9$ 的数字？

[题目164：任意三个相邻数字位之和不超过给定值的数字。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/167-164 "题目164")

## 题解

答案(answer): 378158756814587

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_164():
    mem = [[[0 for k in range(0, 20)] for j in range(0, 10)] for i in range(0, 10)]

    def dp(a, b, s):
        '''memorize'''
        if s == 0:
            return 1
        if mem[a][b][s] == 0:
            for i in range(0, 9-(a+b)+1):
                mem[a][b][s] += dp(b, i, s-1)
        return mem[a][b][s]

    return sum([dp(0, i, 20-1) for i in range(1, 10)])

if __name__ == '__main__':
    print(euler_164())

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell
main :: IO ()
main = print euler_164

euler_164 :: Integer
euler_164 = sum [dp !! a !! b | a <- [1..9], b <- [0..9-a]] where
    mat = [[10-a-b | b<-[0..9-a]] | a<-[0..9]]
    dp = iterate digitsum mat !! 17 where
        digitsum x = [[sum [x!!b!!c | c<-[0..9-a-b]] | b<-[0..9-a]] | a<-[0..9]]
~~~

