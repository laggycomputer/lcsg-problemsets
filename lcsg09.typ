#import "lib.typ": *
#import "@preview/whalogen:0.1.0": ce
#set page(
    "us-letter",
    numbering: "1"
)
#set heading(numbering: "1.1.1.")
#set enum(numbering: "1.a.")
#set math.mat(delim: "[")
#set text(
    font: "DM Sans"
)
#show link: set text(fill: blue)
#show link: underline


#let title = "LeetCode Study Groups, Week 9"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#pagebreak()

This week, we stay in the realm of very simple patterns which end up being immensely powerful in multiple applications.
There are a lot of problems, but many are short.

= Topic 1: Prefix sums

There are many operations on subarrays (that is, contiguous chunks within an array) which become faster when a *prefix sum* is computed.
In the most typical case, the $i$th element of the prefix sum array is the sum of elements indexed $0$ through $i$, inclusive (or, sometimes, excluding $i$).
These elements form a _prefix_ of the array, hence the name.

#problem_box[
    Suppose you have an array of length $n$.
    Explain how, after expending $O(n)$ space, you can find the sum of the elements in any subarray in $O(1)$ time.
    If you'd like to compel yourself to fully implement this, the problem is equivalent to #lc_link(303, "range-sum-query-immutable").
]

Much of the power of prefix sums also comes from our ability to do something while computing a prefix sum array:

```py
numbers = [1, 2, 3, 4]

# an array of zeroes with the same length as numbers; preallocating is wise here
prefix_sum = [0] * len(numbers)

accumulator = 0
for index, element in enumerate(numbers):
    # we could do something here; check a condition, update another data structure, etc.
    accumulator += element
    # or here, if we need the new accumulator value
    prefix_sum[index] = accumulator

# and we can use this array too!
print(prefix_sum)  # [1, 3, 6, 10]
```

== Generalizing

There are a few variations we can use to gain even more insight from prefix sums.
First, we can move from right to left instead, where every element in our new array will be the sum of the corresponding element in the original array and the elements to its _right_; now, we have a *suffix sum*.

We also don't have to sum; we can use any binary operation.
A common option is muliplication, creating a *prefix* or *suffix product*.
However, anything is on the table, even something like a prefix average!

= Topic 2: Bit manipulation

We assume you know the first 5 weeks of ICS 6B, particularly the Boolean binary operations.
You can think of these as operating on single bits.
But they also apply to multiple bits simulatneously; we call this *bit manipulation*.

== A word about reasoning with bit manipulation

You probably already know that computers understand integers as a string of bits of a fixed length.
For example, if you store the number 100 as a byte (8 bits), the computer will store the bits `01100100`.
This follows the rules you would expect of a base 2 representation, where:
$ 0 dot 2^7 + 1 dot 2^6 + 1 dot 2^5 + 0 dot 2^4 + 0 dot 2^3 + 1 dot 2^2 + 0 dot 2^1 + 0 dot 2^0 \ = 64 + 32 + 4 \
= 100 $

It's important to think about bits as integers like this, but it isn't appropriate for every situation.
For example, it's still helpful to know that powers of $2$ are represented as $1$ followed by $n$ zeroes in binary.
However you should also be capable of mentally separating integers from strings of bits.
When thinking about many concepts and problems, consider a string of bits as just that - a sequence of bits with fixed length - and nothing more.
*For most of this document we're going to forget that strings of bits can represent numbers at all.*

== Binary operators

(Remember that by "binary operator", we mean an operator which combines two things in some way.)

The first operator we will introduce is the *bitwise OR*.
It takes two bit strings of identical length.
The output is a bit string of the same length with the property that each bit in the output is the result of taking the logical OR of the two corresponding bits in the input strings.
Corresponding bits are the ones in the same "column" if you write the inputs and output on top of one another.
If you think back to bit strings as numbers, corresponding bits are the ones which have the same place value.

You can do the same with the *bitwise AND* and *bitwise XOR*.
The bitwise OR is usually written as `|` (that is, a single pipe symbol) in code.
It can be used on Boolean and integer types the way you have used `||` (logical OR) or `+` (arithmetic addition) before.
The bitwise AND is written `&` (a single ampersand).
The bitwise XOR is written `^`.
These symbols originate in C and have been borrowed into many languages, including Python and JavaScript.

== Composition of binary operators

