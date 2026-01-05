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


#let title = "LeetCode Study Groups, Week 1"
#let authors = ("ICSSC AAA", ).join(", ")

#make_doc(title, authors)
#align(center, text(24pt)[#title])
#align(center, text(20pt)[#authors])

#outline()

#set text(top-edge: 0.7em, bottom-edge: -0.3em)
#set par(leading: 1em)

#pagebreak()

= Orientation

== Who are we?

The #link("https://icssc.club/")[ICS Student Council] is the official registered campus organization of the students of the School of ICS.
Among our goals is to:

#quote[
  Providing one another with tools and opportunities to become the most competitive technical experts in the world.
] - ICSSC Constitution

LeetCode study groups are run by the *Academic and Alumni Affairs* committee.
You can see our membership on the #link("https://icssc.club/about")[About] page.

== Who are you?

Before receiving this document you should have been placed in a study group.
Throughout winter quarter, you will work on selected programming exercises to improve your ability to solve challenges presented in technical interviews.
Your group was chosen with the following criteria in mind:

- Those who you asked to be grouped with.
- Those who asked to be grouped with you.
- Your self-reported experience level.
- Days of the week which you prefer and do not prefer.

#pagebreak()

== Why do this?

#figure(
  image("failed-homeress.png", width: 40%),
  caption: [Don't let this be you!#footnote[https://twitter.com/ThePrimeagen/status/1870146774670745819]],
)

There are basically three ways a technical interview problem can go:

+ You have solved an identical or very similar problem before.
  You use this to easily solve the new problem.
+ You have the tools necessary to solve a problem and, after some thinking, you apply them.
  You solve the problem, albeit more slowly.
+ You are completely bewildered at a problem.
  You stare in shock for minutes.
  You barely make any progress and get an auto-reject email 3 minutes later.

It may seem like the first option is our goal, but it's infeasible to teach every algorithm in circulation today.
Our goal is instead to teach you enough general patterns to make case 2 the norm; this is what interviewers are looking for anyway.
They want to see that you know common techniques, not that you have memorized the entire LeetCode catalog.

== Written material

Every Monday#footnote[
  We may adjust this schedule regarding holidays in weeks 3 and 7.
  Stay tuned.
], a new topic will be published in a document like this one.
Written material will introduce a theme and concepts relevant to solving that week's problems.
There may also be non-coding exercises which improve your understanding of the subject.
Somtimes we will give guided solutions to some easier LeetCode problems which demonstrate important concepts.
Any such question or excercise will look like this:
#problem_box(
  [Why do frontend developers eat alone?],
  solution: [Because they can't join tables.]
)

You are free to complete or not complete any of these exercises, with your group or alone.
We will not ask for them.
Some material may overlap with ICS coursework, particularly ICS 6B/6D, 31-33, 46, and 161.
You know you and your group's own skills and shortcomings better than we do.
At minimum, read the *bolded* text to ensure you understand the core takeaways.

== Problem set

After the lecture and relevant exercises, we will present the problem set for the week.
This will consist of curated LeetCode problems, so you can exercise your new and existing knowledge.
They are arranged in a recommended order in roughly increasing difficulty.
Some problems are also placed after others because an insight from one can help with subsequent problems.
We may also offer a capstone problem which uses multiple concepts.
If you solve this problem, you understand the week's topic(s) well.

We understand if, due to time constraints, you and/or your group choose to skip some problems.
If you decide to do this, we recommend you prioritize later problems and never forgo a capstone problem.

=== How to solve problems, mentally

There are roughly three steps in solving a problem, now or come interview time:
+ Stare.
+ Code.
+ Struggle with test cases.
+ Succeed or fail.

You may think the programming steps are most valauble.
However, it is actually the first which is most helpful to train and most valuable to employers.
They want to see your willpower and your ability to identify the correct thought pattern and tools.
We offer hints on many problems, based on difficulties we encountered solving them.
These help with the first step which in turn informs the general outline of your code.
*Do not look at these hints unless you are truly unable to proceed.*
We won't enforce this (we can't), but overuse of hints severely affects your ability to overcome the first step.
You may also want to skip a problem if you're having trouble, attempt another, and come back.

=== How to solve problems, from a technical standpoint

Unless you're in a specialized environment or forced to use a specific language, work in a language which, ideally:
- Is in widespread conventional use. Don't choose your favorite esoteric language.
- You know this language well, and lack of proficiency is not likely to get in the way.

