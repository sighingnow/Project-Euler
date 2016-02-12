Problem 5. Smallest multiple
==================================

## 题目

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

[Problem 5. Smallest multiple](https://projecteuler.net/problem=5 "Problem 5")

## 翻译

2520是最小的能被1-10中每个数字整除的正整数。

最小的能被1-20中每个数整除的正整数是多少？

[题目5：找出最小的能被1-20中每个数整除的数](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/6-51-20 "题目5")

## 题解

答案(answer): 232792560

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8

def euler_5():

    def gcd(a, b):
        if(b == 0):
            return a
        return gcd(b, a % b)

    def lcm(a, b):
        return a * b // gcd(a, b)

    ans = 1
    for i in range(2, 21):
        ans = lcm(ans, i)
    return ans

if __name__ == '__main__':
    print(euler_5())

# vim: set sw=4, ts=4
~~~

