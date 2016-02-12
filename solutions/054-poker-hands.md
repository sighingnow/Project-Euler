Problem 54. Poker hands
========================

## 题目

In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

+ High Card: Highest value card.
+ One Pair: Two cards of the same value.
+ Two Pairs: Two different pairs.
+ Three of a Kind: Three cards of the same value.
+ Straight: All cards are consecutive values.
+ Flush: All cards of the same suit.
+ Full House: Three of a kind and a pair.
+ Four of a Kind: Four cards of the same value.
+ Straight Flush: All cards are consecutive values of same suit.
+ Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:

    2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

Consider the following five hands dealt to two players:

| Hand       | Player 1               | Player 2               | Winner     |
|:----------:|:----------------------:|:----------------------:|:----------:|
| 1          | 5H 5C 6S 7S KD         | 2C 3S 8S 8D TD         | Player 2   |
|            | Pair of Fives          | Pair of Eights         |            |
| 2          | 5D 8C 9S JS AC         | 2C 5C 7D 8S QH         | Player 1   |
|            | Highest card Ace       | Highest card Queen     |            |
| 3          | 2D 9C AS AH AC         | 3D 6D 7D TD QD         | Player 2   |
|            | Three Aces             | Flush with Diamonds    |            |
| 4          | 4D 6S 9H QH QC         | 3D 6D 7H QD QS         | Player 1   |
|            | Pair of Queens         | Pair of Queens         |            |
|            | Highest card Nine      | Highest card Seven     |            |
| 5          | 2H 2D 4C 4D 4S         | 3C 3D 3S 9S 9D         | Player 1   |
|            | Full House             | Full House             |            |
|            | With Three Fours       | with Three Threes      |            |

The file, [poker.txt](../resource/p054-poker.txt), contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?

[Problem 54. Poker hands](https://projecteuler.net/problem=54 title="Problem 54")

## 翻译

在扑克游戏中，一局牌由五张牌组成，组成的牌的大小由低向高如下：

+ High Card: 最高值的牌.
+ One Pair: 两张面值一样的牌.
+ Two Pairs: 两个值不同的One Pair.
+ Three of a Kind: 三张面值一样的牌.
+ Straight: 所有的牌面值为连续数值.
+ Flush: 所有的牌花色相同.
+ Full House: Three of a Kind 加一个One Pair.
+ Four of a Kind: 四张牌面值相同.
+ Straight Flush: 所有的牌花色相同并且为连续数值.
+ Royal Flush: 10，J，Q，K和A，并且为相同花色。

牌的面值大小排序如下：

    2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

如果两个玩家的牌具有同样的排序（上面介绍的几种），那么他们牌的大小由手中最大的牌决定。例如，一对8比一对5大（见下面例一）；但是如果两个玩家都用一对Q，那么他们手中最大的牌就用来比较大小（见下面例四）；如果他们最高面值的牌也相等，那么就用次高面值的牌比较，以此类推。

考虑下面的几个例子：

| 局         | 玩家 1                | 玩家 2                 |  胜利者    |
|:----------:|:---------------------:|:----------------------:|:----------:|
|1           | 5H 5C 6S 7S KD        | 2C 3S 8S 8D TD         | 玩家 2     |
|            | 一对5                 | 一对8                  |            |
|2           | 5D 8C 9S JS AC        | 2C 5C 7D 8S QH         | 玩家 1     |
|            | 最大面值牌A           | 最大面值牌Q            |            |
|3           | 2D 9C AS AH AC        | 3D 6D 7D TD QD         | 玩家 2     |
|            | 三个A                 | 方片Flush              |            |
|4           | 4D 6S 9H QH QC        | 3D 6D 7H QD QS         | 玩家 1     |
|            | 一对Q                 | 一对Q                  |            |
|            | 最大牌9               | 最大牌7                |            |
|5           | 2H 2D 4C 4D 4S        | 3C 3D 3S 9S 9D         | 玩家 1     |
|            | 三个4的Full House     | 三个3的Full House      |            |

文件 [poker.txt](../resource/p054-poker.txt) 包含一千局随机牌。每一行包含十张牌（用空格分隔）；前五张是玩家1的牌，后五张是玩家2的牌。 所有的牌都是合理的（没有非法字符或者重复的牌）。每个玩家的牌没有顺序，并且每一局都有明确的输赢。

其中玩家1能赢多少局？

[题目54：在扑克游戏中玩家1能赢多少局？](http://pe.spiritzhang.com/index.php/2011-05-11-09-44-54/55-541 title="题目54")

## 题解

答案(answer): 376

### Python

~~~python
#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import time

def euler_54():
    def calc_rank(cs):
        nums, graphs = zip(*sorted(cs))
        ns, gs = map(lambda x: len(set(x)), (nums, graphs))
        cons = all(nums[i]-nums[0] == i for i in range(5))
        if gs == 1 and cons:
            if nums[0] == 10: # Royal Flush
                return 9
            else: # Straight Flush
                return 8, nums[4]
        if ns == 2:
            # Four of a Kind
            if nums[0] == nums[3]:
                return 7, nums[0], nums[4]
            if nums[1] == nums[4]:
                return 7, nums[1], nums[0]
            # Full House
            if nums[0] == nums[2]:
                return 6, nums[0], nums[3]
            if nums[1] == nums[3]:
                return 6, nums[1], nums[0]
            if nums[2] == nums[4]:
                return 6, nums[2], nums[0]
        # Flush
        if gs == 1:
            return 5, nums[4], nums[3], nums[2], nums[1], nums[0]
        # Straight
        if cons:
            return 4, nums[4]
        # Three of a Kind
        if nums[0] == nums[2]:
            return 3, nums[2], nums[4], nums[3]
        if nums[1] == nums[3]:
            return 3, nums[3], nums[4], nums[0]
        if nums[2] == nums[4]:
            return 3, nums[4], nums[1], nums[0]
        # Two Pairs
        if ns == 3:
            if nums[3] != nums[4]: return 2, nums[3], nums[1], nums[4]
            if nums[2] != nums[1]: return 2, nums[4], nums[1], nums[2]
            if nums[1] != nums[0]: return 2, nums[4], nums[2], nums[0]
        # One Pair
        if ns == 4:
            for i in range(4):
                if nums[i] == nums[i+1]:
                    s = nums[i]
                    nums = sorted(list(nums))[::-1]
                    nums.remove(s)
                    nums.remove(s)
                    return (1, s) + tuple(nums)
        # High Card
        return 0, nums[4], nums[3], nums[2], nums[1], nums[0]

    CARD = {'T': 10, 'J': 11, 'Q': 12, 'K': 13, 'A': 14}
    for i in range(2, 10):
        CARD[str(i)] = i
    preprocess = lambda cs: list(map(lambda x: (CARD[x[0]], x[1]), cs))

    def game(cards):
        ranks = map(lambda x: calc_rank(preprocess(x)), (cards[:5], cards[5:]))
        return ranks[0] > ranks[1] and 1 or 2

    data = open('p054-poker.txt').read().splitlines()
    data = map(lambda x: x.split(), data)
    return map(game, data).count(1)

if __name__ == '__main__':
    t = time()
    print(euler_54(), 'time: %f s'%(time()-t))

# vim: set sw=4, ts=4
~~~
