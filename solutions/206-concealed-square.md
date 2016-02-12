Problem 206. Concealed Square
========================================

## 题目

Find the unique positive integer whose square has the form `1_2_3_4_5_6_7_8_9_0`, where each `_` is a single digit.

[Problem 206. Concealed Square](https://projecteuler.net/problem=206 title="Problem 206")

## 翻译

找出唯一一个符合如下条件的数字：它的平方是具有 `1_2_3_4_5_6_7_8_9_0` 形式的数。每个 `_` 都代表了单个数字。

[题目206：隐藏的平方数。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/209-206 title="题目206")

## 题解

答案(answer): 1389019170

### 分析

根据这个数的平方的末位（个位）的数字是 $0$，因此，这个数的平方的倒数第二位（十位）的数字也是 $0$。因此，题目要求的数应该
介于 $\sqrt{1020304050607080900}$ 和 $\sqrt{1929394959697989900}$ 之间，也就是说，介于 $1010101010$ 和 $1389026623$ 之间，且末位（个位）数字为 $0$。
由于这个数的平方的倒数第三位（百位）的数字是 $9$，因此，这个数的最后一位应当是 $3$ 或者 $7$。

按照这一条件，枚举即可。对于这个题，由于最终的结果是一个很大的数，因此，从后往前枚举会比从前往后枚举快很多。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_206():
    lower = int(sqrt(1020304050607080900))
    upper = int(sqrt(1929394959697989900))

    ## validate = lambda x: all(x[2*i]==chr(ord('0')+i+1) for i in range(0, 9))

    ## a faster validate implementation.
    def validate(x):
        x = (x-1020304050607080900)//100
        while x > 0:
            if x % 10 != 0:
                return False
            x //= 100
        return True

    x, k = -1, -1
    ## If search the result from upper to lower bound, it
    ## will be very fast to get the result.
    for x in range(lower-lower%100, upper+1, 100):
        k = x+30
        if validate(k*k):
            break
        k = x+70
        if validate(k*k):
            break
    return k

if __name__ == '__main__':
    t = time()
    print(euler_206(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
