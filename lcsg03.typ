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


#let title = "LeetCode Study Groups, Week 3"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em, first-line-indent: (amount: 0.5in, all: true))

#pagebreak()

= Topic 1: Graph theory

Graphs are a discrete mathematical structure which generalizes connections between different objects.

To do this, we need some definitions#footnote[
    We assume knowledge of set theory as taught in ICS 6B.
    If you need help, ask your group members.
]:

#definition_box[
    A *graph* $G = (V, E)$ is a tuple of two elements:

    The *vertex set* $V$ contains elements called *vertices*, or nodes. \
    The *edge set* $E$ contains elements called *edges*, each of which is an unordered pair of two vertices, written like ${v_1, v_2}$.
    Edges connect two vertices from the set $V$ (we say $v_1, v_2 in V$).

    When referring to a generic vertex we typically label it $v$.
    When referring to a pair of vertices we typically label them $u$ and $v$.
    When referring to a sequence of vertices, $v_1, v_2, dots$ are typically used.

    Edges are typically labelled $e$ (if there's just one) or $e_1, e_2, dots$ for multiple edges.
]

#definition_box[
    The number of vertices in a graph, $|V|$, is called the *order* of the graph.
    The number of edges $|E|$ is called the *size*.
    The number of edges connected to a vertex is called the degree of that vertex.
]

It is technically possible to have "self-edges"; edges where both endpoints are the same.
Graphs including these loops are called multigraphs, and graphs without them are called simple graphs.
We will only examine simple graphs.

Next, some basic results which will solidify your understanding:

#problem_box(solution: [
    Each edge is counted twice, once from each endpoint.
])[
    Suppose $G$ is a simple graph.
    Explain why
    $ sum_(v in V) "deg" v = 2 |E| $
    or, in English, why the sum of the degree of each vertex is twice the degree of the graph.

    There is no need for a formal proof; simply satisfy your own understanding and that of a real or hypothetical confused group member.
]

#problem_box(solution: [
    Read the handshake problem from week 1 again.
    Explain to yourself how these problems are equivalent.
])[
    The *complete graph* $K_n$ is the simple graph of order $n$ in which every pair of distinct vertices is connected by an edge.

    State the degree, in terms of $n$, of $K_n$.
]

== Walks

#definition_box[
    A *walk* is a sequence of edges where each edge ends where the next begins, forming a sequence of vertices.
    The list of vertices $(v_1, v_2, dots, v_n)$ traversed by this walk is called its *vertex sequence*. \
    If all the edges are distinct, the walk is also called a *trail*. \
    A trail where $v_1 = v_n$ is called a *cycle*. \
    If the edges of a walk are distinct, it can also be called a *path*.
]

== Trees

#definition_box[
    A *tree* is an *acyclic* graph.
    This means no cycles exist on a tree $G$.
    This also means the path between any two distinct vertices is unique (otherwise, the concatenation of two non-identical paths would create a cycle).
]

== Colorings, in brief

#definition_box[
    A $k$-coloring is a function $f: V -> C$ mapping each vertex to a color in set $C$, where $C$ is a set of $k$ distinct colors/integers/elements.
    The constraint is that no neighboring vertices may share a color.
    If a $k$-coloring is possible on $G$, we call $G$ "*$k$-colorable*".
    If $k$ is the smallest such that a $k$-coloring is possible on a graph $G$, $k$ is called the *chromatic number* of $G$.
]

The chromatic number of the United States is 4, if any two states touching at more than one point are considered adjacent#footnote[
    #link("https://mathworld.wolfram.com/ContiguousUSAGraph.html")
].
If you look at any map of the United States which colors states, you will find that no more than four colors are used.

== Next weeks

In future weeks we will look at some other kinds of graphs.
However, this week, assume the following:

- Any graph you encounter is *connected*; i.e. there always exists at least one path between any distinct vertices $u, v in V$.
- The graph is *undirected*; edges have no notion of direction and simply connect two edges in an unspecified order.
    We will examine directed graphs later.

= Topic 2: Graphs in computer science

== Representation of graphs

There are a few ways to represent this graph structure in memory.
We give a brief primer on some more common forms.

=== References

A typical definition in TypeScript on LeetCode is as follows:
```ts
class _Node {
    val: number
    neighbors: _Node[]
    // constructor here...
}
```

Notice each vertex/node is assigned a value.
This is a feature of some graphs you will see in problems, but not others.
Just remember that two nodes with the same value are not necessarily the same node.

#problem_box(solution: [
    This is a doubly linked list.
    The cycle graph is a circular doubly linked list.
])[
    The path graph $P_n$ is a graph where $n$ vertices are connected in a line, each only to the next and previous vertex.
    The cycle graph $C_n$ is similar except the first and last vertices are also connected.

    If we assign data to each vertex and store these graphs in memory using a reference representation, they are very similar to another data structure.
    Which one?
]

=== Adjacency matrix

(If you are not familiar with matrices, imagine a 2D array.)

