---
title: Problem 95. Amicable chains
author: He Tao
date: 2016-01-26
layout: post
---

## 题目

The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7,
and 14. As the sum of these divisors is equal to 28, we call it a perfect number.

Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of 284 is 220, forming a chain of two numbers.
For this reason, 220 and 284 are called an amicable pair.

Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of five numbers:

$$12496 \to 14288 \to 15472 \to 14536 \to 14264 (\to 12496 \to \dots)$$

Since this chain returns to its starting point, it is called an amicable chain.

Find the smallest member of the longest amicable chain with no element exceeding one million.

[Problem 95. Amicable chains](https://projecteuler.net/problem=95 "Problem 95")

## 翻译

一个数的真因子是指除了其本身以外的所有因子。例如，28的真因子是1,2,4,7和14。因为这些因子之和等于28，我们称28为一个完美数。

有趣的是，220的真因子之和是284，而284的真因子之和是220，形成了一个两个元素的链。因此220和284被称为一个亲和对。

可能更长的链就不那么为人所知了，例如，从12496开始，我们可以得到一个五个元素的链：

$$12496 \to 14288 \to 15472 \to 14536 \to 14264 (\to 12496 \to \dots)$$

因为这条链最后回到了开始的数，它被称为一条亲和链。

对于元素都不超过一百万的亲和链，找出最长的亲和链中最小的元素。

[题目95：找出元素都不超过一百万的亲和链中最小的元素。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/96-95 title="题目95")

## 题解

答案(answer): 14316

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_95():
    def prime_sieve(bound):
        pool = [True] * (bound + 1)
        pool[0] = pool[1] = False
        k = 2
        while k < bound:
            for i in range(k+k, bound+1, k):
                pool[i] = False
            k = k + 1
            while k < bound and not pool[k]:
                k += 1
        return list(filter(lambda x: pool[x], range(0, bound+1)))

    bound = 1000000+1
    primes = prime_sieve(bound)
    ns, value = list(range(bound)), [1]*(bound)
    for p in primes:
        for m in range(p+p, bound, p):
            k = 0
            while ns[m] % p == 0:
                k += 1
                ns[m] //= p
            value[m] *= (p**(k+1)-1)//(p-1)

    flag = [0] * bound
    max_k, max_chain = 0, None
    for n in range(2, bound):
        if flag[n]:
            continue
        chain, x, k = [], n, 0
        while x not in chain:
            chain.append(x)
            k += 1
            x = value[x]-x
            if x >= bound or flag[x] != 0:
                k = -1
                break
        if k > 0:
            w = chain.index(x)
            chain = chain[w:]
            k = len(chain)
            if k > max_k:
                max_k = k
                max_chain = chain[:]
        for x in chain: ## memorize
            flag[x] = k
    return sorted(max_chain)[0]

if __name__ == '__main__':
    print(euler_95())

# vim: set sw=4, ts=4
~~~

