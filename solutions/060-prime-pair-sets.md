Problem 60. Prime pair sets
========================================

## 题目

The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.

Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

[Problem 60. Prime pair sets](https://projecteuler.net/problem=60 title="Problem 60")

## 翻译

质数3, 7, 109, 和 673是值得注意的。将其中任意两个质数以任何顺序相连接产生的结果都是质数。例如，取7和109，连接而成的7109和1097都是质数。这四个质数的和是792，这也是满足这个性质的四个质数集合的最小总和。

找出满足这个性质的五个质数的集合中，集合数之和最小的。算出这个最小的和。

[题目60：找出一个5个质数的集合，该集合中每两个质数相连接都能产生一个素数。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/61-605 title="题目60")

## 题解

答案(answer): 26033

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_60():
    def prime_sieve(bound):
        pool = [True] * (bound//2)
        for i in range(3, int(sqrt(bound))+1, 2):
            if pool[i//2]:
                pool[i*i//2::i] = [False] * ((bound-i*i-1)//(2*i)+1)
        return [2]+[2*i+1 for i in range(1, bound//2) if pool[i]]

    def is_prime(n):
        '''Detect if n is a prime number.'''
        if n <= 1: return False
        if n <= 3: return True
        if n % 2 == 0 or n % 3 == 0: return False
        x, k = int(sqrt(n)), 5
        while k <= x:
            if n % k == 0 or n % (k+2) == 0:
                return False
            k += 6
        return True

    ps = prime_sieve(10000)

    def trans(*args):
        t = args[-1]
        check = lambda x, t: is_prime(int(str(x)+str(t)))
        return all(map(lambda x: check(x, t) and check(t, x), args[:-1]))

    lp, res = len(ps), []
    for a in range(lp):
        for b in range(a+1, lp):
            if not trans(ps[a], ps[b]):
                continue
            for c in range(b+1, lp):
                if not trans(ps[a], ps[b], ps[c]):
                    continue
                for d in range(c+1, lp):
                    if not trans(ps[a], ps[b], ps[c], ps[d]):
                        continue
                    for e in range(d+1, lp):
                        if trans(ps[a], ps[b], ps[c], ps[d], ps[e]):
                            ## res.append((ps[a], ps[b], ps[c], ps[d], ps[e]))
                            '''
                            An optimization: after find the first solution, directly return it.
                            '''
                            return sum((ps[a], ps[b], ps[c], ps[d], ps[e]))
    ## return min(map(sum, res))

if __name__ == '__main__':
    t = time()
    print(euler_60(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
