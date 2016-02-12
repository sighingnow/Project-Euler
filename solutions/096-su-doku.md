Problem 96. Su Doku
==========================

## 题目

Su Doku (Japanese meaning number place) is the name given to a popular puzzle concept. Its origin is unclear, but credit must be attributed
to Leonhard Euler who invented a similar, and much more difficult, puzzle idea called Latin Squares. The objective of Su Doku puzzles, however,
is to replace the blanks (or zeros) in a 9 by 9 grid in such that each row, column, and 3 by 3 box contains each of the digits 1 to 9. Below is
an example of a typical starting puzzle grid and its solution grid.

~~~
0 0 3   0 2 0   6 0 0                   4 8 3   9 2 1   6 5 7
9 0 0   3 0 5   0 0 1                   9 6 7   3 4 5   8 2 1
0 0 1   8 0 6   4 0 0                   2 5 1   8 7 6   4 9 3

0 0 8   1 0 2   9 0 0                   5 4 8   1 3 2   9 7 6
7 0 0   0 0 0   0 0 8    <==========>   7 2 9   5 6 4   1 3 8
0 0 6   7 0 8   2 0 0                   1 3 6   7 9 8   2 4 5

0 0 2   6 0 9   5 0 0                   3 7 2   6 8 9   5 1 4
8 0 0   2 0 3   0 0 9                   8 1 4   2 5 3   7 6 9
0 0 5   0 1 0   3 0 0                   6 9 5   4 1 7   3 8 2
~~~

A well constructed Su Doku puzzle has a unique solution and can be solved by logic, although it may be necessary to employ "guess and test" methods
in order to eliminate options (there is much contested opinion over this). The complexity of the search determines the difficulty of the puzzle; the
example above is considered easy because it can be solved by straight forward direct deduction.

The 6K text file, [sudoku.txt](../resource/p096-sudoku.txt) (right click and 'Save Link/Target As...'), contains fifty different Su Doku puzzles ranging in difficulty, but all with
unique solutions (the first puzzle in the file is the example above).

By solving all fifty puzzles find the sum of the 3-digit numbers found in the top left corner of each solution grid; for example, 483 is the 3-digit
number found in the top left corner of the solution grid above.

[Problem 96. Su Doku](https://projecteuler.net/problem=96 "Problem 96")

## 翻译

数独（日文意思是数字的位置）是一种流行的解谜游戏。其起源不详，但是 Leonhard Euler的功劳不可不提，他发明了一种类似的但是更难的游戏叫做拉丁方块。数独游戏的目的是将一个9×9的网格中空白的（或者为0的）格子填上适当的数字，使得网格中每一行，每一列以及每个3×3的格子中都包含1到9中的每个数字。
以下为一个数独游戏的初始状态及其解。

~~~
0 0 3   0 2 0   6 0 0                   4 8 3   9 2 1   6 5 7
9 0 0   3 0 5   0 0 1                   9 6 7   3 4 5   8 2 1
0 0 1   8 0 6   4 0 0                   2 5 1   8 7 6   4 9 3

0 0 8   1 0 2   9 0 0                   5 4 8   1 3 2   9 7 6
7 0 0   0 0 0   0 0 8    <==========>   7 2 9   5 6 4   1 3 8
0 0 6   7 0 8   2 0 0                   1 3 6   7 9 8   2 4 5

0 0 2   6 0 9   5 0 0                   3 7 2   6 8 9   5 1 4
8 0 0   2 0 3   0 0 9                   8 1 4   2 5 3   7 6 9
0 0 5   0 1 0   3 0 0                   6 9 5   4 1 7   3 8 2
~~~

一个构造良好的数独游戏有且只有一个解并可通过逻辑推理得到，虽然有时需要使用“猜测加证实”的方法来减少可能性（该意见目前让具有很大争议）。搜索的复杂性决定了游戏的难度；以上例子是一个简单
的数独游戏，因为其解可以通过直接推理得到。

[sudoku.txt](../resource/p096-sudoku.txt) 包含50个难度不同的数独游戏且每个都具有唯一解，其中第一个就是上面的例子。

将50个数独游戏全部解出，并求每个解出的网格左上角的三位数之和；例如，上面例子中网格左上角的三位数是483。

[题目96：开发一种解决数独问题的算法。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/97-96 title="题目96")

## 题解

答案(answer): 24702

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_96():
    '''auxiliary functions.'''
    same_row = lambda i, j: i//9 == j//9
    same_column = lambda i, j: (i-j)%9 == 0
    same_block = lambda i, j: i//27 == j//27 and (i%9)//3 == (j%9)//3

    def solve(a):
        i = a.find('0')
        if i == -1:
            return int(a[0:3])
        excluded = set()
        for j in range(81):
            if same_row(i, j) or same_column(i, j) or same_block(i, j):
                excluded.add(a[j])
        for m in '123456789':
            if m not in excluded:
                k = solve(a[:i]+m+a[i+1:])
                if k != 0:
                    return k
        return 0

    sudokus = open('p096-sudoku.txt', 'r').readlines()
    chars = ''.join([line[0:9] for line in sudokus if not 'Grid' in line])
    res = [solve(chars[i:(i+81)]) for i in range(0, len(chars), 81)]
    return sum(res)

if __name__ == '__main__':
    print(euler_96())

# vim: set sw=4, ts=4
~~~

