Problem 59. XOR decryption
========================================

## 题目

Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using [cipher1.txt](../resource/p059-cipher1.txt) (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.

[Problem 59. XOR decryption](https://projecteuler.net/problem=59 title="Problem 59")

## 翻译

电脑上的每个字符都有一个唯一编码，通用的标准是ASCII (American Standard Code for Information Interchange 美国信息交换标准编码)。例如大写A = 65， 星号(*) = 42，小写k = 107。

一种现代加密方法是用一个密钥中的给定值，与一个文本文件中字符的ASCII值进行异或。使用异或方法的好处是对密文使用同样的加密密钥可以得到加密前的内容。例如，65 XOR 42 = 107, 然后 107 XOR 42 = 65。

对于不可攻破的加密，密钥的长度与明文信息的长度是一样的，而且密钥是由随机的字节组成的。用户将加密信息和加密密钥保存在不同地方，只有在两部分都得到的情况下，信息才能被解密。

不幸的是，这种方法对于大部分用户来说是不实用的。所以一种修改后的方案是使用一个密码作为密钥。如果密码比信息短，那么就将其不断循环直到明文的长度。平衡点在于密码要足够长来保证安全性，但是又要足够短使用户能够记得。

你的任务很简单，因为加密密钥是由三个小写字母组成的。文件 [cipher1.txt](../resource/p059-cipher1.txt) (右键另存为)包含了加密后的ASCII码，并且已知明文是由常用英语单词组成。使用该文件来解密信息，然后算出明文中字符的ASCII码之和。

[题目59：使用暴力攻击，你能解开这个异或加密吗？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/60-59 title="题目59")

## 题解

答案(answer): 107359

### 分析

对于text must contain common English words，出现频率最高的字母应该是空格。据此，通过同济字符出现次数推断出密码。

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

from math import sqrt

def euler_59():
    origin_text = map(int, open('p059-cipher1.txt', 'r').read().split(','))
    sp = ord(' ')
    def solve(text):
        cnt = {}
        for c in text:
            cnt.setdefault(c, 0)
            cnt[c] += 1
        return max((k, c) for c, k in cnt.items())[1] ^ sp
    l = len(origin_text)
    groups = [origin_text[i:l:3] for i in range(3)]
    passwd = map(solve, groups)
    return sum(map(sum, map(lambda idx: map(lambda c: c^passwd[idx], groups[idx]), range(3))))

if __name__ == '__main__':
    t = time()
    print(euler_59(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
