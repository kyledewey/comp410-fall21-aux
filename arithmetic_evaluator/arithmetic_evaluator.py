# e is an expression
# n is a number
#
# 
# (1 + 2) - 3
#
# e ::= n | e1 + e2 | e1 - e2
#
# e ::= Number(n) | Plus(e1, e2) | Minus(e1, e2)
#
# some familiarity with Python - hit yes
#
# public class Number {
#   public int value;
#   public Number(int value) {
#     this.value = value;
#   }
# }

#
# REPL - read - eval - print - loop
#
class Number:
    def __init__(self, value):
        self.value = value

class Plus:
    def __init__(self, left, right):
        self.left = left
        self.right = right

class Minus:
    def __init__(self, left, right):
        self.left = left
        self.right = right

def eval_expr(expr):
    if isinstance(expr, Number):
        return expr.value
    elif isinstance(expr, Plus):
        left_value = eval_expr(expr.left)
        right_value = eval_expr(expr.right)
        return left_value + right_value
    elif isinstance(expr, Minus):
        return eval_expr(expr.left) - eval_expr(expr.right)
    # else:
    #     # uh oh - not a valid AST
        
