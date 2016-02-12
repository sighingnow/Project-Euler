Problem 72. Counting fractions
========================================

## 题目

Consider the fraction, $\frac{n}{d}$, where n and d are positive integers. If $n < d$ and $HCF(n,d)=1$,
it is called a reduced proper fraction.

If we list the set of reduced proper fractions for $d \le 8$ in ascending order of size, we get:

$$1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8$$

It can be seen that there are $21$ elements in this set.

How many elements would be contained in the set of reduced proper fractions for $d \le 1,000,000$?

[Problem 72. Counting fractions](https://projecteuler.net/problem=72 title="Problem 72")

## 翻译

考虑分数 $\frac{n}{d}$, 其中 $n$ 和 $d$ 是正整数。如果 $n < d$ 并且最大公约数 $HCF(n,d)=1$, 它被称作一个最简真分数。

如果我们将 $d \le 8$ 的最简真分数按照大小的升序列出来，我们得到：

$$1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5 , 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8 $$

可知该集合中共有 $21$ 个元素。$d \le 1,000,000$ 的最简真分数集合中包含多少个元素？

[题目72：分母不超过一百万的最简真分数的集合中包含多少元素？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/73-72 title="题目72")

## 题解

答案(answer): 303963552391

### 分析

筛法，按照倍数关系进行排除不可能的组合数。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_72():
    bound = 1000000+1
    pool = list(range(bound))
    pool[1] = 0
    for i in range(2, bound):
        if pool[i] == i: ## i must be a prime.
            for j in range(i, bound, i):
                pool[j] = pool[j] - pool[j]//i
    return sum(pool)

if __name__ == '__main__':
    print(euler_72())

# vim: set sw=4, ts=4
~~~
