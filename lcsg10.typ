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


#let title = "LeetCode Study Groups, Week 10"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#pagebreak()

It's almost over!
We will not introduce a new programming-related topic this week.
You have enough to study for and remember.
Since it's the last week of the quarter, we'll close with tips about interviewing and recruiting.

= Topic 1: LeetCode in interviews and how you should respond

The following is loosely based on a talk by a Google engineer at a convention sometime in 2025.

First and foremost, remember that our goal for your participation in these study groups is that you can not only solve technical interview problems, but do so in a way that gives a strong showing to hiring managers.
This means a few things:

== Requirements

Before you begin coding, ensure you have everything you need to solve the problem.
This includes resolving any ambiguities, for example:
- What programming languages are acceptable?
    As we've said before: for generalist jobs, offer to use your best language.
    However, it would be inappropriate to use a different language if that job is for a specialized role (e.g. GPU programming).
- Any clarifying questions about the problem statement.
    If anything about the problem statement is unclear, it will stop your coding process dead in its tracks.
    Think about this like crashing into a brick wall.
    It reflects poorly on you if you did not point it out earlier.
    Therefore, you need to come to an agreement with your interviewer(s) about the exact requirements of what you're implementing, including the resolution of any such ambiguities.
    It reflects well on you if you can see this brick wall coming and decide which side of that wall you will drive around.

== Design

Before you begin programming, you should think in the abstract about your approach to the problem.
Don't start coding right away.
This includes the design motifs we have taught you (dynamic programming, breadth-first search, prefix sums, etc.) and any high level steps you think are necessary to solve the problem.
You might want to write those steps as comments to maintain structure and cleanliness in your code.
This is like the outline of an essay.

== Correctness

You also need to give a correct solution.
You must not call your solution done and ask your interviewer(s) to look at it unless you have taken every reasonable step to ensure its correctness.
This includes your ability to spot off-by-one bugs and other logic errors.
Your interviewer(s) have almost certainly seen many people solve the same problem and has therefore seen any error you make.
That doesn't mean you can't ever make that mistake (who types with 100% accuracy?), but it does mean, again, that you must not confidently say you're finished when your mistake is clear as day to your interviewer(s).

The way to ensure your solution is correct (to the best of your ability) is to learn how to dry-run your code; walk through an example provided to you and show that it works.
You should also come up with a test case of your own to use.

Also note that these interviews are often done without test cases or a "run" button.
This is intentional!
They are testing whether you can convince yourself and your interviewer(s) of the correctness of your code without "last resort" methods like print statement debugging or test cases.

== Keep talking

As you do all of this, keep talking.
Hopefully you've been practicing this in your groups; if not, try this week.
Don't fall silent while you design and code, and ensure any assumptions or decisions you make are communicated verbally and in your code.
Not everything you say and do is particularly meaningful; by now, you should find motifs like BFS and DFS quite rote and boring to implement.
But among the many things you say will be a few gems which your interviewer(s) are looking for and hoping you'll say.
For example, if you are designing your algorithm and realize a better resource complexity is possible (e.g. you were sketching $O(n^2)$ but $O(n)$ is possible), you should explain your reasoning and act accordingly.

== Do it quickly

Meta interviews are typically quite rote, with two techincal questions of 20 minutes each.
Many companies follow a similar timeframe, expecting you to solve a problem in 20-30 minutes.
This is your benchmark; ensure that you can solve problems in that amount of time or better.

== Practice

We've given you plenty of problems and understand if you haven't done them all.
Regardless of which ones you've done already, do them again to practice.
You can even repeat problems every 1-2 weeks; you will gradually improve at implementing a solution.
Particularly focus on the capstone problems, which we believe encapsulate their respective topic area well.
As you study any problem, follow the steps above and determine what general themes that category falls into.

With that, we would like to thank you for participating in LeetCode Study Groups this quarter.
From all of us in AAA, we hope you interviewing prowess has been enhanced by this program and that you can empower and enable yourself and your peers going forward.
Good luck on finals!

= On your own

Try doing these problems according to the principles above, as if it was a real interview.
Pretend the "run" and "submit" buttons are your submission to an interviewer; it is irreversible and can only be done once.
If you have an idea for a speedup after seeing your completed code, stop and implement it before submitting.
Again, consider the run and submit buttons one-time use.
There are no hints and no topic tags.

#problem_box[
    #lc_link(91, "decode-ways")
]

#problem_box[
    #lc_link(33, "search-in-rotated-sorted-array")
]

#problem_box[
    #lc_link(125, "valid-palindrome")
]

#problem_box[
    #lc_link(841, "keys-and-rooms")
]

#problem_box[
    #lc_link(322, "coin-change")
]

#problem_box[
    #lc_link(98, "validate-binary-search-tree")
]
