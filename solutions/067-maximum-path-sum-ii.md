Problem 67. Maximum path sum II
========================================

## 题目

By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

    3
    7 4
    2 4 6
    8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in [triangle.txt](../resource/p067-triangle.txt) (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

**NOTE**: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

[Problem 67. Maximum path sum II](https://projecteuler.net/problem=67 title="Problem 67")

## 翻译

从以下三角形的顶端开始，向下一行的相邻数字移动，从顶端到底端的最大总和是23。

    3
    7 4
    2 4 6
    8 5 9 3

也就是 3 + 7 + 4 + 9 = 23.

[triangle.txt](../resource/p067-triangle.txt) (右键另存为)是一个文本文件，包含了一个一百行的三角形，找出这个三角形中从顶到底的最大和。

注意：这是题目18的更难的一个版本。穷举每一种可能的路径是不可行的，因为一共有299条可能的路径。就算每秒钟能处理1012条路径，也需要200亿年来处理完所有的路径。存在一个高效的方法来处理这道题。

[**题目67**：使用高效算法找到三角形中的最大和。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/68-67 title="题目67")

## 题解

答案(answer): 7273

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_67():
    triangle = map(lambda x: x.split(), open('p067-triangle.txt', 'r').read().splitlines())
    triangle = map(lambda line: map(int, line), triangle)
    ## dynamic programming.
    x = len(triangle)+1
    dp = [[0 for i in range(0, x)] for j in range(0, x)]
    for i in range(1, x):
        for j in range(1, i+1):
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + triangle[i-1][j-1]
    return max(dp[x-1])

if __name__ == '__main__':
    t = time()
    print(euler_67(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
