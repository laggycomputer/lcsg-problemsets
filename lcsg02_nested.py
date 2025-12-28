class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        self.queue = []

        # use the input as a queue
        while nestedList:
            curr = nestedList.pop()
            if curr.isInteger():
                self.queue.append(curr.getInteger())
            else:
                for inner in curr.getList():
                    nestedList.append(inner)

    def next(self) -> int:
        return self.queue.pop()

    def hasNext(self) -> bool:
        return len(self.queue) > 0
