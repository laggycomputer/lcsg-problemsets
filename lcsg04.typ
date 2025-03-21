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


#let title = "LeetCode Study Groups, Week 4"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

= Topic 1: Graph theory, continued

== Eulerian trails

#definition_box[
    An *Eulerian trail*, *cycle*, and/or *path* is such a trail, cycle, and/or path which visits every edge in a graph exactly once.

    "Euler" is pronounced like "oiler".
]

#problem_box(solution: [
    Imagine we are walking across bridges (edges) which collapse as we run along them.
    For every $v_2, dots, v_(n-1)$ (i.e. the vertices which are not the endpoints) on our trail, we must both arrive at that vertex and leave.
    This "consumes" two bridges.
    Thus the degree of these non-terminus vertices (the number of bridges left) decreases in pairs.

    The exceptions are the first and last vertex.
    If there are two vertices with odd degree, they must be the start and end (or vice versa) of the path.
    There is one vertex we never leave and one we never enter, hence the odd degree.

    If there are no vertices with odd degree, we can start and end wherever we please.
])[
    An Eulerian trail is possible on the simple graph $G$ if and only if there are exactly zero or two vertices with odd degree.
    Explain why.
]

#problem_box[
    Bonus: Euler's Theorem states that an Eulerian cycle exists on a simple graph $G$ if and only if there are zero vertices with odd degree.
    Based on the above, explain why.
]

== Trees

We introduced the concept of a tree last week.
This week we have assigned more problems on trees and will introduce some vocabulary.
Recall that a tree is an *acyclic connected* graph.

You may imagine a tree in nature as having many sprawling roots at the bottom and branches above it.
However, in mathematics and computing, the root is a single vertex and it is typically drawn at the top of any diagram.

The root of a tree is not unique; any vertex can serve as the root.
However, you will see in this week's problem set that some choices of the root are better than others.

Trees also create a hierarchy between their vertices; for any two neighboring vertices, one is always a *parent* and the other a *child*.
Of course, a parent can have one or more children.
The root is a grandparent or parent of every other node.

#definition_box[
    A *leaf* of a tree $G = (V, E)$ is a vertex $v in V$ with degree 1.
    In other words, it connects only to its parent.
]

#problem_box(solution: [
    We proceed by induction.
    Throughout, let $G$ be a tree; an undirected, acyclic graph.

    Base case: if $G = ({v}, emptyset)$ is a lone vertex, clearly $1 - 0 = 1$. \
    Inductive step: Suppose we _add_ a vertex $v$ to $G$ to form $G prime$.
    - Adding no new edges is not acceptable; then $G prime$ would be disconnected.
    - Adding multiple new edges is not acceptable; then $G prime$ is not acyclic.
    - We must add exactly one edge.
    In this step from $G$ to $G prime$, we have incremented both the order and degree.
    Thus their difference does not change. $square$

    For those unfamiliar with induction, we have essentially shown that, for the most simple case of a lone vertex, the theorem is true.
    We then showed that this implies, in a domino fashion, that the theorem is true on any more complex graph.

    Conversely we could have done this reductively instead of reductively; removing vertices and edges until we reached the base case.
    We will do something similar in the problem set.
])[
    A special case of Euler's formula states that for a nonempty#footnote[i.e. there is at least one vertex] tree $G$, $|V| - |E| = 1$.
    Recall from last week that this means that the order is one more than the degree.
    Explain why this is the case.

    ICS 6B survivors: Use induction.
]

Finally, when you traverse a tree, you *do not* need to remember which vertices you have already visited.
Since the tree is acyclic you can never reach a vertex by more than one path away from the root.

== Directed graphs

Last week we ignored the existence of *directed graphs*, or *digraphs*.
Their definition is similar to that of a graph, but we create a notion of direction for edges by defining them as _ordered_, not unordered, pairs.

This warrants some new definitions.

#definition_box[
    On a simple directed graph $G = (V, E)$, the *indegree* of a vertex $v in V$ is the number of edges which point _into_ $v$.
    It is denoted $"deg"^- v$ (a minus sign in the exponent or subscript).

    Similarly, the *outdegree* $"deg"^+ v$ is the number of edges pointing _out_ of $v$.

    The degree is the sum of these two values.
    However, this is less useful in directed graph theory.
]

#problem_box(solution: [
    Each edge has an incoming and outgoing end.
    To sum all indegrees is to count every outgoing end (the "tip" of the arrow).
    To sum all outdegrees is to count every incoming end (the "tail" of the arrow).
    Either way, we count every edge. $square$
])[
    The sum of all indegrees is equal to the sum of all outdegrees, and both are equal to the degree of a directed graph $G$.
    In other words:

    $ sum_(v in V) "deg"^- v = sum_(v in V) "deg"^+ v = |E| $

    Explain why.
]

#definition_box[
    On a directed graph, the *inneighbors* of a vertex $v$ are vertices $u$ for which there exists an edge $e = (u, v)$ pointing from $u$ _into_ $v$.

    The *outneighbors* are defined similarly.
]

#definition_box[
    A *directed* walk/trail/path/cycle is one which respects the direction of edges on the graph.
    In other words, an edge can only be traversed in the direction it specifies.
]

=== Eulerian trails on directed graphs

#problem_box(solution: [
    Similarly to how we proved equivalents of these statements for undirected graphs:
    - In the first case, $v$ must be the start and $u$ must be the end.
        $v$ is exited one more time than it is entered, and $u$ is entered one more time than it is exited.
    - In the second case, every vertex must both be entered and exited.
        Thus the starting vertex must be re-entered once without being exited yet again, i.e. it is the ending vertex.
])[
    A directed Eulerian trail exists on directed graph $G$ if and only if:
    - There is exactly one vertex $v$ where $"deg"^+ v = "deg"^- v + 1$, one other vertex $u$ where $"deg"^- u = "deg"^+ u + 1$, and all other vertices have equal indegree and outdegree.
    - There are no unbalanced vertices, in which case any such Eulerian trail must also be an Eulerian cycle.
    Explain why.
]

= On your own

#problem_box[
    A nice warm-up.
    #lc_link(997, "find-the-town-judge")
]

#problem_box[
    #lc_link(310, "minimum-height-trees")

    Hint: find a way to reduce the problem iteratively; how can you change the input graph in a way that makes it simpler without changing the solution?

    You will learn much more about graph reduction in ICS 46, if you take it.
]

We will see more tree problems when we discuss binary trees, a special case of trees.

#problem_box(solution: [
    Ask anyone in your group if they have taken ICS 6D and are familiar with topological sorting.
])[
    Solve #lc_link(207, "course-schedule") and #lc_link(210, "course-schedule-ii").
    The first simply asks you if a solution to the problem exists.
    The second asks for such a solution.
]

== Capstone

#problem_box[
    Solve #lc_link(332, "reconstruct-itinerary").

    *Capstone*: Try to generalize in #lc_link(2097, "valid-arrangement-of-pairs").
]

== Challenge

You may want to know #link("https://en.wikipedia.org/wiki/Dijkstra's_algorithm")[Dijkstra's] for these.

#problem_box[
    Try some of these:

    - #lc_link(797, "all-paths-from-source-to-target")
    - #lc_link(787, "cheapest-flights-within-k-stops")
    - #lc_link(743, "network-delay-time")
]
