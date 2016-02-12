Problem 85. Counting rectangles
========================================

## 题目

By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles.

Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.

[Problem 85. Counting rectangles](https://projecteuler.net/problem=85 title="Problem 85")

## 翻译

仔细数的话可以看出一个3*2的矩形网格里包含18个矩形。

虽然没有哪个矩形网格包含正好两百万个矩形，找出包含最接近两百万个矩形的矩形网格的面积。

[题目85：考察矩形网格里的矩形数量。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/86-85 title="题目85")

## 题解

答案(answer): 2772

### 分析

若边长为$m$,$n$，包含的矩形个数为：$$\frac{m (m+1) n (n+1)}{4}$$

因此，首先找到较长边的upper bound: $$\sqrt{2000000 \times 4 \div 2} = 2000$$
然后求较长边的lower bound: $$\sqrt{\sqrt{2000000 \times 4}} \approx 53$$
然后枚举。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import sqrt

def euler_85():
    bound = 2000000
    diff, area = bound, 0
    rectangle = lambda u, v: u*(u+1)*v*(v+1)//4
    u, v = 0, 0
    for u in range(1, 53):
        v = int(sqrt(bound*4/u/(u+1)))
        x = abs(rectangle(u, v) - bound)
        if x < diff:
            diff = x
            area = u * v
        x = abs(rectangle(u, v+1) - bound)
        if x < diff:
            diff = x
            area = u * v
    return area

if __name__ == '__main__':
    print(euler_85())

# vim: set sw=4, ts=4
~~~
