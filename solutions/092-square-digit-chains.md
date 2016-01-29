Problem 92. Square digit chains
========================================

## 题目

A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

For example,

$$ 44 \to 32 \to 13 \to 10 \to 1 \to 1 $$
$$ 85 \to 89 \to 145 \to 42 \to 20 \to 4 \to 16 \to 37 \to 58 \to 89 $$

Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

How many starting numbers below ten million will arrive at 89?

[Problem 92. Square digit chains](https://projecteuler.net/problem=92 title="Problem 92")

## 翻译

通过将一个数各位的平方不断相加，直到遇到已经出现过的数字，可以形成一个数字链。

例如：

$$ 44 \to 32 \to 13 \to 10 \to 1 \to 1 $$
$$ 85 \to 89 \to 145 \to 42 \to 20 \to 4 \to 16 \to 37 \to 58 \to 89 $$

因此任何到达1或89的数字链都会陷入无限循环。令人惊奇的是，以任何数字开始，最终都会到达1或89。

以一千万以下的数字n开始，有多少个n会到达89？

[题目92：考察具有有趣性质的平方数链。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/93-92 title="题目92")

## 题解

答案(answer): 8581146

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_92():
    bound = 10000000
    mark, squares = [0] * bound, [0]*bound

    def solve(n):
        if mark[n] == 0:
            if mark[squares[n]] == 0:
                mark[squares[n]] = solve(squares[n])
            mark[n] = mark[squares[n]]
        return mark[n]

    for i in range(10):
        squares[i] = i*i
    for i in range(10, bound):
        squares[i] = squares[i//10]+(i%10)*(i%10)

    mark[1], mark[89] = 1, 89
    cnt = 0
    for i in range(1, bound):
        if solve(i) == 89:
            cnt += 1
    return cnt

if __name__ == '__main__':
    print(euler_92())

# vim: set sw=4, ts=4
~~~
