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


#let title = "LeetCode Study Groups, Week 6"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

This week includes a collection of simpler problems which exercise basic concepts, followed by stronger problems exercising previous topics in combination with this week's topics.

= Topic 1: Binary trees

#definition_box[
    A *binary tree* is a special case of a tree (recall this is an acyclic connected graph):
    - Every vertex has at most two children.
    - These children have a notion of handedness; each child is either a left child or a right child.
        We could formalize this but ¯\\\_(ツ)\_/¯
    - Both the left and right child are optional; there can be only a left child, only a right child, both a left and right child, or no children at all.
]

== Special cases

#definition_box[
    - A *full* binary tree is one where no nodes have one child.
    - A *complete* binary tree is one where every level except the last is filled.
        The last level may or may not be filled.
    - A *balanced* binary tree is one where for any two nodes, their subtrees differ in depth by no more than $1$.
        This is an important property which comes up often; a balanced tree minimizes the depth needed to find any node.
    - A *perfect* binary tree is one where all leaves are at the same level.
        It is necessarily also full, complete, and balanced.
]

== Traversal <traversal>

#definition_box[
    - The *pre-order* traversal traverses its root, then recursively traverses the left child (if present), then the right.
    - The *in-order* traversal visits its root between visiting the left and right subtrees.
    - The *post-order* traversal visits its root after visiting the left and right subtrees.

    You already know the *breadth-first* and *depth-first* traversals.
]

== Representation

We sometimes represent binary trees with references; a parent stores a pointer to its left and right child.
LeetCode defines binary trees as follows in Python:
```py
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```

Notice again that each node has a value; this is very important especially for the next topic.

For complete trees it is also possible to represent the tree as an array of values; for the node at index $i$ then its children are at indices $2i + 1$ and $2i + 2$.
This naturally allows for breadth-first traversal and may be more common in low-level languages.
LeetCode writes their problem inputs in this format (even if actual representation as passed to your code is usually reference-based).

== Some simple operations

There are some operations on a binary tree which are often used as quick interview questions.
There are too many to assign problems for, but here are a few in quick succession:

- To *invert* a binary tree is to swap left and right children: #lc_link(226, "invert-binary-tree")
- Is a binary tree *symmetric*, i.e. identical to its inverse? #lc_link(101, "symmetric-tree")
- Check if a tree is *height-balanced*, as defined above: #lc_link(110, "balanced-binary-tree")

= Topic 2: Binary search trees (BSTs)

== Binary search

#problem_box(solution: [
    If the list is not sorted (or no total ordering exists over the elements), you have no choice but to check every element.
    This takes linear time.
])[
    What is the time complexity to check for the presence of an element in an _unsorted_ list?
]

#problem_box(solution: [
    Perform a *binary search*:
    + Check the 5-hour mark.
        If the bike is still there, it was stolen later in the night.
        If the bike is gone, it was stolen earlier.
    + You now know the bike was stolen in a 5-hour interval instead of a 10-hour interval, a significant improvement.
        Check the midpoint of this 5-hour interval.
    + Repeatedly narrow down the interval by halving it until you watch the theft occur.

    This takes $O(log n)$ time.
    Even if you had a surveillance feed equal in length to the age of the universe#footnote[assuming our whole universe was in a hot dense state], and it took 5 seconds to check a point in time, you would be able to find when the bike was stolen in under 5 minutes.
])[
    Police sometimes struggle to quickly determine when exactly an object was stolen, even if the theft is caught on camera#footnote[
        This is a retelling of an #link("https://www.thetimes.com/article/i-have-owned-11-bikes-this-is-how-they-were-stolen-d3r553gx3")[article] in _The Times_.
    ].
    Suppose I have a camera feed of a bike rack for a 10-hour period of last night.
    During this same time period, someone reports a certain bike on that rack was stolen.
    Imagine it takes roughly 30 seconds to steal the bike; how many times do I have to scrub the video to know, down to the minute, when the bike was stolen?
    What time complexity is this problem?
]

