Problem 94. Almost equilateral triangles
========================================

## 题目

It is easily proved that no equilateral triangle exists with integral length sides and integral area. However, the almost equilateral triangle 5-5-6
has an area of 12 square units.

We shall define an almost equilateral triangle to be a triangle for which two sides are equal and the third differs by no more than one unit.

Find the sum of the perimeters of all almost equilateral triangles with integral side lengths and area and whose perimeters do not exceed one billion(1,000,000,000).

[Problem 94. Almost equilateral triangles](https://projecteuler.net/problem=94 title="Problem 94")

## 翻译

容易证明不存在具有整数边长和整数面积的等边三角形。但是5-5-6这个近似等边三角形 具有整数面积12。

我们将近似等边三角形定义为有两边相等，并且第三边与其他两边相差不超过1的三角形。

对于周长不超过10亿的三角形中，找出边长和面积都为整数的近似等边三角形的周长和。

[题目94：找出具有整数边长和面积的近似等边三角形。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/95-94 title="题目94")

## 题解

答案(answer): 518408346

+ 分析

设三边长分别为：$a$, $b$, $c$, 其中，$a = b$，三角形高为$h$。分以下两种情况：

1. $c = a-1$

    三角形的面积为整数，也就是说$h \times \frac{c}{2}$为整数，也就是说，$y$, $\frac{c}{2}$为整数。
    又由于勾股定理，得：$$a^2=h^2+{\frac{c}{2}}^2=h^2+{\frac{a-1}{2}}^2$$
    化简，有：$${\frac{3a+1}{2}}^2-3h^2=1$$，方程的解为整数。
    不难发现方程的第一个整数解为$$\frac{3a+1}{2}=2, y=1$$，接下来，由[Pell's Equation](https://en.wikipedia.org/wiki/Pell%27s_equation)
    的迭代规则：对于方程$$x^2-n \cdot y^2 = 1$$，有若初始解围$x0$, $y0$, 则$$x_{k+1} = x_0 x_k + n y_0 y_k, y_{k+1} = x_0 y_k + y_0 x_k$$，不难求出后续的解。
    最后，除去$\frac{3a+1}{2}$为整数但$a$不为整数的解即可。

2. $c = a+1$

    在此条件下可以推导出方程$${\frac{3a-1}{2}}^2-3h^2=1$$，其他同上。

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_94():
    def pell(x0, y0, n):
        '''Solve the Pell's Equation.'''
        x, y = x0, y0
        while True:
            x, y = x0*x+n*y0*y, x0*y+y0*x
            yield x, y

    bound = 1000000000
    s, p, c1, c2 = 0, 0, 0, 0
    for t, h in pell(2, 1, 3):
        ## c = a + 1
        c1 = (2*t-1)%3 == 0 and 2*t-2 or 0
        if c1 <= bound: s += c1
        ## c = a - 1
        c2 = (2*t+1)%3 == 0 and 2*t+2 or 0
        if c2 <= bound: s += c2

        if c1 > bound or c2 > bound:
            break
    return s

if __name__ == '__main__':
    print(euler_94())

# vim: set sw=4, ts=4
~~~

+ Haskell

~~~haskell
main :: IO ()
main = print euler_94

euler_94 :: Integer
euler_94 = accumulate c1s + accumulate c2s
    where
        accumulate   = sum . takeWhile (<= bound)
            where bound = 1000000000
        ts           = pell 2 1 3
            where
                pell x0 y0 n = (map fst . tail) $ scanl (\(x, y) _ -> (x0*x+n*y0*y, x0*y+y0*x)) (x0, y0) [0..]
        c1s          = map (\t -> 2*t-2) $ filter (\t -> rem (2*t-1) 3 == 0) ts
        c2s          = map (\t -> 2*t+2) $ filter (\t -> rem (2*t+1) 3 == 0) ts

~~~
