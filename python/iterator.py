def foo():
    yield 1
    yield 2
    yield 3

def bar():
    yield 4
    yield 5
    yield 6

def fooOrBar():
    for x in foo():
        yield x
    for x in bar():
        yield x

def fooAndBar():
    for x in foo():
        for y in bar():
            yield (x, y)

