Problem 51. Prime digit replacements
========================================

## 题目

By replacing the $1^{st}$ digit of the $2-digit$ number $*3$, it turns out that six of the nine possible values: $$13, 23, 43, 53, 73, \textrm{ and } 83$$ are all prime.

By replacing the $3^{rd}$ and $4^{th}$ digits of $56**3$ with the same digit, this $5-digit$ number is the first example having seven primes among the ten generated numbers, yielding the family: $$56003, 56113, 56333, 56443, 56663, 56773, and 56993.$$
Consequently $56003$, being the first member of this family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

[Problem 51. Prime digit replacements](https://projecteuler.net/problem=51 title="Problem 51")

## 翻译

通过置换 $*3$ 的第一位得到的 $9$ 个数中，有六个是质数：$$13,23,43,53，73 \textrm{ and } 83.$$

通过用同样的数字置换 $$56**3$$ 的第三位和第四位，这个五位数是第一个能够得到七个质数的数字，
得到的质数是：$$56003, 56113, 56333, 56443, 56663, 56773, \textrm{ and }56993.$$
因此其中最小的 $56003$ 就是具有这个性质的最小的质数。

找出最小的质数，通过用同样的数字置换其中的一部分（不一定是相邻的部分），能够得到八个质数。

[题目51：找出最小的能够通过改变同一部分得到八个质数的质数。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/52-51 title="题目51")

## 题解

答案(answer): 121313

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from itertools import combinations
from functools import reduce

def euler_51():
    limit, xl = 2000000, 8

    mark = [True] * (limit + 1)

    def prime_mark_sieve(bound):
        '''
        Mark all prime numbers in specified range.
        '''
        mark[0] = mark[1] = False
        k = 2
        while k < bound:
            for i in range(k+k, bound+1, k):
                mark[i] = False
            k = k + 1
            while k < bound and not mark[k]:
                k += 1

    prime_mark_sieve(limit)

    list_to_int = lambda xs: reduce(lambda acc, x: acc*10+x, xs, 0)
    int_to_list = lambda x: list(map(int, str(x)))

    def check(k):
        def group(x):
            d = {}
            zs = zip(x, range(len(x)))
            for k, v in zs:
                d.setdefault(k, [])
                d[k].append(v)
            return d.values()

        def gen_replace_pos(l):
            xs = []
            for kc in range(1, len(l)+1):
                xs += combinations(l, kc)
            return xs

        def do_replace(x, r):
            cnt = 0
            for i in range(0, 10):
                xr = x
                if i == 0 and r[0] == 0:
                    continue
                for p in r:
                    xr[p] = i
                cnt += mark[list_to_int(xr)] and 1 or 0
            return cnt

        k = int_to_list(k)
        for p in group(k):
            for r in gen_replace_pos(p):
                if do_replace(k, r) >= xl:
                    return True
        return False

    x = -1
    for x in range(limit):
        if mark[x] and check(x):
            break
    return x

if __name__ == '__main__':
    t = time()
    print(euler_51(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
