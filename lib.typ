#let make_doc(title, authors) = {
    set document(
        title: [#title],
        author: authors,
    )
}

#let rounded_box(content, stroke: (), fill: ()) = {
    set align(center)
    set box(
        inset: 10pt,
        radius: 10pt,
        width: 100%,
    )
    box(
        stroke: stroke,
        fill: fill,
        [
            #set align(left)
            #content
        ]
    )
}

#let definition_box(content) = {
    rounded_box(content, stroke: green, fill: rgb("b7e1b9"))
}

#let problem_box(problem, solution: false) = {
    set align(center)
    set box(
        inset: 10pt,
        radius: 10pt,
        width: 100%,
    )
    set par(leading: 1em, first-line-indent: (amount: 0in, all: true))

    [
        #block(breakable: false)[#grid(
            columns: (100%,),
            gutter: 5pt,
            rounded_box(
                fill: rgb("f9caca"),
                stroke: red,
            )[#problem],
            if solution != false [
                #rounded_box(
                    fill: rgb("dcedf8"),
                    stroke: blue,
                )[#solution]
            ]
        )]
    ]
}

#let lc_link(n, name) = {
    link("https://leetcode.com/problems/" + name + "/description/")[LeetCode \##str(n)]
}

#let code_file_block(filename) = raw(read(filename), block: true, lang: filename.split(".").at(-1))
