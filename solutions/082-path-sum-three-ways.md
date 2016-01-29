Problem 82. Path sum: three ways
========================================

## 题目

The minimal path sum in the 5 by 5 matrix below, by starting in any cell in the left column and finishing in any cell in the right column, and only
moving up, down, and right, is indicated in red and bold; the sum is equal to 994.

$$ \begin{pmatrix}
131 & 673 & \color{red}{234} & \color{red}{103} & \color{red}{18}\\
\color{red}{201} & \color{red}{96} & \color{red}{342} & 965 & 150\\
630 & 803 & 746 & 422 & 111\\
537 & 699 & 497 & 121 & 956\\
805 & 732 & 524 & 37 & 331
\end{pmatrix} $$

Find the minimal path sum, in [matrix.txt](../resource/p082-matrix.txt) (right click and "Save Link/Target As..."), a 31K text file containing a 80 by 80 matrix, from the left column to the right column.

[Problem 82. Path sum: three ways](https://projecteuler.net/problem=81 title="Problem 82")

## 翻译

在下面这个$5 \times 5$的矩阵中，从最左边一列的任意元素开始，到最右边一列的任意元素结束，最短的路径和是994，其中允许
移动的方向为上，下和右。路径用红色标出。

$$ \begin{pmatrix}
131 & 673 & \color{red}{234} & \color{red}{103} & \color{red}{18}\\
\color{red}{201} & \color{red}{96} & \color{red}{342} & 965 & 150\\
630 & 803 & 746 & 422 & 111\\
537 & 699 & 497 & 121 & 956\\
805 & 732 & 524 & 37 & 331
\end{pmatrix} $$

[matrix.txt](../resource/p082-matrix.txt) 包含一个$80 \times 80$的矩阵，找出从最左边一列到最右边一列的最小路径和。

## 题解

答案(answer): 260324

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_82():
    matrix = map(lambda line: line.split(','), open('p082-matrix.txt', 'r').read().split())
    matrix = map(lambda line: map(int, line), matrix)
    h, w = len(matrix), len(matrix[0])
    distance = [[0xffffffff for i in range(0, w)] for j in range(0, h)]
    distance[0][0] = matrix[0][0]

    def dist(x, y):
        if y < 0:
            return 0
        elif x < 0 or x >= w or y >= h:
            return 0xffffffff
        else:
            return distance[x][y];

    ## dynamic programming.
    ## if no update occur, stop loop. maximum loops: w*h
    updated, cnt = True, 0
    while updated:
        updated, cnt = False, cnt + 1
        for x in range(w):
            for y in range(h):
                t = min(dist(x-1, y), dist(x+1, y), dist(x, y-1))
                if distance[x][y] > matrix[x][y]+t:
                    distance[x][y] = matrix[x][y]+t
                    updated = True
    return min(map(lambda line: line[h-1], distance))

if __name__ == '__main__':
    print(euler_82())

# vim: set sw=4, ts=4
~~~
