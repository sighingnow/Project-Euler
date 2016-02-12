Problem 87. Prime power triples
========================================

## 题目

The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28.
In fact, there are exactly four numbers below fifty that can be expressed in such a way:

+ $28 = 2^2 + 2^3 + 2^4$
+ $33 = 3^2 + 2^3 + 2^4$
+ $49 = 5^2 + 2^3 + 2^4$
+ $47 = 2^2 + 3^3 + 2^4$

How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?

[Problem 87. Prime power triples](https://projecteuler.net/problem=87 title="Problem 87")

## 翻译

最小的能写成质数的2,3,4次方之和的数是28。50以下一共有4个数可以写成这种形式：

+ $28 = 2^2 + 2^3 + 2^4$
+ $33 = 3^2 + 2^3 + 2^4$
+ $49 = 5^2 + 2^3 + 2^4$
+ $47 = 2^2 + 3^3 + 2^4$

5000万以下的数中有多少个能写成一个质数的2次方，一个质数的3次方和一个质数的4次方之和？

[题目87：考察能写成质数的2次，3次和4次方之和的数。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/88-87234 title="题目87")

## 题解

答案(answer): 1097343

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import sqrt

def euler_87():
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

    bound = 50000000
    p1 = prime_sieve(int(bound**(1/2.0)))
    p2 = filter(lambda x: x <= bound**(1/3.0), p1)
    p3 = filter(lambda x: x <= bound**(1/4.0), p2)
    s = lambda x, y, z: x*x+y*y*y+z*z*z*z
    return len(set(filter(lambda a: a < bound, [s(x,y,z) for x in p1 for y in p2 for z in p3])))

if __name__ == '__main__':
    print(euler_87())

# vim: set sw=4, ts=4
~~~
