MATCHING = {
    ")": "(",
    "}": "{",
    "]": "[",
}

LEFT = list(MATCHING.values())
RIGHT = list(MATCHING.keys())


def valid(s: str) -> bool:
    stack = []
    for char in s:
        if char in LEFT:
            stack.append(char)
        elif char in RIGHT:
            try:
                popped = stack.pop()
                if popped != MATCHING[char]:
                    return False
            except IndexError:
                # couldn't pop at all
                return False
        else:
            # we are promised this never happens
            pass

    try:
        stack.pop()
        return False
    except IndexError:
        # stack is empty, like we hoped
        return True
