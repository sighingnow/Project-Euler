Problem 79. Passcode derivation
========================================

## 题目

A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.

The text file, [keylog.txt](../resource/p079-keylog.txt), contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

[Problem 79. Passcode derivation](https://projecteuler.net/problem=79 title="Problem 79")

## 翻译

网上银行通用的一种加密方法是向用户询问密码中的三位随机字符。例如，如果密码是531278，那么银行可以询问第2,3,5位字符，预期的回复应该是317。

文本文件 [keylog.txt](../resource/p079-keylog.txt) 包含50次成功的登录尝试。

已知三位字符总是按顺序询问，分析文件并找出可能的最短的密码（长度未知）。

[题目79：通过分析用户的登陆日志，你能否找到用户的数字密码？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/80-79 title="题目79")

## 题解

答案(answer): 73162890

### 分析

直接从密码为0开始枚举。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

def euler_79():
    def accept(s, r):
        offset = 0
        for c in r:
            offset = s.find(c, offset) + 1
            if offset == 0:
                return False
        return True

    log = open('p079-keylog.txt', 'r').read().splitlines()

    n = 0
    while True:
        n += 1
        s = str(n)
        for r in log:
            if not accept(s, r):
                break
        else:
            break
    return n

if __name__ == '__main__':
    print(euler_79())

# vim: set sw=4, ts=4
~~~
