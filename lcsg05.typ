#import "lib.typ": *
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

#let title = "LeetCode Study Groups, Week 5"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

We will take a break from graph theory this week.
Instead we will discuss the second most requested topic: dynamic programming.
You will see dynamic programming very often in many areas of software engineering and in interviews as well.

= Topic 1: Dynamic programming

Have you ever considered how `git diff` works?
Imagine your committed file looks like this:

```
aaaaaaa
bbbbbbb
ccccccc

1111111
2222222
3333333
```

Suppose we changed the file as follows:
```
aaaaaaa
bbbbbbb
ddddddd
2222222
3333333
eeeeeee
```

Now, the questions you might want `git diff` to answer:

- Is this one "hunk" of changes or multiple hunks?
- Can you pair up sufficiently similar lines from the two versions?
    Given this pairing, how have those lines changed?

Of course, there are some numerical parameters and interpretation left to be done for these questions, but notice some important properties.

- The solution cannot be solved in a simple divide and conquer manner.
    Any choice of where to divide the problem will inevitably result in some need to reference across chunks.
    This violates the basic requirement that the divided problems be independent of each other.
    *This distinguishes dynamic programming from simple recursion*;
    a problem like the factorial function#footnote[over natural numbers] is not considered dynamic programming since each step depends on one non-overlapping sub-problem.
- However, solving the problem over smaller overlapping chunks is still useful and can help us create the solution for a full file.

Formally these properties are called optimal substructure (if the optimal overall solution is a function of optimal solutions of smaller versions of the problem) and overlapping sub-problems (if sub-problems overlap completely, because the same sub-problem is required more than once, or if they partially overlap).

To solve a dynamic programming problem, combine the solutions to *overlapping* sub-problems in some way.
*Dynamic programming is a generalization of recursion.*
It can also be seen as a computational application of functional equations.

<fib-dp>
#problem_box(solution: [
    (syntax highlighting wasn't updated for python 3.10 my bad g)
    ```py
def fib(n: int) -> int:
    match n:
        case 0:
            return 0
        case 1:
            return 1
        case other if other >= 0:
            return fib(n - 1) + fib(n - 2)
        case _:
            raise ValueError("no")
    ```
])[
    While not usually taught as such, computation of the Fibonacci number $F_n$ is technically a dynamic programming problem.
    The sequence is defined as follows:

    $
    F_n := cases(
        0 &"if" n=0,
        1 &"if" n=1,
        F_(n-1) + F_(n-2) &"otherwise"
    )
    $

    Implement this simple calculation in code.
]

It is often possible to organize these sub-problems in some way.
For example, for the Fibonacci sequence above, you can organize the problems in a line in order based on $n$.
There is a notion of dimensionality for dynamic programming, loosely defined as the number of inputs.
The Fibonacci calculation is one-dimensional, for example.

Also note the difference between *top-down* and *bottom-up* dynamic programming.
This notion is common to recursion in general and describes whether you solve the smallest or largest version of the problem first.
When you use recursion to solve a dynamic programming problem, a top-down approach is best (start with the biggest version and solve smaller ones on demand).
But you may also be able to solve it iteratively (usually a for-loop) if you solve bottom-up instead (compute the smallest version first).

*To solve a dynamic programming problem*:
- Find a base case or cases; is there some input to the problem which makes it trivial?
    In that case, what is the solution?
- Find a way to organize the problem and sub-problems.
    For example, if it has two nonnegative or positive integer inputs, a grid may be appropriate to understand the way sub-problems depend on one another.
    If you can find such an organization, it will greatly aid in implementing a solution.
- Given every smaller version of the problem is already solved, how can you solve a slightly larger version?

= Topic 2: Memoization

This principle is simple.
While solving smaller versions of a problem for dynamic programming, *store your result* so it is computed at most once.

#problem_box(solution: [
    ```py
    fib_saved = {}

    def fib(n: int) -> int:
        if n in fib_saved:
            return fib_saved[n]

        ret = fib_inner(n)
        fib_saved[n] = ret
        return ret

    def fib_inner(n: int) -> int:
        match n:
            case 0:
                return 0
            case 1:
                return 1
            case other if other >= 0:
                return fib_inner(n - 1) + fib_inner(n - 2)
            case _:
                raise ValueError("no")
    ```

    Before we added memoization, each step caused the computation of two smaller steps, meaning the time complexity was $O(2^n)$.
    (The base of the exponent is actually $phi$, but all exponential time complexites are written $2^n$.)
    With memoization, we now use linear time but incur linear space, which is more than acceptable.
    In fact, constant space is possible if we discard values when we no longer need them.
    This reuse of memory is a common and important way to optimize dynamic programming.
])[
    What was the time complexity of the Fibonacci implementation above?
    If you have not already, add memoization to your solution.
    What is the new time complexity?
]

If you use Python, try #link("https://docs.python.org/3/library/functools.html#functools.cache")[`functools.cache`].
This decorator adds memoization to a function in one line.

= On your own

== Warm up

#problem_box(solution: [
    Hint: think about the recursive equation (define the solution in terms of sub-problems).
    #link(<fib-dp>)[This structure should be familiar to you].

    Second hint: To optimize to constant space, think about how you can reuse memory like we mentioned.
])[
    #lc_link(198, "house-robber") \
    Ensure you memoize, even if you don't initially.
    Memoization or using an iterative solution are the only ways to achieve linear time.

    For an extra challenge, find a solution in constant space.
    For added pain, try it in one line (possible with Python `reduce`, JS/TS `reduce`, and Rust `fold`).
]

#problem_box(solution: [
    Hint: As always, find a way to characterize this as a recursive function.
    What might the inputs be to such a function?
    Given a prefix (or suffix) of a combination, what can you say about the rest of the string?
])[
    #lc_link(22, "generate-parentheses") \
    This one is more constructive in nature, but is dynamic programming nonetheless.
]

#problem_box(solution: [
    Hint: Be lazy; there is a way, with a little thought, to reuse your solution to the non-circular variant.
])[
    #lc_link(213, "house-robber-ii")

    Try for constant space and linear time again if you have the time.
]

== Capstone

#problem_box(solution: [
    Hint: The sub-problems are suffixes of the input string and pattern.
    Determine under what conditions you can consider a sub-problem removing how much of which string (or even both strings).
    Determine under what conditions you immediately know a match is impossible and you do not have to check sub-problems.
])[
    #lc_link(10, "regular-expression-matching")
]

== owie owie owie

*All* of these are challenge problems.
These are probably like what you'd expect for a full-time role.
The first is certainly within reach.
Remember to work as a group if needed.

#problem_box(solution: [
    Hint: The sub-problems are right lower slices of the dungeon (where some rows on top and columns at left are removed).
])[
    #lc_link(174, "dungeon-game") \
]

#problem_box[
    #lc_link(887, "super-egg-drop") \
    A dynamic programming classic.
]

#problem_box[
    We assigned the "Best Time To Sell Stock" trilogy as a challenge in week 1.
    Regardless of where you started your LeetCode journey, you now know enough to tackle them.
    Try for an iterative solution, in linear time and linear space.
    Constant space is possible, which is similar in nature to the constant space optimization in House Robber.
    - #lc_link(121, "best-time-to-buy-and-sell-stock")
    - #lc_link(122, "best-time-to-buy-and-sell-stock-ii")
    - #lc_link(123, "best-time-to-buy-and-sell-stock-iii")
]
