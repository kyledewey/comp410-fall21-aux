def foo():
    print("hello")
    yield 1
    print("goodbye")
    yield 2
    print("last")

def run_foo():
    for element in foo():
        print(element)

