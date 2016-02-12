Problem 69. Totient maximum
========================================

## 题目

Euler's Totient function, $\Phi(n)$ [sometimes called the phi function], is used to determine the number of numbers less
than n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime
to nine, $\Phi(9)=6$.

| n  | Relatively  Prime |   $\Phi(n)$ |  $\frac{n}{\Phi(n)}$       |
|:--:|-------------------|:------------:|:-------------------------:|
| 2  | 1                 |      1       |    2                      |
| 3  | 1,2               |      2       |    1.5                    |
| 4  | 1,3               |      2       |    2                      |
| 5  | 1,2,3,4           |      4       |    1.25                   |
| 6  | 1,5               |      2       |    3                      |
| 7  | 1,2,3,4,5,6       |      6       |    1.1666 $\dots$        |
| 8  | 1,3,5,7           |      4       |    2                      |
| 9  | 1,2,4,5,7,8       |      6       |    1.5                    |
| 10 | 1,3,7,9           |      4       |    2.5                    |

It can be seen that $n=6$ produces a maximum $\frac{n}{\Phi(n)}$ for $n \le 10$.

Find the value of $n \le 1,000,000$ for which $\frac{n}{\Phi(n)}$ is a maximum.

[Problem 69. Totient maximum](https://projecteuler.net/problem=69 title="Problem 69")

## 翻译

欧拉函数 $\Phi(n)$（有时也叫做phi函数）可以用来计算小于n 的数字中与n互质的数字的个数。例如，因为1,2,4,5,7,8全部小于9并且与9互质，
所以 $\Phi(9)=6$。

| n  | 互质数            |   $\Phi(n)$ |  $\frac{n}{\Phi(n)}$       |
|:--:|-------------------|:------------:|:-------------------------:|
| 2  | 1                 |      1       |    2                      |
| 3  | 1,2               |      2       |    1.5                    |
| 4  | 1,3               |      2       |    2                      |
| 5  | 1,2,3,4           |      4       |    1.25                   |
| 6  | 1,5               |      2       |    3                      |
| 7  | 1,2,3,4,5,6       |      6       |    1.1666 $\dots$        |
| 8  | 1,3,5,7           |      4       |    2                      |
| 9  | 1,2,4,5,7,8       |      6       |    1.5                    |
| 10 | 1,3,7,9           |      4       |    2.5                    |

可以看出对于 $n \le 10$, $n=6$ 时的 $\frac{n}{\Phi(n)}$ 取到最大值。

找出 $n \le 1,000,000$ 的 $n$ 中使得 $\frac{n}{\Phi(n)}$ 取到最大的 $n$ 值。

[题目69：找出一百万以下的 $n$ 中使得 $\frac{n}{\Phi(n)}$ 取到最大的 $n$。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/70-69nnnn title="题目69")

## 题解

答案(answer): 510510

### 分析

首先，根据欧拉函数的一个性质：如果 $p_1$, $p_2$ 互质，那么，$$\Phi(p_1 \times p_2) = (p_1-1) \times (p_2-1).$$
更近一步，如果 $p_1, p_2, p_3$ 互质，那么，$$\Phi(p_1 \times p_2 \times p_3) = (p_1-1) \times (p_2-1) \times (p_3 - 1).$$

要求的是 $\frac{n}{\Phi(n)}$ 的最大值，取 $n_1 = p_1 \times p_2$, $n_2 = p_1 \times p_2 \times p_3$，那么

$$\frac{\frac{n_1}{\Phi{n_1}}}{\frac{n_2}{\Phi{n_2}}} = \frac{p_3-1}{p_3} < 1$$

因此，取小于1000000的，不同质因数最多的数，即为答案。

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_69():
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

    bound = 1000000
    primes = prime_sieve(int(sqrt(bound))) ## 缩小搜索范围

    n = 1
    for p in primes:
        n = n * p
        if n > bound:
            n = n // p
            break
    return n

if __name__ == '__main__':
    t = time()
    print(euler_69(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
