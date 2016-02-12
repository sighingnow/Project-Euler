Problem 99. Largest exponential
==========================

## 题目

Comparing two numbers written in index form like $2^11$ and $3^7$ is not difficult, as any calculator would confirm
that $2^{11} = 2048 < 3^{7} = 2187$.

However, confirming that $632382^{518061} > 519432^{525806}$ would be much more difficult, as both numbers contain over three
million digits.

Using [base_exp.txt](../resource/p099-base_exp.txt) (right click and 'Save Link/Target As...'), a 22K text file containing one
thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

**NOTE**: The first two lines in the file represent the numbers in the example given above.

[Problem 99. Largest exponential](https://projecteuler.net/problem=99 "Problem 99")

## 翻译

比较两个写成上标形式的数并不困难，比如 $2^{11}$ 和 $3^{7}$，因为任何计算机都会告诉你 $2^{11} = 2048 < 3^{7} = 2187$。

但是，要确实 $632382^{518061} > 519432^{525806}$ 就要困难很多，因为这两个数都包含超过三百万位数。

[base_exp.txt](../resource/p099-base_exp.txt) 包含一千行内容，每一行都包含一个基和一个指数，找出哪一行具有最大的值。

**注意**：前两行的数字就是上面给出的例子。

[题目99：文件中哪一个 基/指数 对具有最大的数值？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/100-99-- title="题目99")

## 题解

答案(answer): 709

### 分析

Suppose $a^x > b^y$, then $\log{a^x} > \log{b^y}$, then $x \times \log{a} > y \times \log{b}$. Thus, we can reduce these
exponents to a manageable size in this way.

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from math import log

def euler_99():
    data = [map(int, line.split(',')) for line in open('p099-base_exp.txt').read().split()]
    x = [(x*log(a), i) for i, (a, x) in enumerate(data)]
    return max(x)[1]+1

if __name__ == '__main__':
    print(euler_99())

# vim: set sw=4, ts=4
~~~

