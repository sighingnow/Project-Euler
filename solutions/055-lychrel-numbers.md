Problem 55. Lychrel numbers
========================================

## 题目

If we take $47$, reverse and add, $47 + 74 = 121$, which is palindromic.

Not all numbers produce palindromes so quickly. For example,

+ $349 + 943 = 1292$
+ $1292 + 2921 = 4213$
+ $4213 + 3124 = 7337$

That is, $349$ took three iterations to arrive at a palindrome.

Although no one has proved it yet, it is thought that some numbers, like $196$, never produce a palindrome. A number that never forms a palindrome through the reverse and add process is called a Lychrel number. Due to the theoretical nature of these numbers, and for the purpose of this problem, we shall assume that a number is Lychrel until proven otherwise. In addition you are given that for every number below ten-thousand, it will either (i) become a palindrome in less than fifty iterations, or, (ii) no one, with all the computing power that exists, has managed so far to map it to a palindrome. In fact, $10677$ is the first number to be shown to require over fifty iterations before producing a palindrome: $4668731596684224866951378664$ ($53$ iterations, $28 \textrm{-digits}$).

Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is $4994$.

How many Lychrel numbers are there below ten-thousand?

**NOTE**: Wording was modified slightly on 24 April 2007 to emphasise the theoretical nature of Lychrel numbers.

[Problem 55. Lychrel numbers](https://projecteuler.net/problem=55 title="Problem 55")

## 翻译

我们将 $47$ 与它的逆转相加，$47 + 74 = 121$, 可以得到一个回文。

并不是所有数都能这么快产生回文，例如：

+ $349 + 943 = 1292$
+ $1292 + 2921 = 4213$
+ $4213 + 3124 = 7337$

也就是说 $349$ 需要三次迭代才能产生一个回文。

虽然还没有被证明，人们认为一些数字永远不会产生回文，例如 $196$。那些永远不能通过上面的方法（逆转然后相加）产生回文的数字叫做Lychrel数。因为这些数字的理论本质，同时也为了这道题，我们认为一个数如果不能被证明的不是Lychrel数的话，那么它就是Lychre数。此外，对于每个一万以下的数字，你还有以下已知条件：这个数如果不能在 $50$ 次迭代以内得到一个回文，那么就算用尽现有的所有运算能力也永远不会得到。$10677$ 是第一个需要 $50$ 次以上迭代得到回文的数，它可以通过 $53$ 次迭代得到一个 $28$ 位的回文：4668731596684224866951378664。

令人惊奇的是，有一些回文数本身也是Lychrel数，第一个例子是 $4994$。

$10000$ 以下一共有多少个Lychrel数？

[题目55: $10000$ 以下有多少Lychrel数？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/56-5510000lychrel title="题目55")

## 题解

答案(answer): 249

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_55():
    bound = 10000

    def succ(x):
        return x+reduce(lambda acc, k: acc*10+k, map(int, str(x)[::-1]))

    is_palindrome = lambda x: str(x) == str(x)[::-1]

    def process(k):
        cnt, x = 1, succ(k)
        while not is_palindrome(x):
            cnt = cnt + 1
            if cnt > 50:
                break
            x = succ(x)
        return cnt

    return map(process, range(bound)).count(51)

if __name__ == '__main__':
    t = time()
    print(euler_55(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell
main :: IO ()
main = print euler_55

euler_55 :: Int
euler_55 = length $ filter (lychrel 49) [1..10000-1]
    where
        lychrel 0 x = True
        lychrel k x = (not . palindrome) (nsucc x) && lychrel (k-1) (nsucc x)
            where
                nsucc x      = x + rev 0 x
                palindrome x = x == rev 0 x
        rev acc 0   = acc
        rev acc t   = rev (acc*10 + (mod t 10)) (div t 10)

~~~
