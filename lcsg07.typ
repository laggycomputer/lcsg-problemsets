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


#let title = "LeetCode Study Groups, Week 7"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

This week, we return to graph theory and introduce a data structure with it.

= Topic 1: Disconnected graphs

Remember the assumptions we made about graphs in week 3:
- Graphs are *connected*.
- #strike[Graphs are *undirected*.] In week 4, we introduced directed graphs.

Let us break the remaining assumption.

#definition_box[
    A *disconnected* graph $G$ is one which is _not_ connected; i.e. there is at least one pair of vertices $(u, v)$ between which no path exists.

    Then imagine we take unique subgraphs of $G$ which are connected.
    If these subgraphs are maximal (i.e. each is as large as it can be while remaining conneceted), we call these the *components* of the graph.
    The number of components in a graph is called the *circle number*;
    if we draw the graph on paper, how many circles do we need to draw such that every vertex and edge is inside a circle and the subgraph inside any circle is connected?

    We say a connected graph has circle number $1$.

    Also be careful not to use the word region in place of component; this means something else in graph theory!
]

#problem_box(solution: [
    "*forest*" haha mathematicians are so funny

    Forests can alternatively be characterized as graphs where at most one path exists between any two distinct vertices.
    On a tree there is always exactly one such path.
])[
    What is the name for an undirected graph whose component(s) are trees?
]

== Discovering components

#problem_box(solution: [
    Just do a BFS or DFS; more generally, a "flood propagation" or "flood fill" is appropriate.
    This will eventually reach every possible vertex on the component.
])[
    Given some representation of a graph, how might you identify which vertices are in the same component as a given vertex?
]

#problem_box(solution: [
    Track which vertices you have visited.
    Then iterate over every vertex and execute a flood fill beginning at that verties _only_ if it is unvisited.
    Of course you also need to mark vertices as visited during the flood fill.

    Every time you iterate to an unvisited vertex, this means it was not covered by any previous component and you have found a new component.
])[
    Knowing how to find the component in which a vertex resides, how might you find every component?
]

= Topic 2: The disjoint set structure

This data structure is more niche but is still occasionally useful in graph theory.
More generally it models any partition of a set.

The idea is to determine a "representative", or root, of each bucket then assign every other element an immediate "parent".
This chain of parents eventually leads back to a representative.
In this way, the unordered subset of elements becomes a tree with a root.

It is also possible to merge these buckets/partitions; simply assign the root of one to be a child of the other root.
One possible optimization is to keep track of the depth or size of one of these trees, then ensure the shallower or smaller tree is the new root.
This makes the process of finding the root of a partition faster on average.

As applied to (undirected) graphs, this can be used to easily detect cycles on a graph as follows.
For every edge $e = (u, v)$ on the graph:
- If one endpoint (say, $v$) is already in the set, assign $"parent"(u) = v$.
- If both endpoints are in the set:
    - If they share a root, a cycle has been discovered since $u$ and $v$ have two non-intersecting paths back to their shared root.
        The union of these paths and $e$ is a cycle.
    - If they don't share a root, merge these two sets (i.e. make one root the parent of the other root as described earlier).

= On your own

#problem_box[
    Solve #lc_link(200, "number-of-islands").

    There is a way to mark vertices on this graph as visited at no additional memory cost.
]

#problem_box[
    Now, try it on a general undirected graph.
    #lc_link(547, "number-of-provinces")
]

#problem_box[
    Disconnected graphs can be bipartite too.

    #lc_link(886, "possible-bipartition")
]

#problem_box(solution: [
    Hint: What will a disjoint set tell you about the redundant connection's endpoints?
])[
    #lc_link(684, "redundant-connection")
]

#problem_box[
    This is marked hard but is really probably a medium.
    Remember, the graph may be disconnected.
    #lc_link(924, "minimize-malware-spread")

    *Important clarifications*:
    - "Return the node that, if removed" should be read "Return the node that, if removed from `initial`".
    - "return such a node with the smallest index" means that if "curing" nodes labelled 1 and 5 is equally effective, 1 should be chosen, _regardless of where they appear in `initial`_.
]

== Capstone

#problem_box[
    *Capstone*: #lc_link(990, "satisfiability-of-equality-equations")

    You can think of this structure as a disconnected graph, with `!=` indicating an edge _does not_ exist.
    However you choose to conceptualize it, the solution is the same.
]

== crackhead problem

#definition_box[
    A *cut-edge*, or *bridge*, is an edge $e$ such that $G prime = (V, E - {e})$ (the graph $G$ without edge $e$) has one more component than $G$.

    The same is true of a *cut-vertex*, or *articulation point*; $G prime = (V - {v}, E)$ has one more component than $G$.
    Note that removing this vertex $v$ also removes any edges connected to it.
]

#problem_box[
    *Challenge*: #lc_link(1192, "critical-connections-in-a-network")
]
