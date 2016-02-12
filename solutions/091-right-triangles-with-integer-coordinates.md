Problem 91. Right triangles with integer coordinates
========================================

## 题目

The points $P (x_1, y_1)$ and $Q (x_2, y_2)$ are plotted at integer co-ordinates and are joined to the origin, $O(0, 0)$,
to form $\Delta OPQ$.

There are exactly fourteen triangles containing a right angle that can be formed when each co-ordinate lies between $0$
and $2$ inclusive; that is, $0 \le x_1, y_1, x_2, y_2 \le 2$.

Given that $0 \le x_1, y_1, x_2, y_2 \le 50$, how many right triangles can be formed?

[Problem 91. Right triangles with integer coordinates](https://projecteuler.net/problem=91 title="Problem 91")

## 翻译

点 $P (x_1, y_1)$ 和 $Q (x_2, y_2)$ 位于整数点坐标上，并且与原点 $O(0, 0)$ 相连接形成三角形 $\Delta OPQ$。

当横纵坐标都位于 $0$ 到 $2$ 之间时（包括 $0$ 和 $2$），也就是 $0 \le x_1, y_1, x_2, y_2 \le 2$ 时，一共可以形成14个直角三角形。

给定 $0 \le x_1, y_1, x_2, y_2 \le 50$, 一共能形成多少个直角三角形？

[题目91：找出象限内直角三角形的数量。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/92-91 title="题目91")

## 题解

答案(answer): 14234

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_91():
    bound, cnt = 51, 0
    for x1 in range(0, bound):
        for y1 in range(0, bound):
            if x1 == 0 and y1 == 0:
                continue
            d1 = x1*x1+y1*y1
            for x2 in range(x1, bound):
                for y2 in range(0, bound):
                    if x2 == x1 and y2 <= y1:
                        continue
                    d2 = x2*x2+y2*y2
                    d3 = (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)
                    if d2 == d1 + d3 or d1 == d2 + d3 or d3 == d1 + d2:
                        cnt += 1
    return cnt

if __name__ == '__main__':
    print(euler_91())

# vim: set sw=4, ts=4
~~~
