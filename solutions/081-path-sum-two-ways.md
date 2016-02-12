Problem 81. Path sum: two ways
========================================

## 题目

In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.

$$\begin{pmatrix}
\color{red}{131} & 673 & 234 & 103 & 18 \\
\color{red}{201} & \color{red}{96} & \color{red}{342} & 965 & 150 \\
630 & 803 & \color{red}{746} & \color{red}{422} & 111 \\
537 & 699 & 497 & \color{red}{121} & 956 \\
805 & 732 & 524 & \color{red}{37} & \color{red}{331}
\end{pmatrix}$$

Find the minimal path sum, in [matrix.txt](../resource/p081-matrix.txt) (right click and "Save Link/Target As..."), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by
only moving right and down.

[Problem 81. Path sum: two ways](https://projecteuler.net/problem=81 title="Problem 81")

## 翻译

在以下这个 $5 \times 5$ 的矩阵中，在只允许向右和向下移动的情况下，从左上角到右下角的最小路径和是2427，路径用红色标出。

$$\begin{pmatrix}
\color{red}{131} & 673 & 234 & 103 & 18\\
\color{red}{201} & \color{red}{96} & \color{red}{342} & 965 & 150\\
630 & 803 & \color{red}{746} & \color{red}{422} & 111\\
537 & 699 & 497 & \color{red}{121} & 956\\
805 & 732 & 524 & \color{red}{37} & \color{red}{331}
\end{pmatrix}$$

[matrix.txt](../resource/p081-matrix.txt) 包含一个 $80 \times 80$ 的矩阵，找出在只允许向右和向下移动的情况下，该矩阵中从左上角到右下角的最小路径和。

## 题解

答案(answer): 427337

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_81():
    matrix = map(lambda line: line.split(','), open('p081-matrix.txt', 'r').read().split())
    matrix = map(lambda line: map(int, line), matrix)
    h, w = len(matrix), len(matrix[0])
    distance = [[0xffffffff for i in range(0, w)] for j in range(0, h)]
    distance[0][0] = matrix[0][0]

    def dist(x, y):
        if x < 0 or y < 0 or x >= w or y >= h:
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
                t = min(dist(x-1, y), dist(x, y-1))
                if distance[x][y] > matrix[x][y]+t:
                    distance[x][y] = matrix[x][y]+t
                    updated = True
    return distance[w-1][h-1]

if __name__ == '__main__':
    print(euler_81())

# vim: set sw=4, ts=4
~~~
