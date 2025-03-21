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


#let title = "LeetCode Study Groups, Week 2"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

Lecture remains light this week as we introduce some core concepts taught in early ICS coursework.
Feel free to read less closely if you are confident in these topics.

= Topic 1: Queues and Stacks

Imagine goods flowing in and out of a business:

- At any time, there is the inventory of items you have on hand.
- You get shipments of new items to sell; these are added to your inventory.
- You sell items; these are removed to your inventory.

Then there are two very simple ways to manage this inventory#footnote[
    LIFO allows you to pretend your taxable income is lower when the price of the item is increasing.
    If you enjoy accounting, try to figure out why.
]:

+ When someone asks for an item to buy, give them the oldest one you have on hand.
    This is called a #strong[F]irst #strong[I]n, #strong[F]irst #strong[O]ut (*FIFO*) system.
    The shipment which came in first (hence, earliest) will be sold first.
+ You could also give them the shipment you most recently recieved.
    This is called a #strong[L]ast #strong[I]n, #strong[F]irst #strong[O]ut (*LIFO*) system.
    Thie shipment which came last (hence, latest) will be sold first.

These resemble two other structures you may be familiar with:
+ Imagine we arranged our shipments on a shelf.
    When a shipment comes in, we push it in on one side (suppose the right side) and let all the shipments slide left.
    When we sell an item, we take the leftmost one at all times.
    This is how the line at the bus stop works.
    If you're British, it's a *queue*.
+ You could also stack your shipments vertically.
    When a shipment comes in, put it on the top of the pile.
    When you have to sell one, take it off the top.
    This is a *stack*.

#definition_box[
    The *queue* is the linear *LIFO* data structure. \
    The *stack* is the linear *FIFO* data structure.

    In both cases, but particularly with a stack, we talk about #strong[push]ing (adding) and #strong[pop]ping (removing) elements.
    We also may be interested in #strong[peek]ing at whether we can remove an element from the queue or stack, _without actually removing it_.
    The current size of a queue or stack is usually available also.
]

We will see how these two structures are applied throughout the term.
For now it is important to understand that control flow, i.e. how your computer moves through your code, is stack based.
A function call is a push onto the stack, and returning from a function call is a pop from the stack#footnote[
    Your ICS 45C instructor will teach you more about this.
].

== Application

Queues and stacks solve different kinds of problems.
We will walk through some here.

#problem_box(solution: [
    You may have realized that a stack is correct.
    Suppose you choose to move through the string from left to right.
    For the sake of simplicity, we'll refer to all parentheses/braces/brackets as braces.
    You would do something like the following:

    Get the next character from the string.
    - If it's an opening brace, push it onto the stack.
    - If it's a closing brace:
        - Pop the top of the stack.
            If you can't, this closing brace is unmatched and you can answer in the negative immediately.
        - Check what you just popped.
            If it doesn't match (i.e. isn't the correct kind of opening brace), this closing brace is unmatched and you can answer "no".
            If it does match, you can continue on.

    When you run out of characters:
        - If the stack isn't empty, there was at least one unmatched opening brace.
        - If the stack is empty, everything is okay.
            You answer "yes".
])[
    A very popular LeetCode problem is #lc_link(20, "valid-parentheses").
    You should use either a queue or stack, and move through the string left to right or right to left and update this queue or stack as you go.
]

Python code for the above:
#code_file_block("lcsg02_valid_paren.py")

#problem_box(solution: [
    Simply build a queue.
    Write a function to handle a nested integer object which recurses if the object contains a list.
    If the object is just an integer, add it to the queue.
    Then iterating is as easy as emptying the queue.
])[
    #lc_link(341, "flatten-nested-list-iterator")

    Simple with recursion and a queue.
]

#code_file_block("lcsg02_nested.py")

== Deque

You may also find the *double-ended queue* ("deque") useful in some circumstances.
The upside of a deque is that values can be added and removed both at the front and back.

== Representation

It is important to understand that a stack or queue is similar to the concept of an "interface" in OOP languages like Java.
It is not so much a data structure with a unique character; it is more so an _interpretation_ of some kind of list (array, linked list, etc.) where we forgo random access (the ability to look at any index).
If you are asked to implement a stack or queue, you will probably use an array or linked list.

= Topic 2: Linked lists (very briefly)

#definition_box[
    A *list* is an ordered collection of elements of varying length.
    An *array* does not vary in length.
]

We require arrays be contiguous in memory; that is, one element is stored right after the other.
With linked lists, we break this constraint.
We can store the elements anywhere we want, but each element must store both its contents and the location of the next element.
To remember the list, we remember the location of the first element, the *head*.
The last element is the *tail*.

Storing only "forward" pointers makes it hard to move backwards in the list; we can store pointers to previous elements too and create a *doubly linked list*.

We could also link the head and tail, creating the *circular linked list*.
This can also be singly or doubly linked.
The granular details of linked lists, such as their upsides and downsides over arrays, are best left for your coursework, but we will see the concept of similar elements referring to each other again.

= On your own

#problem_box[
    #lc_link(143, "reorder-list")
]

#problem_box[
    A stack classic.
    #lc_link(150, "evaluate-reverse-polish-notation")
]

#problem_box(solution: [
    Hint: You can generate the correct ordering using your own queue.
])[
    #lc_link(950, "reveal-cards-in-increasing-order")
]

#problem_box(solution: [
    Hint: For $O(n)$, think about how much time each _person_ takes.
])[
    #lc_link(2073, "time-needed-to-buy-tickets")

    You could simulate your own queue, but this would make your time complexity $O(t n)$ if $n$ people buy $t$ tickets each.
    This is a good starting point, but you can solve this in $O(n)$.
]

== Capstone

You should attempt at least one of these, but preferably both.

#problem_box[
    *Capstone 1*: #lc_link(225, "implement-stack-using-queues")
    Bonus points if you can find the one-queue solution too.

    *Capstone 2*: #lc_link(232, "implement-queue-using-stacks")
]

== Challenge

#problem_box[
    *Challenge*: #lc_link(32, "longest-valid-parentheses")
]
