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
#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

This week, we stay in the realm of very simple patterns which end up being immensely powerful in many applications.

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
However, anything#footnote[Any associative binary operation] is on the table, even something like bitwise XOR!

= On your own

#problem_box[
    #lc_link(238, "product-of-array-except-self")
]

#problem_box[
    Pretty simple.
    This might genuinely help you on ICS 33 Project 4.

    #lc_link(528, "random-pick-with-weight")
]

#problem_box[
    Another somewhat simple one.

    #lc_link(724, "find-pivot-index")
]

#problem_box[
    #lc_link(523, "continuous-subarray-sum")
]

== Capstone

#problem_box[
    Let's generalize the one-dimensional case from above.
    A good solution only uses as much additional memory as the size of the input matrix, plus a constant amount of stack space.
    You might get sick of prefix sums after this.

    #lc_link(304, "range-sum-query-2d-immutable")
]
