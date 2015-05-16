---
title: Problem 15. Lattice-paths
author: DHDave
date: 2015-01-15
layout: post
---

## 题目
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

![Problem 15](../images/p015-1.png)

How many such routes are there through a 20×20 grid?
<!--more-->

[Problem 15.Lattice-paths](https://projecteuler.net/problem=15 "Problem 15")

## 翻译
从一个20×20网格的左上角开始，有6条（不允许往回走）通往右下角的路。

![题目15](../images/p015-1.png)

对于20×20的网格，这样的路有多少条？

[题目15:从20*20的网格的左上角通往右下角有多少条路](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/16-152020 "题目15")

## 题解(Python)

答案(answer): 137846528820

分析：从一个定点到对角的顶点，必然需要`m+n`步，从中选出`m`步向下走，另外`n`步向右走即可，因此答案为$$ans = \binom{m+n}{m} = \binom{m+m}{n}$$ 在本题中，最终的结果为：$$\frac {40!}{20! \times 20!}$$

```python
#! /usr/bin/env python
# -*- coding: utf-8

def fact(n):
    ans = 1
    for i in range(1, n+1):
        ans *= i
    return ans

print(fact(40)//fact(20)//fact(20))

# vim: set sw=4, ts=4, fileencoding=utf-8
```
