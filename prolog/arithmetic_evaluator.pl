% e is an Expression
% e ::= number(INT) | plus(e1, e2) | minus(e1, e2)

% eval_expr: Expression, Output
eval_expr(number(X), X).
eval_expr(plus(Left, Right), Result) :-
    eval_expr(Left, LeftValue),
    eval_expr(Right, RightValue),
    Result is LeftValue + RightValue.
eval_expr(minus(Left, Right), Result) :-
    eval_expr(Left, LeftValue),
    eval_expr(Right, RightValue),
    Result is LeftValue - RightValue.
