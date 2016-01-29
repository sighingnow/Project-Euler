Problem 83. Path sum: four ways
==================================

## 题目

In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by moving
left, right, up, and down, is indicated in bold red and is equal to 2297.

$$ \begin{pmatrix}
\color{red}{131} & 673 & 234 & 103 & 18\\
\color{red}{201} & \color{red}{96} & \color{red}{342} & 965 & 150\\
630 & 803 & \color{red}{746} & \color{red}{422} & 111\\
537 & 699 & 497 & \color{red}{121} & 956\\
805 & 732 & 524 & \color{red}{37} & \color{red}{331}
\end{pmatrix} $$

Find the minimal path sum, in [matrix.txt](../resource/p083-matrix.txt) (right click and "Save Link/Target As..."), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by moving
left, right, up, and down.

[Problem 83. Path sum: four ways](https://projecteuler.net/problem=83 title="Problem 83")

## 翻译

在以下这个$5 \times 5$的矩阵中，在允许向上，下，左，右移动的情况下，从左上角到右下角的最小路径和是2297。路径用
红色标出。

$$ \begin{pmatrix}
\color{red}{131} & 673 & 234 & 103 & 18\\
\color{red}{201} & \color{red}{96} & \color{red}{342} & 965 & 150\\
630 & 803 & \color{red}{746} & \color{red}{422} & 111\\
537 & 699 & 497 & \color{red}{121} & 956\\
805 & 732 & 524 & \color{red}{37} & \color{red}{331}
\end{pmatrix} $$

[matrix.txt](../resource/p083-matrix.txt) 包含一个$80 \times 80$的矩阵，在允许向上，下，左，右移动的情况
下，找出从左上角到右下角的最小路径和。

## 题解

答案(answer): 425185

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_83():
    matrix = map(lambda line: line.split(','), open('p083-matrix.txt', 'r').read().split())
    matrix = map(lambda line: map(int, line), matrix)
    h, w = len(matrix), len(matrix[0])
    distance = [[0xffffffff for i in range(0, w)] for j in range(0, h)]
    distance[0][0] = matrix[0][0]

    dist = lambda x, y: (x < 0 or x >= w or y < 0 or y >= h) and 0xffffffff or distance[x][y]

    ## dp
    ## if no update occur, stop loop.
    updated, cnt = True, 0
    while updated:
        updated, cnt = False, cnt + 1
        for x in range(w):
            for y in range(h):
                t = min(dist(x-1, y), dist(x+1, y), dist(x, y-1), dist(x, y+1))
                if distance[x][y] > matrix[x][y]+t:
                    distance[x][y] = matrix[x][y]+t
                    updated = True
    return distance[w-1][h-1]

if __name__ == '__main__':
    print(euler_83())

# vim: set sw=4, ts=4
~~~