Recruiters may not be concerned with your exact syntax, but struggling with the details wastes precious time and may also seriously impact your confidence.
It is like picking a spoken language; picking a programming language you are fluent in is the most effective way to communicate your ideas to interviewers and your group members.

Languages like JavaScript/TypeScript, Python, and C++ are common choices.
You are not typically expected to reimplement basic structures such as the hash set or list, unless you are applying for a job which specifically focuses on such low-level implmentation.
We will not cover how to implement these structures.
Instead, familiarize yourself with the standard library of your language of choice, so you can utilize these when necessary.

== Group meetings

Your group should meet each week, in any format you choose, to discuss any difficulties you encounter or insights you gain while solving these problems.
The length of this meeting can vary but should be such that, at the end of the meeting, your group can reliably come to a consensus that they understand the topic and problems.
You can agree to attempt problems before, during, or between meetings if you agree to hold multiple per week.
* Ultimately, how you approach these study groups is up to you and your group.*
A good starting point is to:
+ Attempt every problem before the capstone before you meet.
+ Meet for an hour to discuss concepts and problems and attempt other problems, such as the challenge problem(s), if you choose to do so.
+ Try to solve the capstone by discussing potential approaches, your solutions, or both. \ 
Other ideas:
- Split up the lecture and explain it to each other, if you don't have time to read it all.
- Ask each other to explain the lecture topics, even if you've read them too.
- You could race to solve the problems, over the week or in one or more sittings.
- Try the problems or even the challenge or capstone first, if you think you can skip the lecture.#footnote[
  Of course, more engagement with material will improve your understanding.
  But if you've already put that time in and your knowledge is solid, do not feel compelled to read lectures closely.
]

If any members are struggling, offer them a chance to verbally explain their reasoning.
It may even help them reach the solution on the spot.
If many or all of you are struggling on a problem, particularly the capstone problem, work on it together.
Collaborating, including explaining your own solution, is good for your learning and looks good with employers.

Finally, we hope you have fun!
Make sure you don't burn out and enjoy the time you have with your group.

#problem_box[
  The LeetCode Study Groups poster contains two data structures.
  See if your group can name them.
  We will be going over both of these.
]

== What if I have questions?

If you have logistical or other questions not related to the material, ask in the relevant channel in the Discord server.
If you have a question about the material, ask your group members first.
If, as a group, you truly are stuck, ask in the Discord.

= Topic 1: Big O ($O$) notation#footnote[ICS 33 will discuss this next week.]

While multiple functions may tend to infinity, some do so faster than others.

This is also true of certain resource requirements of a computer algorithm.
We focus particularly on *time complexity* and *space complexity*;
how quickly do the time and space required to solve a problem grow given the size of the input?

== The handshake problem

=== Time complexity

#problem_box(
  [
  Imagine $n$ people in a room.
  We want them each to shake hands with every other person, and do so exactly once.
  No person is to shake hands with themselves.
  How many handshakes will occur among these $n$ people?
],
  solution: [
  It turns out the answer is
  $ n(n-1)/2. $

  Each person must shake hands with $n-1$ other people.
  However, this will count each handshake twice (once from each end), so we simply half it.
]
)

We are not actually concerned with the exact details of this result; only that it is similar to $n^2$.

We say *the time complexity of the handshake problem is $O(n^2)$*.
We call this quadratic time complexity and it is also a kind of *polynomial time complexity*
#footnote[
  We have done some hand-waving in this simplification.
  If you insist on rigor, look #link("https://en.wikipedia.org/wiki/Big_O_notation#Formal_definition")[elsewhere].
].

Generally, in LeetCode problems, any polynomial time complexity is to be avoided.
Few problems absolutely require $O(n^2)$ time to compute.
LeetCode, or any other automated system an employer might use, imposes strict time limits on larger inputs so that correct but inefficient solutions are not accepted.
*There is often a faster way than $O(n^2)$, i.e. with a lower time complexity, to compute a problem*; we will discuss examples shortly.

=== Space complexity

#problem_box([
  Now imagine you are programming an algorithm for the handshake problem.
  Given there are $n$ people, you want to print every handshake `"a b"`, where people are numbered from $0$ to $n-1$ inclusive.
  How much memory will you need for this algorithm?

  (The number of variables is sufficient; don't worry about an exact number.)
], solution: [
  You only need two variables:

  ```py
  def handshake(n):
    for i in range(n):
      for j in range(n):
        print(i + " " + j)
  ```
])

