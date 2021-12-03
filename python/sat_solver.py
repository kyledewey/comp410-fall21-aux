#!/usr/bin/env python3
#
# ---AST Definition---
#
# Exactly what a variable is is left abstract.
# In tests, variables are strings holding the name of the variable..
#
# There are three kinds of expressions:
#
# 1.) Literals, which represent the concept of a possibly
#     negated variable.  This is represented with the `Literal`
#     class.  The `variable` field holds the variable, and the
#     `is_positive` field holds `True` if it's a positive literal,
#     or `False` if its a negative literal.
#
# 2.) Logical and, which represents an AND operation between
#     two subexpressions.  This is represented with the `And`
#     class, which has `left` and `right` fields for subexpressions.
#
# 3.) Logical or, which represents an OR operation between
#     two subexpressions.  This is represented with the `Or`
#     class, which has `left` and `right` fields for subexpressions.
#
# A more compact representation of all the above information is shown
# below in a variant of a BNF grammar:
#
# x ∈ Variable
# b ∈ Boolean ::= True | False
# e ∈ Expression ::= Literal(x, b) | And(e1, e2) | Or(e1, e2)

class Literal:
    def __init__(self, variable, is_positive):
        self.variable = variable
        self.is_positive = is_positive

    def __str__(self):
        if self.is_positive:
            return self.variable
        else:
            return "!{}".format(self.variable)

class Binop:
    def __init__(self, left, right, op_string):
        self.left = left
        self.right = right
        self.op_string = op_string

    def __str__(self):
        return "({} {} {})".format(
            str(self.left),
            self.op_string,
            str(self.right))

class And(Binop):
    def __init__(self, left, right):
        super().__init__(left, right, "&&")

class Or(Binop):
    def __init__(self, left, right):
        super().__init__(left, right, "||")

# naive immutable map implementation
# just does a copy over an underlying dict
class ImmutableMap:
    def __init__(self, mapping = None):
        self.mapping = mapping if mapping is not None else dict()

    def add(self, key, value):
        new_mapping = self.mapping.copy()
        new_mapping[key] = value
        return ImmutableMap(new_mapping)

    def contains(self, key):
        return key in self.mapping

    def get(self, key):
        return self.mapping[key]

class List:
    def __init__(self):
        pass

class Nil(List):
    def __init__(self):
        super().__init__()

    def __str__(self):
        return "nil"

class Cons(List):
    def __init__(self, head, tail):
        super().__init__()
        self.head = head
        self.tail = tail
        
    def __str__(self):
        return "cons({}, {})".format(self.head, self.tail)


def add_literal(immutable_map, variable, boolean):
    if immutable_map.contains(variable):
        if immutable_map.get(variable) == boolean:
            return immutable_map
        else:
            return None
    else:
        return immutable_map.add(variable, boolean)

def solve_list_output(goals, literals):
    if isinstance(goals, Nil):
        #return Cons(literals, Nil())
        return unit(literals)
    else:
        head = goals.head
        tail = goals.tail
        if isinstance(head, Literal):
            new_map = add_literal(literals,
                                  head.variable,
                                  head.is_positive)
            if new_map is None:
                #return Nil()
                return mzero()
            else:
                return solve_list_output(tail, new_map)
        elif isinstance(head, And):
            return solve_list_output(Cons(head.left, Cons(head.right, tail)), literals)
        elif isinstance(head, Or):
            left_result = solve_list_output(Cons(head.left, tail), literals)
            right_result = solve_list_output(Cons(head.right, tail), literals)
            #return left_result.append(right_result)
            return mplus(left_result, right_result)

def solve(goals, literals):
    if isinstance(goals, Nil):
        yield literals
    else:
        head = goals.head
        tail = goals.tail
        if isinstance(head, Literal):
            new_map = add_literal(literals,
                                  head.variable,
                                  head.is_positive)
            if new_map is not None:
                for solution in solve(tail, new_map):
                    yield solution
        elif isinstance(head, And):
            for solution in solve(Cons(head.left, Cons(head.right, tail)), literals):
                yield solution
        elif isinstance(head, Or):
            for solution in solve(Cons(head.left, tail), literals):
                yield solution
            for solution in solve(Cons(head.right, tail), literals):
                yield solution

def solve_one(formula):
    return solve(Cons(formula, Nil()), ImmutableMap())

# tests that should be satisfiable
sat_tests = [And(Or(Literal("a", True),
                    Literal("b", False)),
                 Literal("b", True)), # (a || !b) && b
             And(Or(Literal("x", True),
                    Literal("y", False)),
                 Or(Literal("y", False),
                    Literal("z", True)))] # (x || !y) && (!y || z)

# tests that should be unsatisfiable
unsat_tests = [And(Literal("x", True),
                   Literal("x", False))] # x && !x

def run_tests():
    tests_failed = False
    for test in sat_tests:
        if solve_one(test) is None:
            print("Failed: {}".format(test))
            print("\tWas UNSAT, should have been SAT")
            tests_failed = True

    for test in unsat_tests:
        if solve_one(test) is not None:
            print("Failed: {}".format(test))
            print("\tWas SAT, should have been UNSAT")
            tests_failed = True

    if not tests_failed:
        print("All tests passed")

if __name__ == "__main__":
    run_tests()
