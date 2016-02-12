Problem 31. Coin sums
========================

## 题目

In England the currency is made up of pound, $\pounds$, and pence, p, and there are eight coins in general circulation:

$$1p, 2p, 5p, 10p, 20p, 50p, \pounds 1 (100p) \textit{ and } \pounds 2 (200p).$$

It is possible to make $\pounds 2$ in the following way:

$$1 \times \pounds 1 + 1 \times 50p + 2 \times 20p + 1 \times 5p + 1 \times 2p + 3 \times 1p.$$

How many different ways can $\pounds 2$ be made using any number of coins?

[Problem 31. Coin sums](https://projecteuler.net/problem=31 "Problem 31")

## 翻译

在英国，货币是由英镑 $\pounds$，便士p构成的。一共有八种钱币在流通：

$$1p, 2p, 5p, 10p, 20p, 50p, \pounds 1 (100p) \textit{ and } \pounds 2 (200p).$$

要构造 $\pounds 2$ 可以用如下方法：

$$1 \times \pounds 1 + 1 \times 50p + 2 \times 20p + 1 \times 5p + 1 \times 2p + 3 \times 1p.$$

允许使用任意数目的钱币，一共有多少种构造 $\pounds 2$ 的方法？

[题目31：考察英国货币面值的组合问题。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/32-31 "题目31")

## 题解

答案(answer): 73682

### 分析

动态规划。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_31():
    dp = [0 for i in range(0, 201)]
    buf = [1, 2, 5, 10, 20, 50, 100, 200]
    dp[0] = 1
    for i in range(0, 8):
        for j in range(200, 0, -1):
            for k in range(j//buf[i], 0, -1):
                if dp[j-k*buf[i]] > 0:
                    dp[j] += dp[j-k*buf[i]]
    return dp[200]

if __name__ == '__main__':
    print(euler_31())

# vim: set sw=4, ts=4
~~~

### Better Solution (faster, in Python):

~~~python
# more optimized algorithm.
def euler_31():
    dp = [0 for i in range(0, 201)]
    coin = [1, 2, 5, 10, 20, 50, 100, 200]
    dp[0] = 1
    money = 200
    for c in coin:
        for j in range(c, money+1):
            dp[j] += dp[j-c]
    return dp[200]

if __name__ == '__main__':
    print(euler_31())
~~~