Some problems will give you a matrix to represent the graph.
This is called an adjacency matrix.
Each vertex is labelled with an integer $1$ to $n$.
Let the matrix be $A$, which is an $n times n$ matrix.
Then if vertices with numbers $u$ and $v$ are connected, then $A_(u v)$ (the element in the $u$th row and $v$th column) is $1$.
The element $A_(v u)$ will be set as well (meaning the matrix is symmetric), but this may not be true when we return to discuss directed graphs.

When handling adjacency matrices in code, the vertices are often labelled $0$ to $n-1$ instead, since array indices count from 0 and not 1.

=== Jagged arrays

Another representation is with an array of arrays.
These inner arrays are not all the same length; these are called jagged arrays.

Like the adjacency matrix form, the vertices must be numbered $0$ to $n-1$.
The $i$th element of the outer array is an array of the neighbors of $i$.
This is similar to the matrix representation, just that we no longer store the zeroes and simply store the position of the ones.

This is a good format to work in for most problems.
However, LeetCode usually doesn't give you this format.

=== Edges

This is a favorite of LeetCode.
Graphs will often be provided to you this way.
In this format, you are simply given an array of arrays.
Each inner array represents an edge.
The inner arrays have length $2$ and simply contain the edge's endpoints.
You are typically also given the order of the graph (the number of vertices).

== Traversing a graph

After your graph is stored in a format of your choosing, it usually needs to be traversed in some way.
As a computer programmer you do not have access to a top-down view of the graph and you must find a way to procedurally move around on the graph.
This traversal is typically called a *search*.
There are two main options.
Both involve a notion of depth.

Suppose you start your search at a vertex $v$.
Then its neighbors are one level "deeper" into the graph.
The unvisited neighbors of those vertices are yet another level deeper.
The opposite of depth is breadth (more commonly called width), and this describes moving around within one of these levels of depth.

=== Depth first search

Then your first option is to keep trying to move as far away from your starting point as possible, on some arbitrary path.
Remember that a path does not cross itself, so we are always covering new ground as we do this.
When we cannot go any deeper, we try an unvisited neighbor of a vertex we've been to previously.
This is called a *depth first search* or *DFS*.
A simple implementation is as follows, given the jagged array representation of a graph:

#box[
```py
from typing import List

n: int = # the order of the graph
visited = [False] * n
adjacency: List[List[int]] = # jagged array representation

def dfs(root: int):
    visited[root] = True

    for neighbor in adjacency[root]:
        # do something here?

        # you could also check for already visited at the top of the function
        if not visited[neighbor]:
            dfs(neighbor)

        # do something here?

# pick an arbitrary starting vertex; it usually doesn't matter which one
dfs(0)
```
]

Note also that depth first search relies on a stack, the call stack, to keep track of its path.

=== Breadth first search

*Breadth first search (BFS)* uses a different approach.
Instead of trying to go as deep as we can in a greedy manner, we try to exhaust every "level" one at a time.
If we discover a new neighbor, we simply remember to traverse it later instead of doing so immediately.
In other words, we move along the breadth first and the depth second.
In DFS, we moved along the depth first and the breadth second.
BFS relies on a queue, not a stack.
Below find example code for a BFS, relying on the same jagged array approach:

#box[
```py
from typing import List

n: int = # the order of the graph
visited = [False] * n
adjacency: List[List[int]] = # jagged array representation
# pick an arbitrary starting vertex; it usually doesn't matter which one
queue = [0]

def bfs():
    # while the queue is not empty
    while queue:
        head = queue.pop(0)
        visited[head] = True
        # do something
        for neighbor in adjacency[head]:
            if not visited[neighbor]:
                # worry about this later
                queue.append(neighbor)

bfs()
```
]

= On your own

#problem_box(solution: [
    Use recursion.
])[
    #lc_link(133, "clone-graph")
]

#problem_box[
    #lc_link(1311, "get-watched-videos-by-your-friends")
]

#problem_box(solution: [
    Hint: To prove that a graph is bipartite:
    - State a way to assign its vertices into two sets and prove that that for any vertex $v$ in one set, all of its neighbors are in the other set.
    - Or, prove it is $2$-colorable; this is equivalent to bipartiteness.
])[
    A *bipartite* graph is one whose vertices can be split into two sets.
    Vertices in one set do not connect to others in their set and _may_ connect to vertices in the other set.
    The two endpoints of any edge $e$ are in different sets.

    #lc_link(785, "is-graph-bipartite")
]

#problem_box[
    Sorry in advance.
    You'll have to figure this one out.

    #lc_link(1062, "flower-planting-with-no-adjacent")
]

== Capstone

#problem_box(solution: [
    Hint: Define this problem recursively.
    How do you cut down one tree?
    Having cut down one tree, how do you find and cut down the next?

    Second hint: You need to choose between BFS and DFS.
    Which will find the next tree earliest?

    Third hint: Whichever search you choose (there is a correct answer), you need to count how many steps you take.
])[
    *Capstone*: #lc_link(675, "cut-off-trees-for-golf-event")
]
