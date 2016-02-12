Problem 100. Arranged probability
========================================

## 题目

If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be
seen that the probability of taking two blue discs, $P(BB) = \frac{15}{21} \times \frac{14}{20} = \frac{1}{2}$. The next such arrangement,
for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.

By finding the first arrangement to contain over 1012 = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would
contain.

[Problem 100. Arranged probability](https://projecteuler.net/problem=100 "Problem 100")

## 翻译

如果一个盒子里有21个有色的碟子，15个蓝色的和6个红色的。从中随机取两个，可知取到两个蓝碟子的几率是 $P(BB) = \frac{15}{21} \times \frac{14}{20} = \frac{1}{2}$。
下一个满足此条件（即随机取两个碟子的情况下取到两个蓝色碟子的几率是50%）的情况是85个蓝碟子和35个红碟子。对于包含超过1012 = 1,000,000,000,000个碟子的情况中，满足上述条件的
并包含最少碟子的情况，该情况下共需要多少个蓝碟子？

[题目100：要使取到两个蓝碟子的几率是50%需要有多少个蓝碟子？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/101-10050 title="题目100")

## 题解

答案(answer): 756872327473

### 分析

设红色、蓝色碟子分别有 r, b 个，那么：

$$\frac{b}{b+r} \times \frac{b-1}{b+r-1} = \frac{1}{2}$$
解方程，得
$$b = r + \frac{\sqrt{8 r^2+1}+1}{2} \text{ another solution leads to b < r, ignore it.} $$

对于上式，$8 \times r^2+1$ 是一个完全平方数，并且是一个奇数。设 $x^2 = 8 r^2 + 1$，不难得到初始解：

$$r_0 = 1, x_0 = 3$$

接下来，有以下两个式子成立：

$$\begin{aligned}
x_0^2 - 8 r_0^2 &= 1 \\
x_1^2 - 8 r_1^2 &= 1
\end{aligned}$$

将两个式子相乘，得到：

$$(x_0*x_1 + 8 r_0*r_1)^2 - 8(x_0*r_1+x_1*r_0)^2 = 1$$

因此，得到下一组解：

$$r = x_0*r_1+x_1*r_0, x = x_0*x_1 + 8 r_0*r_1$$

因为 $r_0, x_0$ 是初始解，满足最小性，因此，按照上式迭代，可以得到所有的可行解。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

import math

def euler_100():
    '''
    b = r + [sqrt(8r^2+1)+1] / 2
    x^2 = 8r^2+1
    '''
    bound = 1000000000000
    ## foundamental solution.
    r0, x0 = 1, 3
    b, r, x = r0 + (x0+1) // 2, r0, x0
    while True:
        x = math.floor(math.sqrt(8*r*r + 1))
        b = r + (x+1) / 2
        if x % 2 == 1 and x*x == 8*r*r + 1 and b + r > bound:
            break
        r, x = x*r0 + r*x0, x*x0 + 8*r*r0
    return b

if __name__ == '__main__':
    print(euler_100())

# vim: set sw=4, ts=4
~~~

### Haskell

~~~haskell
import Debug.Trace

main :: IO ()
main = print euler_100

euler_100 :: Int
euler_100 = (blue . head . dropWhile proper) $ scanl iter (3, 1, 3) [1..]
    where
        bound            = 1000000000000
        (r0, x0)         = (1, 3)
        proper (b, r, x) = rem x 2 == 1 && x*x == 8*r*r+1 && b+r <= bound
        iter (b, r, x) _ = (b', r', x')
            where
                b' = r' + div (x'+1) 2
                r' = x*r0 + r*x0
                x' = x*x0 + 8*r*r0
        blue (b, r, x)   = b
~~~

