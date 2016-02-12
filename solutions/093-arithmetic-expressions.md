Problem 93. Arithmetic expressions
========================================

## 题目

By using each of the digits from the set, $\{1, 2, 3, 4\}$, exactly once, and making use of the four arithmetic
operations $(+, -, *, /)$ and brackets/parentheses, it is possible to form different positive integer targets.

For example,

+ $8 = (4 * (1 + 3)) / 2$
+ $14 = 4 * (3 + 1 / 2)$
+ $19 = 4 * (2 + 3) - 1$
+ $36 = 3 * 4 * (2 + 1)$

Note that concatenations of the digits, like $12 + 34$, are not allowed.

Using the set, $\{1, 2, 3, 4\}$, it is possible to obtain thirty-one different target numbers of which $36$ is the
maximum, and each of the numbers $1$ to $28$ can be obtained before encountering the first non-expressible number.

Find the set of four distinct digits, $a < b < c < d$, for which the longest set of consecutive positive integers,
$1$ to $n$, can be obtained, giving your answer as a string: $abcd$.

[Problem 93. Arithmetic expressions](https://projecteuler.net/problem=93 title="Problem 93")

## 翻译

通过使用集合 $\{1, 2, 3, 4\}$ 中每个数字一次（用且只用一次），以及四种算术运算 $(+, -, *, /)$ 和括号，我们可以得到不同的目标正整数。

例如：

+ $8 = (4 * (1 + 3)) / 2$
+ $14 = 4 * (3 + 1 / 2)$
+ $19 = 4 * (2 + 3) - 1$
+ $36 = 3 * 4 * (2 + 1)$

但是将相连接是不允许的，如 $12 + 34$。

使用集合 $\{1, 2, 3, 4\}$ 可以得到 $31$ 个目标数，其中最大的是 $36$。而且 $1$ 到 $28$ 中的每个数字都可以被表示，但是 $29$ 不能被表示。

找出四个不同 $1$ 位数的集合，$a < b < c < d$，能够形成最长的 $1$ 到 $n$ 的连续正整数集合。以 $abcd$ 的形式给出你的答案。

[题目93：利用四位数字以及算术法则，找出目标数的最长序列。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/94-93 title="题目93")

## 题解

答案(answer): 1258

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from itertools import permutations, combinations, combinations_with_replacement
from functools import reduce
from operator import add, sub, mul

def euler_93():
    calculator = [
        lambda a, b, c, _1, _2, _3, _4: c(b(a(_1, _2), _3), _4),
        lambda a, b, c, _1, _2, _3, _4: c(a(_1, _2), b(_3, _4)),
        lambda a, b, c, _1, _2, _3, _4: c(b(_1, a(_2, _3)), _4),
        lambda a, b, c, _1, _2, _3, _4: c(_1, b(a(_2, _3), _4)),
        lambda a, b, c, _1, _2, _3, _4: c(_1, b(_2, a(_3, _4))),
    ]

    def calc_values(ks):
        res = set()
        for fs in combinations_with_replacement([add, sub, mul, lambda x, y: x*1.0/y], 3):
            for a, b, c in permutations(fs):
                for calc in calculator:
                    try:
                        r = calc(a, b, c, *ks)
                    except:
                        pass
                    else:
                        res.add(r)
        return res

    def calc_conseq(ks):
        res, n = set(), 0
        for ps in permutations(ks):
            res = res | calc_values(ps)
        for n in range(1, max(res)+1):
            if not res.__contains__(n):
                break
        return n-1

    sl, ns = 0, None
    for ks in combinations(range(1, 10), 4):
        ret = calc_conseq(ks)
        if ret > sl:
            sl, ns = ret, ks
    return reduce(lambda acc, x: acc+str(x), ns, '')

if __name__ == '__main__':
    t = time()
    print(euler_93(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
