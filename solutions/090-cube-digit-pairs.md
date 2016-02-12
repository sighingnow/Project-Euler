Problem 90. Cube digit pairs
========================================

## 题目

Each of the six faces on a cube has a different digit (0 to 9) written on it; the same is done to a second
cube. By placing the two cubes side-by-side in different positions we can form a variety of 2-digit numbers.

For example, the square number 64 could be formed:

In fact, by carefully choosing the digits on both cubes it is possible to display all of the square numbers
below one-hundred: 01, 04, 09, 16, 25, 36, 49, 64, and 81.

For example, one way this can be achieved is by placing {0, 5, 6, 7, 8, 9} on one cube and {1, 2, 3, 4, 8, 9}
on the other cube.

However, for this problem we shall allow the 6 or 9 to be turned upside-down so that an arrangement like
{0, 5, 6, 7, 8, 9} and {1, 2, 3, 4, 6, 7} allows for all nine square numbers to be displayed; otherwise it
would be impossible to obtain 09.

In determining a distinct arrangement we are interested in the digits on each cube, not the order.

    {1, 2, 3, 4, 5, 6} is equivalent to {3, 6, 4, 1, 2, 5}
    {1, 2, 3, 4, 5, 6} is distinct from {1, 2, 3, 4, 5, 9}

But because we are allowing 6 and 9 to be reversed, the two distinct sets in the last example both represent
the extended set {1, 2, 3, 4, 5, 6, 9} for the purpose of forming 2-digit numbers.

How many distinct arrangements of the two cubes allow for all of the square numbers to be displayed?

[Problem 90. Cube digit pairs](https://projecteuler.net/problem=90 title="Problem 90")

## 翻译

一个立方体的六个面上每个面都有一个0-9的数字，另一个立方体也如此。将两个立方体用不同的方式挨着放置，我们可以得到不同的两位数。

例如，平方数64可以如下表示：

如果仔细选择每个立方体面上的数字，我们可以表示出100以下所有的平方数： 01, 04, 09, 16, 25, 36, 49, 64, 和81。

例如，能够达到这个目的的一种方式在一个立方体上标示{0, 5, 6, 7, 8, 9}，在另一个上标示{1, 2, 3, 4, 8, 9}。

但是在这个问题中，我们允许6和9通过颠倒来互相表示。所以 {0, 5, 6, 7, 8, 9} 和{1, 2, 3, 4, 6, 7} 就可以表示所有9个平方数，
否则无法标示09。

在判断不同的安排时，我们只对每个立方体上的数字感兴趣，而不考虑顺序。

    {1, 2, 3, 4, 5, 6} 等价于 {3, 6, 4, 1, 2, 5}
    {1, 2, 3, 4, 5, 6} 和  {1, 2, 3, 4, 5, 9} 则是不同的安排

但是由于我们允许6和9互相颠倒，所以上面的第二个例子的两个安排都可以表示{1, 2, 3, 4, 5, 6, 9}。

要表示所有9个平方数的话，一共有多少种可行的安排？

[题目90：用两个立方体表示平方数的奇怪方式。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/91-90 title="题目90")

## 题解

答案(answer): 1217

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from itertools import combinations

def euler_90():
    def test(p, a, b):
        return p[0] in a and p[1] in b or p[0] in b and p[1] in a
    cnt = 0
    squares = [(0,1),(0,4),(0,9),(1,6),(2,5),(3,6),(4,9),(6,4),(8,1)]
    for b in combinations(range(0, 10), 6):
        if 2 not in b and 5 not in b:
            continue
        if 6 in b or 9 in b:
            b += (6, 9)
        for a in combinations(range(0, 10), 6):
            if 2 not in a and 5 not in a:
                continue
            if 6 in a or 9 in a:
                a += (6, 9)
            if all(map(lambda p: test(p, a, b), squares)):
                cnt += 1
    return cnt // 2

if __name__ == '__main__':
    print(euler_90())

# vim: set sw=4, ts=4
~~~