To understand bit manipulation well, you should understand what sort of \*meaning\* you can attribute to these various operators.
For this, we need to reframe our pattern of thinking.
Before this (and in mathematics in general), we thought of these binary operators as producing a totally new output from two equally important inputs.
But now we will think about these operators as a way to update an existing value, an *accumulator*.
Every application of a bitwise operation will require the previous value of the accumulator and a new value to be consumed in some way.
The result will be the new value in the accumulator.
This is similar to how you might take the sum of multiple numbers; you could create an accumulator which initially stores $0$ and add values to it as you go.

=== OR

With this new understanding of bitwise operators, let's think about what happens if we update an accumulator using these three operations.
First, for bitwise OR, recall the "short-circuiting property" of the OR operation.
If you find one of the operands is $1$, then it doesn't matter what the other operand is.
In particular, this means that if you upadte the accumulator by adding a value with a $1$ bit in a certain position, the corresponding bit in the accumulator will be flipped to $1$, no matter what it was previously.
Once it's set (this is another term for turning the bit "on"), it will never be unset (as in, turned "off"), no matter what new values (if any) are used to update the accumulator.

=== AND

Bitwise AND is sometimes called a "mask".
A new value when applied to the accumulator acts like a mask; when there is a 0 in the new value, the accumulator will be zeroed out at that position.
You can "select" only certain bits from the accumulator (and unset the rest) by setting those bits in the new value.
Otherwise, the value already in the accumulator applies.
This is true because $X and 0 = 0$ and $X and 1 = X$ for a Boolean value $X$.
Notice that with OR, we could force a bit to turn on; now, we can force it to turn off.

=== XOR

Somewhat similarly to AND, any bits set in a new value will cause the corresponding bit in the accumulator to flip.
Bits not set in the new value will not change the accumulator.
Now we can turn on and off a bit, but also flip it.
XOR is unique because the number of bits set can both increase and decrease, unlike with AND and OR.
Also note some interesting identities around XOR:

$
  A xor A = 0 \
  A xor B = 0 arrow.l.r A = B
$

Note also that you can think about XOR as "$1$ if the two input bits were different, $0$ otherwise".

#problem_box(solution: [
    The bit string of all zeroes.
])[
    Think about the identity element for the XOR operation; that is, what is the bit string $e$ such that $A xor e = A$ for any string $A$ with the same length as $e$?
]

== Bit shifts

You may also find the concept of *bit shifting* useful.
You can obtain a new version of an existing bit string by shifting every bit to the left or right by some non-negative integer number of position.
Of course, you can do this to the *left* or *right*.
The expression to bit shift is `a >> 2` to bit shift `a` to the right by 2 bits, for example.
Like the bitwise operators, this is shared across many langauges.
You can also shift and assign, like `a <<= 1`.

Any bits which, when shifted, end up past the leftmost or rightmost bit position, are truncated and lost#[Unless you use a special "barrel shift", which has its uses.].
Any bits which are shifted into a new position but have no "source" bit are always zero.
So, for example, a left shift of one bit will move every bit to the left, forget the original leftmost bit, and add a new zero at the rightmost position.

= On your own

#problem_box()[
    Once you find the solution, you'll never forget it.

    #lc_link(136, "single-number")
]

#problem_box[
    Pretty simple.
    This might genuinely help you on ICS 33 Project 4.

    #lc_link(528, "random-pick-with-weight")
]

#problem_box(solution: [
    Hint: your first solution probably sums over pairs of numbers from the input array.
    The linear time solution sums over something else.
])[
    #lc_link(477, "total-hamming-distance")

    Doing this in $O(n^2)$ time (by examining every pair individually) is easily implemented.
    But you can also do it in linear time.
]

== Capstone

#problem_box[
    An ideal solution only uses as much additional memory as the size of the input matrix.
    You might get sick of prefix sums after this.

    #lc_link(304, "range-sum-query-2d-immutable")
]

#problem_box[
    Let's see if you have dynamic programming down yet.

    #lc_link(1611, "minimum-one-bit-operations-to-make-integers-zero")
]


== Extra practice problems

#problem_box[
    #lc_link(238, "product-of-array-except-self")
]

#problem_box[
    #lc_link(724, "find-pivot-index")
]

== Challenge

#problem_box(solution: [
    Hint: you can ignore duplicate numbers on the board.
    Why?
])[
    *Challenge*: #lc_link(810, "chalkboard-xor-game")

    This one requires a lot of thinking.
]
