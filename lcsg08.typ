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


#let title = "LeetCode Study Groups, Week 8"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#pagebreak()

= Topic 1: Heaps in brief

Suppose we were to come up with a new data structure.
We want the following:
- The data set is sequential; that is, the elements have some intended _ordering_.
- This ordering is not related to the insertion order of the elements.
- We want to retrieve the "first" element in the collection, where "first" is defined according to this ordering.
- We can also add elements to this queue at any time.
  Insertion order should not matter, so inserting some bag of elements in any order should not change the order in which they are retrieved.

Many sequential data structures you already know about are capable of achieving this.
We're going to introduce a new one.

#definition_box[
  A *binary heap* (or just "heap") is a data strcture based on a binary tree.
  In addition to being a binary tree, two additional properties hold for binary heaps:
  - They are _complete_ binary trees.
    To recap, this means that:
    - Every layer of the tree, except the last, must have as many nodes as possible.
    - The last layer is "filled in" from left to right.
      It can also be empty or completely filled in.
  - For any node and its parent, the parent is not _ordered after_ the child.
    (We can't just say the parent is _ordered before_ the child, because they are allowed to be ordered equivalently.)
    For example, if a node containing 5 and a node containing 3 are parent and child, then 3 must be the parent.
    If two nodes have equivalent value, their positions are interchangeable.
]

Note that we avoided using the words "greater than" and "less than".
Ordering can be defined in any way you choose, including using the conventional definition where smaller numbers are ordered earlier.
But you could also reverse the usual order of numbers to say that larger numbers should be ordered before smaller numbers.
Alterations like thuise are particularly meaningful when storing something more complex than a number in a heap.
The ordering can then be defined on one or more properties of the item stored.

Heaps are often labelled *min-heap*s or *max-heap*s, depending on whether the minimum or maximum element is removed first.

The possible operations on a binary heap are:
- Insert a new element.
  We won't discuss the implementation here, but the element has to be moved to the correct position in the heap.
  This takes $O(log n)$ time.
- Remove an element.
  The element which is removed will be an element which is either ordered before or ordered equivalent to all other elements.
  Without going into details, it is necessary to shift other elements of the heap "upward" to fill successive empty spots in the heap.
  This takes $O(log n)$ time.

= Topic 2: Priority queues

Similarly to stacks and queues, a priority queue is an abstraction where multiple data structures may be used to actually implement its operations.
A priority queue simply requires the insert and remove (sometimes called "pop") operations described above.
To utilize a priority queue, choose an implementation and determine how your collection of elements should be ordered.

As an example of a second implementation of a priority queue on an array:
- You'll probably want to put lowest-ordered elements at the end of the array, so you can remove one in $O(1)$ time.
- Other elements should be stored in sorted order, according to the ordering you define.
- To insert an element, find its correct position according to the ordering and insert it there.
  You can make this slightly faster using a binary search.
- To remove an element, remove the last element of the array.

Notice how a binary heap is much faster than this.
Suppose, in the worst case, you wanted to insert an element which ended near the beginning of the array.
In a sorted array, you would need to shift most of the elements over, taking $O(n)$ time.
You don't need to pay this cost in a binary heap.

#problem_box(solution: [
  The best way to store the frequencies of each element is a hash map or dictionary.
  For $n$ appearning $f$ times, we could sort the $(n, f)$ pairs by descending $f$-value, and take the first $k$ elements.
  This would take $O(n log n)$ time to sort.
  However, we're required to do better than this.
  Notice two things:
  - We don't care about the items less frequent than the top $k$, so sorting them is a waste of time.
  - Since we can return the top $k$ in any order, we don't need to sort those, either, as long as we know whether they make the cut.

  A heap can take advantage of both of these facts:
  - Iterate over the $(n, f)$ pairs.
  - Insert them into the heap, defining the ordering so that higher $f$-values mean the pair is ordered later.
  - If the heap has more than $k$ elements, we know that some pairs in the heap cannot be in the top $k$.
    Since we set up the ordering in ascending $f$ order, popping will remove pairs with small $f$.
    Therefore, we pop elements until the heap has no more than $k$ elements.
  - To finish, we simply extract all $n$ from the heap.
    Heaps often have a facility to empty their data in a non-sorted order, which is faster than popping all elements out.
    If this is available, use it, because we are allowed to return our result in any order.

])[
  Solve #lc_link(347, "top-k-frequent-elements").
  We also require that the solution is faster than $O(n log n)$.
  You can easily achieve that time without a heap.
]

= On your own

#problem_box[
  Solve #lc_link(295, "find-median-from-data-stream").

  For the problem above, we only cared about ordering elements around the largest values of $f$, and a heap was useful because it allows us to avoid the full cost of sorting the entire collection.

  In this problem, we care about ordering elements around a different position.
  Think about how heaps can help.
]

#problem_box[
  Solve #lc_link(215, "kth-largest-element-in-an-array") in less than $O(n log n)$ time.
]

#problem_box[
  Solve #lc_link(1094, "car-pooling").
]

== Capstone

#problem_box[
  Solve #lc_link(502, "ipo").

  stonks
]