Notice now the amount of space needed was not dependent on $n$ and was instead constant.
We say this algorithm has *O(1) space complexity*.
This is also called *constant complexity*.
This is the best time or space complexity possible.

== Complexity classes

You may encounter several other time complexities in your studies.
Some are given here in best to worst order:

#table(
  columns: 3,
  table.header(
    [*Complexity class*], [*Time example*], [*Space example*]
  ),
  [$O(1)$ "constant space/time"], [arithmetic, accessing a variable], [counters and accumulators],
  [$O(log n)$ "logarithmic space/time"], [binary search], [some sorting algorithms],
  [$O(n)$ "linear space/time"], [check if a list is sorted], [storing an array of length $n$],
  $O(n log n)$, [sorting an array], [],
  [$O(n^2)$ "quadratic space/time"], [handshakes], [an $n times n$ matrix],
  [$O(2^n)$ "exponential time"], [computing a power set], [storing a power set],
  [$O(n!)$ "factorial time"], [checking each possible arrangement of $n$ objects in a line], []
)

== Two Sum in quadratic time

#problem_box(
  [
  See #lc_link(1, "two-sum").
  Write a solution which runs in quadratic time ($O(n^2)$ time complexity).
],
  solution: [
  This is quite simple:
  #code_file_block("lcsg01_twosum_quad.py")
  As you might expect we can do much better than quadratic time.
]
)

= How (not) to sort an array

Sorting an array trivializes many problems.
If your result ever depends on comparing many elements of an array or finding the next largest or smallest value, sorting may be effective.
Sorting is also necessary for algorithms such as binary search, which will be explained later.

The sorting algorithms in common use all have time complexity $O(n log n)$.
As an exercise it may be helpful to implement one yourself, but your language very likely comes with one.
Do some research and ensure you know how to access it.

#problem_box(
  [
  Insertion sort is typically defined as follows:
  + Create a new output array.
  + For each element in the input array $n_i$:
  + Move through the output array, left to right, until you find the first element greater than $n_i$.
  Insert $n_i$ before this element.
  (If the output array is empty, just add $n_i$.)
  + Every element has been moved into the output array.
  The output array is now sorted.

  Explain why this has $O(n^2)$ time complexity.
  It may help to write this algorithm in code.
],
  solution: [
  The inner step of the loop requires up to $i-1$ comparisons, so there can be as many as $ 0+1+2+ dots + n-1 = n(n-1)/2 $ steps.
  We discussed something similar to this earlier, so you should be able to translate that formula into a time complexity class.
]
)

= On your own

#problem_box[
  Get to know your group members!
  Learn their names and some CS-related non-CS-related facts about them.
  Find something to bond over.
  Learn about their experience so far with LeetCode or similar problems.
  Try to make some friends.
]

#problem_box(solution: [
  Hint: use a dictionary or map.

  As with any other problem, ask your group for help at your meeting if you are stuck.
])[
  Find a solution for #lc_link(1, "two-sum") in linear time.
]

#problem_box(solution: [
  Hint: look at the topic tags underneath the problem description.
])[
  #lc_link(219, "contains-duplicate-ii"), in linear time
]

#problem_box[
  #lc_link(274, "h-index")
]

== Capstone

#problem_box(solution: [
  Hint: by default, sorting uses `a < b` to check whether `a` should come before `b` (sorting is in ascending order by convention).
  In most languages, you can override this and use your own comparison function.
])[
  #lc_link(179, "largest-number")
]

== Challenge problems

#problem_box(solution: [
  Hint: it is easier to find the smallest non-negative integer not present.
  Why?
])[
  *Challenge*: #lc_link(41, "first-missing-positive")

  Ensure you respect the complexity requirements.
  Note particularly that you may not sort the array, as this takes $O(n log n)$ time.
]

#problem_box[
  If you're not new to LeetCode, sorry half the lecture was review for you.
  To make up for it, try these to test your patience and how well you know dynamic programming.
  Try for linear time and constant space solutions.

  - #lc_link(121, "best-time-to-buy-and-sell-stock")
  Not too bad.
  - #lc_link(122, "best-time-to-buy-and-sell-stock-ii")
  - #lc_link(123, "best-time-to-buy-and-sell-stock-iii")
  Fun fact: you can do this in linear time and constant space with 4 expressions in JS/TS or Rust.

  Don't worry if you don't know how to do these yet.
  We will assign them again when the relevant topics have been introduced.
]
