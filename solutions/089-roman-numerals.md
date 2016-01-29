Problem 89. Roman numerals
========================================

## 题目

For a number written in Roman numerals to be considered valid there are basic rules which must be followed.
Even though the rules allow some numbers to be expressed in more than one way there is always a "best" way of writing a
particular number.

For example, it would appear that there are at least six ways of writing the number sixteen:

    IIIIIIIIIIIIIIII
    VIIIIIIIIIII
    VVIIIIII
    XIIIIII
    VVVI
    XVI

However, according to the rules only `XIIIIII` and `XVI` are valid, and the last example is considered to be the most efficient,
as it uses the least number of numerals.

The 11K text file, [roman.txt](../resource/p089-roman.txt) (right click and 'Save Link/Target As...'), contains one thousand numbers written in valid, but not
necessarily minimal, Roman numerals for the definitive rules for this problem.

Find the number of characters saved by writing each of these in their minimal form.

**Note**: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.

[Problem 89. Roman numerals](https://projecteuler.net/problem=89 title="Problem 89")

## 翻译

罗马数字的书写规则允许一个数字被用多种方式表达（具体见Roman Numerals）。但是，对于每个数字都存在一种“最佳”书写方式。

例如，以下是数字16的所有合法书写形式。

    IIIIIIIIIIIIIIII
    VIIIIIIIIIII
    VVIIIIII
    XIIIIII
    VVVI
    XVI

最后一种写法是最高效的，因为它使用了最少的数字。

[roman.txt](../resource/p089-roman.txt)包含了一千个罗马数字，但不一定是最简形式；也就是说它们都遵循单位递减规则和相减对规则。

找出将所有数字写成最简式一共节省的字符数。

**注意**：你可以认为文件中所有的每个罗马数字中同一单位的字符最多连续出现4次。

[题目89：将罗马数字表达为最简式。](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/90-89 title="题目89")

## 题解

答案(answer): 743

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from functools import reduce

def euler_89():
    replace_rules = [
        ('IIII', 'IV'),
        ('XXXX', 'XL'),
        ('CCCC', 'CD'),
        ('VIV', 'IX'),
        ('LXL', 'XC'),
        ('DCD', 'CM'),
    ]
    s = 0
    for line in open('p089-roman.txt', 'r').read().split():
        x = reduce(lambda num, rule: num.replace(rule[0], rule[1]), replace_rules, line)
        s += len(line)-len(x)
    return s

if __name__ == '__main__':
    print(euler_89())

# vim: set sw=4, ts=4
~~~
