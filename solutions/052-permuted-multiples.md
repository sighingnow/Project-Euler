Problem 52. Permuted multiples
========================================

## 题目

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

[Problem 52. Permuted multiples](https://projecteuler.net/problem=52 title="Problem 52")

## 翻译

125874和它的二倍，251748, 包含着同样的数字，只是顺序不同。

找出最小的正整数x，使得 2x, 3x, 4x, 5x, 和6x都包含同样的数字。

[题目52：找出最小的正整数x，使得2x, 3x, 4x, 5x和6x都包含同样的数字。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/53-52x2x-3x-4x-5x6x title="题目52")

## 题解

答案(answer): 142857

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_52():
    def check(x):
        xc = sorted(str(x))
        return all(map(lambda i: xc == sorted(str(x*i)), range(2, 6+1)))
    n = 1
    while True:
        if check(n):
            break
        n = n + 1 ## update n.
    return n

if __name__ == '__main__':
    t = time()
    print(euler_52(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
