---
title: Problem 9. Special Pythagorean triplet
author: He Tao
date: 2015-01-09
layout: post
---

## 题目

A Pythagorean triplet is a set of three natural numbers, $ a < b < c $, for which,

$$a^2 + b^2 = c^2$$

For example,

$$32 + 42 = 9 + 16 = 25 = 52.$$

There exists exactly one Pythagorean triplet for which $ a + b + c = 1000. $

Find the product abc.

[Problem 9. Special Pythagorean triplet](https://projecteuler.net/problem=9 "Problem 9")

## 翻译

一个毕达哥拉斯三元组是一个包含三个自然数的集合，$ a < b < c $，满足条件：

$$ a^2 + b^2 = c^2 $$

例如：

$$ 32 + 42 = 9 + 16 = 25 = 52. $$

已知存在并且只存在一个毕达哥拉斯三元组满足条件 $ a + b + c = 1000. $

找出该三元组中abc的乘积。

[题目9：找出唯一的满足 $ a + b + c = 1000 $ 的毕达哥拉斯三元组{a, b, c}](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/10-9a--b--c--1000a-b-c "题目9")

## 题解(Python)

答案(answer): 31875000

+ 分析

    1. 枚举a,b,c的值，判断是否满足条件$a^2+b^2=c^2$。
    2. 通过 Euclid'c formula 生成勾股数。

+ Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8

def euler_9():
    for a in range(3, 999):
        for b in range(2, a):
            for c in range(1, b):
                if a+b+c == 1000 and a*a==b*b+c*c:
                    return a*b*c

if __name__ == '__main__':
    print(euler_9())

## an improved solution using Euclid's formula:

def euler_9_improved():
    def pythagorean_triplet(p):
        '''Euclid's formula.
        a = m^2 - n^2
        b = 2 * m * n
        c = m^2 + n^2
        if p = a + b + c then n = p/(2 * m) - m
        '''
        a, b, c = 0, 0, 0
        for m in range(int(sqrt(p/2)), int(sqrt(p)/2), -1):
            n = p/(2*m) - m
            if n > 0 and (n+m)*2*m == p and n % 1 == 0:
                a, b, c = m*m-n*n, 2*m*n, m*m+n*n
                break
        return a*b*c
    return pythagorean_triplet(1000)

# vim: set sw=4, ts=4
~~~

