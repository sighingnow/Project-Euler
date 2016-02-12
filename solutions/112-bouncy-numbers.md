Problem 112. Bouncy numbers
========================================

## 题目

Published on Friday, 30th December 2005, 06:00 pm; Solved by 14284
Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.

[Problem 112. Bouncy numbers](https://projecteuler.net/problem=112 title="Problem 112")

## 翻译

如果一个数的每一位都大于等于前一位，则称其为递增数，例如134468。

类似的，如果一个数的每一位都小于等于前一位，则称其为递减数，例如66420。

如果一个正整数既不是递增数也不是递减数，则称其为一个“跳跃数”，例如155349。

显然100以下不存在任何跳跃数，但是1000以下的数中一半以上（525）个是跳跃数。事实上，跳跃数比例首次超过50%的数是538。

令人惊奇的是，跳跃数的数量越来越多，到21780时跳跃数的比例已经达到90%。

求使得跳跃数比例恰好等于99%的最小的数。

[题目112：考察“跳跃数”的密度。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/113-112 title="题目112")

## 题解

答案(answer): 1587000

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_112():
    def validate(x):
        xs = list(str(x))
        ks, rs = sorted(xs), list(reversed(xs))
        return ks == xs or ks == rs

    cnt, n = 0, 100
    while True:
        if not validate(n):
            cnt += 1
        if cnt * 100 == 99 * n:
            break
        n = n + 1
    return n

if __name__ == '__main__':
    t = time()
    print(euler_112(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
