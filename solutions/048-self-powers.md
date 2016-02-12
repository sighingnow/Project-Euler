Problem 48. Self powers
==================================

## 题目

The series, $$1^1 + 2^2 + 3^3 + ... + 10^{10} = 10405071317$$

Find the last ten digits of the series, $$1^1 + 2^2 + 3^3 + ... + 1000^{1000}$$

[Problem 48. Self powers](https://projecteuler.net/problem=48 "Problem 48")


## 翻译

$$1^1 + 2^2 + 3^3 + ... + 10^{10} = 10405071317$$

$$1^1 + 2^2 + 3^3 + ... + 1000^{1000}$$ 的最后十位是什么

[题目48：找出 $1^1 + 2^2 + ... + 1000^{1000}$ 的最后十位。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/49-4811--22----10001000 "题目48")

## 题解

答案(answer): 9110846700

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_48():
    return str(sum([s**s for s in range(1, 1001)]))[-9:]

if __name__ == '__main__':
    print(euler_48())

# vim: set sw=4, ts=4
~~~