In more earthly terms, a binary search is generally applied to a sorted list as follows:
+ Check the midpoint of the list.
    If the element you're looking for is greater than this midpoint, restart the algorithm with the part of the list after the midpoint.
    If the element you're looking for is less than this midpoint, restart the algorithm with the left part of the list instead.
+ Eventually, you will find where in the list your element is, or where it should be inserted such that the list remains sorted.

Obviously this requires that the elements in the list be comparable#footnote[Strictly speaking, a total ordering must exist.]; i.e. that it makes sense (in mathematical terms, "is defined") to ask whether one element is greater or less than another.
Binary search is why sorting a list can be so effective; for a one-time cost of $O(n log n)$ time (to sort the list), any element (or its insertion position) can be found in $log n$ time.

== BST

There is a way to precompute and store this binary search; this is a binary search tree.

#definition_box[
    A *binary search tree* is a binary tree where for any node $v$:
    - The left child of $v$ (if it exists) and its children all have values less than the value assigned to $v$.
    - The right child of $v$ (if it exists) and its children all have values greater than the value assigned to $v$.
]

<bst-traversal>
Also note that *the in-order traversal of a BST traverses nodes in increasing label order*.

= On your own

== Warm up (optional)

These are each pretty easy.
If you're short on time, just write pseudocode or work them out in your head.
We get it, it's midterms.

#problem_box[
    Solve at least one of:
    - Pre-order traversal: #lc_link(144, "binary-tree-preorder-traversal")
    - In-order traversal: #lc_link(94, "binary-tree-inorder-traversal")
    - Post-order traversal: #lc_link(145, "binary-tree-postorder-traversal")

    Once you solve one, the others are trivial.
    The question is simply whether you're willing to copy-paste.
]

For these two, think about the problem in terms of cases and what do do in each case.

#problem_box[
    #lc_link(617, "merge-two-binary-trees")
]

#problem_box[
    #lc_link(111, "minimum-depth-of-binary-tree")
]

== Lock in

There's a reason we covered dynamic programming first.

#problem_box[
    #lc_link(96, "unique-binary-search-trees")

    _Do not_ reuse your solution to \#95 for this problem.
    The time limits are configured to prevent this.
    When you are just counting, optimizations are both possible and mandatory.
]

#problem_box[
    #lc_link(95, "unique-binary-search-trees-ii")

    Now, produce all the trees instead of just counting.
    The time limits are relaxed.
]

#problem_box(solution: [
    Hint: You cannot rob both a parent and its immediate child.
    Reframe your old solution accordingly, taking into account the fact that there are two children.

    Second hint:
    Last time, you had to choose between robbing the house you were standing at and skipping it, robbing the next house instead.
    What is your choice this time, given you are standing at a house?
])[
    Thought we were done with House Robber?
    The nightmare continues!
    #lc_link(337, "house-robber-iii")
]

#problem_box(solution: [
    Hint: How can you find the root in the traversals?
    If you know this, how can you find the traversals of the left and right subtrees?
    Use recursion to act on your answers and build the tree top-down.
])[
    In both of these problems, neither traversal you're given is the full picture.
    Figure out how both _together_ inform you about the original tree, particularly about parent-child relationships.
    Solving one trivializes the other.

    - #lc_link(105, "construct-binary-tree-from-preorder-and-inorder-traversal")
    - #lc_link(106, "construct-binary-tree-from-inorder-and-postorder-traversal")
]

== Capstone

#problem_box(solution: [
    Hint: Suppose, in the worst case, you try to delete an element with left and right children, each with their own subtree.
    Think about which element ought to replace the one to be deleted.
    Once you figure this out, all you need to do is reassign some references and account for the cases where some or all of these children and subtrees are missing.

    Second hint: Given the relationship between nodes on a BST, #link(<bst-traversal>)[some traversal methods are better than others].
])[
    *Capstone*: #lc_link(450, "delete-node-in-a-bst")
]
