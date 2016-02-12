Problem 97. Large non-Mersenne prime
==========================

## 题目

The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne prime of the form $2^{6972593}-1$;
it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, of the form $2^p-1$, have been found which contain more digits.

However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: $28433 \times 2^{7830457} + 1$.

Find the last ten digits of this prime number.

[Problem 97. Large non-Mersenne prime](https://projecteuler.net/problem=97 "Problem 97")

## 翻译

第一个超过一百万位的素数是在1999年发现的，并且是一个梅森素数：$2^{6972593}-1$；它包含2,098,960位。之后包含更多位的，形如 $2^p-1$ 的梅森素数被陆续发现。

但是在2004年人们发现了一个巨大的包含2,357,207 位的非梅森素数：$28433 \times 2^{7830457} + 1$。

找出这个素数的随后十位。

[题目97：找出非梅森素数$28433 * 2^7830457 + 1$的最后十位。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/98-9728433-t-27830457-1 title="题目97")

## 题解

答案(answer): 8739992577

### 分析

快速幂模。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_97():
    def quick_pow_mod(a, x, m):
        ret, t = 1, a
        while x > 0:
            if x % 2 == 1:
                ret = ret * t % m
            t = t * t % m
            x >>= 1
        return ret
    a, x, d, m, c = 2, 7830457, 28433, 10**10, 1
    return (d * quick_pow_mod(a, x, m) + c) % m

if __name__ == '__main__':
    print(euler_97())

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell
main :: IO ()
main = print euler_97

euler_97 :: Integer
euler_97 = rem (d0 * quick_pow_mod 1 a0 x0 m0 + c0) m0
    where
        [a0, x0, d0, m0, c0]    = [2, 7830457, 28433, 10^10, 1]
        quick_pow_mod :: Integer -> Integer -> Integer -> Integer -> Integer
        quick_pow_mod ret _ 0 _ = ret
        quick_pow_mod ret a x m = quick_pow_mod ret' a' x' m
            where
                eo   = rem x 2 == 1
                ret' = if eo then rem (ret * a) m else ret
                a'   = rem (a*a) m
                x'   = div x 2
~~~

