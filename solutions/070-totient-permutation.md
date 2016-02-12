Problem 70. Totient permutation
========================================

## 题目

Euler's Totient function, $\Phi(n)$ [sometimes called the phi function], is used to determine the number of positive numbers less
than or equal to n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime
to nine, $\Phi(9)=6$.
The number 1 is considered to be relatively prime to every positive number, so $\Phi(1)=1$.

Interestingly, $\Phi(87109)=79180$, and it can be seen that 87109 is a permutation of 79180.

Find the value of n, $1 < n < 10^7$, for which $\Phi(n)$ is a permutation of n and the ratio $\frac{n}{\Phi(n)}$ produces a minimum.

[Problem 70. Totient permutation](https://projecteuler.net/problem=70 title="Problem 70")

## 翻译

欧拉函数 $\Phi(n)$（有时也叫做phi函数）可以用来计算小于等于 $n$ 的数字中与 $n$ 互质的数字的个数。例如，因为1,2,4,5,7,8全部小于9并且与9互质，所以$\Phi(9)=6$。
数字1被认为与每个正整数互质，所以 $\Phi(1)=1$。

有趣的是，$\Phi(87109)=79180$，可以看出87109是79180的一个排列。

对于 $1 < n < 10^7$，并且 $\Phi(n)$ 是 $n$ 的一个排列的那些 $n$ 中，使得 $\frac{n}{\Phi(n)}$ 取到最小的 n 是多少？

[题目70：考察 $Phi(n)$ 是 $n$ 的一个排列的 $n$ 值。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/71-70nnn title="题目70")

## 题解

答案(answer): 8319823

### 分析

这道题的数据范围非常大，时间复杂度非常高，因此，必须充分考虑各种优化。

首先，根据欧拉函数的一个性质：如果 $p_1, p_2$ 互质，那么，$$\Phi(p_1 \times p_2) = (p_1-1) \times (p_2-1).$$
更近一步，如果 $p_1, p_2, p_3$ 互质，那么，$$\Phi(p_1 \times p_2 \times p_3) = (p_1-1) \times (p_2-1) \times (p_3 - 1).$$

要求的是 $\frac{n}{\Phi(n)}$ 的最小值，取 $n_1 = p_1 \times p_2$, $n_2 = p_1 \times p_2 \times p_3$，那么

$$\frac{\frac{n_1}{\Phi{n_1}}}{\frac{n_2}{\Phi{n_2}}} = \frac{p_3-1}{p_3} < 1$$

根据这一结论，只用考虑 $n$ 为两个质数的乘积的情形。一定范围内的质数可以由筛发求出。然后，估计一个合理的范围，减少计算量。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_70():
    def prime_sieve(bound):
        '''
        Get all primes letter than (<) bound, using fast algorithm.
        See more detail at
            http://blog.dreamshire.com/common-functions-routines-project-euler/#prime_sieve
        '''
        pool = [True] * (bound//2)
        for i in range(3, int(sqrt(bound))+1, 2):
            if pool[i//2]:
                pool[i*i//2::i] = [False] * ((bound-i*i-1)//(2*i)+1)
        return [2]+[2*i+1 for i in range(1, bound//2) if pool[i]]

    ## def is_prime(n):
    ##     '''Detect if n is a prime number.'''
    ##     if n <= 1: return False
    ##     if n <= 3: return True
    ##     if n % 2 == 0 or n % 3 == 0: return False
    ##     x, k = int(sqrt(n)), 5
    ##     while k <= x:
    ##         if n % k == 0 or n % (k+2) == 0:
    ##             return False
    ##         k += 6
    ##     return True

    '''
    If n = p1 * p2 (p1 and p2 are coprime), then phi(n) = (p1-1)*(p2-1)
    '''
    bound = 10000000
    primes = prime_sieve(int(10 * sqrt(bound))) ## 缩小搜索范围

    is_perm = lambda a, b: sorted(str(a)) == sorted(str(b))
    q, n, p1, p2 = 2, 2, 2, 3
    for i, p1 in enumerate(primes):
        for p2 in primes[i+1:]:
            '''
            If two intergers to be permutations of one another, there
            difference must be a multiple of 9.
            p1*p2 - (p1-1)*(p2-1) = 9 * k
            then a+b=9*k+1
            '''
            if (p1+p2) % 9 != 1:
                continue
            nn = p1 * p2
            if nn > bound:
                break
            phi = (p1-1) * (p2-1)
            qq = nn * 1.0 / phi
            if q > qq and is_perm(nn, phi):
                q, n = qq, nn
    return n

if __name__ == '__main__':
    t = time()
    print(euler_70(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
