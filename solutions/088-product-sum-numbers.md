Problem 88. Product-sum numbers
========================================

## 题目

A natural number, $N$, that can be written as the sum and product of a given set of at least two natural numbers, ${a_1, a_2, ... , a_k}$
is called a product-sum number: $$ N = a_1 + a_2 + \dots + a_k = a_1 \times a_2 \times \dots \times a_k.$$

For example, $ 6 = 1 + 2 + 3 = 1 \times 2 \times 3 $.

For a given set of size, k, we shall call the smallest N with this property a minimal product-sum number. The minimal
product-sum numbers for sets of size, k = 2, 3, 4, 5, and 6 are as follows.

+ k=2: $ 4 = 2 \times 2 = 2 + 2 $
+ k=3: $ 6 = 1 \times 2 \times 3 = 1 + 2 + 3 $
+ k=4: $ 8 = 1 \times 1 \times 2 \times 4 = 1 + 1 + 2 + 4 $
+ k=5: $ 8 = 1 \times 1 \times 2 \times 2 \times 2 = 1 + 1 + 2 + 2 + 2 $
+ k=6: $ 12 = 1 \times 1 \times 1 \times 1 \times 2 \times 6 = 1 + 1 + 1 + 1 + 2 + 6 $

Hence for $2 \le k \le 6$, the sum of all the minimal product-sum numbers is $4+6+8+12 = 30$; note that 8 is only counted once
in the sum.

In fact, as the complete set of minimal product-sum numbers for $2 \le k \le 12$ is ${4, 6, 8, 12, 15, 16}$, the sum is 61.

What is the sum of all the minimal product-sum numbers for $2 \le k \le 12000$?

[Problem 88. Product-sum numbers](https://projecteuler.net/problem=88 title="Problem 88")

## 翻译

一个自然数$N$如果能写成一个两个元素以上的集合，${a_1, a_2, ... , a_k}$ ，中元素的积与和的话，该数字被称为积和数：
$$ N = a_1 + a_2 + \dots + a_k = a_1 \times a_2 \times \dots \times a_k.$$

例如：$ 6 = 1 + 2 + 3 = 1 \times 2 \times 3 $.

对于一个大小为k的集合，我们将最小的具有该性质的数字N成为一个最小积和数。k = 2, 3, 4, 5, 6的集合的最小积和数如下：

+ k=2: $ 4 = 2 \times 2 = 2 + 2 $
+ k=3: $ 6 = 1 \times 2 \times 3 = 1 + 2 + 3 $
+ k=4: $ 8 = 1 \times 1 \times 2 \times 4 = 1 + 1 + 2 + 4 $
+ k=5: $ 8 = 1 \times 1 \times 2 \times 2 \times 2 = 1 + 1 + 2 + 2 + 2 $
+ k=6: $ 12 = 1 \times 1 \times 1 \times 1 \times 2 \times 6 = 1 + 1 + 1 + 1 + 2 + 6 $

因此对于 $2 \le k \le 6$, 所有最小积和数的总和为 $4+6+8+12 = 30$; 注意8在求和时只计算一次。

事实上对于$2 \le k \le 12$，所有最小积和数的集合是${4, 6, 8, 12, 15, 16}$，其和为61。

对于$2 \le k \le 12000$，所有最小积和数的和是多少？

[题目88：考察不同大小集合的最小积和数。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/89-88 title="题目88")

## 题解

答案(answer): 7611457

+ 分析

首先确定上下界(区间：$(k~2k]$, k=1+1+1+1, 2k=1+1+1+...+2+k=2*k)，然后DFS。

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from functools import reduce

def euler_88():
    bound = 12000
    ## upper bound: 2*k, lower bound: k
    mps = [2*i for i in range(bound+1)] ## minimum product-sum

    def prodsum(n, s, nfactor, start):
        '''
        n: number
        s: sum
        nfactor: number of factors
        '''
        ## k: the number of 1 needed.
        k = n - s + nfactor
        if k < bound:
            mps[k] = min(mps[k], n)
            ## dfs
            for i in range(start, bound//n*2):
                prodsum(n*i, s+i, nfactor+1, i)
    prodsum(1, 1, 1, 2)
    return sum(set(mps[2:]))

if __name__ == '__main__':
    print(euler_88())

# vim: set sw=4, ts=4
~~~
