Problem 65. Convergents of e
========================================

## 题目

The square root of $2$ can be written as an infinite continued fraction.
$$\sqrt{2} = 1 + \frac{1}{2+\frac{1}{2+\frac{1}{2+\frac{1}{2+\dots}}}}$$
The infinite continued fraction can be written, $$\sqrt{2} = [1;(2)]$$
$(2)$ indicates that $2$ repeats _ad infinitum_. In a similar way, $$\sqrt{23} = [4;(1,3,1,8)].$$

It turns out that the sequence of partial values of continued fractions for square roots provide
the best rational approximations. Let us consider the convergents for $\sqrt{2}$.

$$\begin{aligned}
1 + \frac{1}{2} &= \frac{3}{2} \\
1 + \frac{1}{2+\frac{1}{2}} &= \frac{7}{5} \\
1 + \frac{1}{2+\frac{1}{2+\frac{1}{2}}} &= \frac{17}{12} \\
1 + \frac{1}{2+\frac{1}{2+\frac{1}{2+\frac{1}{2}}}} &= \frac{41}{29}
\end{aligned}$$

Hence the sequence of the first ten convergents for $\sqrt{2}$ are:

$$ 1, \frac{2}{3}, \frac{7}{5}, \frac{17}{12}, \frac{41}{29}, \frac{99}{70}, \frac{239}{169}, \frac{577}{408}, \frac{1393}{985}, \frac{3363}{2378}, \dots$$

What is most surprising is that the important mathematical constant,
$$e = [2; 1,2,1, 1,4,1, 1,6,1 , \dots , 1,2k,1, \dots].$$
The first ten terms in the sequence of convergents for $e$ are:
$$2, 3, \frac{8}{3}, \frac{11}{4}, \frac{19}{7}, \frac{87}{32}, \frac{106}{39}, \frac{193}{71}, \frac{1264}{465}, \frac{1457}{536}, \dots$$

The sum of digits in the numerator of the $10_{th}$ convergent is $1+4+5+7=17$.

Find the sum of digits in the numerator of the $100_{th}$ convergent of the continued fraction for $e$.

[Problem 65. Convergents of $e$](https://projecteuler.net/problem=65 title="Problem 65")

## 翻译

$2$ 的平方根可以写作无限连分数：
$$\sqrt{2} = 1 + \frac{1}{2+\frac{1}{2+\frac{1}{2+\frac{1}{2+\dots}}}}$$
这个无限连分数可以写作， $$\sqrt{2} = [1;(2)]$$ $(2)$ 表示 $2$ 无限循环出现。类似的，$$\sqrt{23} = [4;(1,3,1,8)].$$

事实证明平方根的连分数序列提供了最好的有理数近似值。让我们考虑 $\sqrt{2}$ 的收敛项：

$$\begin{aligned}
1 + \frac{1}{2} &= \frac{3}{2} \\
1 + \frac{1}{2+\frac{1}{2}} &= \frac{7}{5} \\
1 + \frac{1}{2+\frac{1}{2+\frac{1}{2}}} &= \frac{17}{12} \\
1 + \frac{1}{2+\frac{1}{2+\frac{1}{2+\frac{1}{2}}}} &= \frac{41}{29}
\end{aligned}$$

因此 $\sqrt{2}$ 的收敛项中的前十项是：

$$ 1, \frac{2}{3}, \frac{7}{5}, \frac{17}{12}, \frac{41}{29}, \frac{99}{70}, \frac{239}{169}, \frac{577}{408}, \frac{1393}{985}, \frac{3363}{2378}, \dots$$

更令人惊奇的是一个重要的数学常数：
$$e = [2; 1,2,1, 1,4,1, 1,6,1 , \dots , 1,2k,1, \dots].$$
$e$ 的收敛项序列中的前十项是：
$$2, 3, \frac{8}{3}, \frac{11}{4}, \frac{19}{7}, \frac{87}{32}, \frac{106}{39}, \frac{193}{71}, \frac{1264}{465}, \frac{1457}{536}, \dots$$

其中第 $10$ 项的分子各位数之和是 $1+4+5+7=17$.
找出 $e$ 的收敛项序列中第 $100$ 项的分子上各位之和。

[题目65：找出 $e$ 的连分数中第 $100$ 个收敛项的分子各位之和。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/66-65e100 title="题目65")

## 题解

答案(answer): 272

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt
from fractions import gcd

def euler_65():
    bound, k = 100, 3
    def pattern():
        '''Yield all patterns in reverse order.'''
        for i in range(bound//k, 0, -1):
            yield 1
            yield 2*i
            yield 1
        yield 2

    n, m = 1, 0
    for p in pattern():
        n, m = m+p*n, n
    return sum(int(c) for c in str(n/gcd(m, n)))

if __name__ == '__main__':
    t = time()
    print(euler_65(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell

main :: IO ()
main = print euler_65

euler_65 :: Integer
euler_65 = (sum . digits . fst . frac . take 100) nums
    where
        nums     = 2 : concat [[1, 2*k, 1] | k <- [1..]]
        frac     = foldr (\p (n, m) -> (m+p*n, n)) (1, 0)
        digits 0 = []
        digits n = r : digits q where (q, r) = divMod n 10
~~~

