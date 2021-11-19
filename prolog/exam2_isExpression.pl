% e is an Expression
% e ::= number(0) | add(e1, e2) | multiply(e1, e2) | negate(e)

% isExpression: Bound, Expression
isExpression(_, number(0)).
isExpression(Bound, add(E1, E2)) :-
    Bound > 0,
    NewBound is Bound - 1,
    isExpression(NewBound, E1),
    isExpression(NewBound, E2).
isExpression(Bound, multiply(E1, E2)) :-
    Bound > 0,
    NewBound is Bound - 1,
    isExpression(NewBound, E1),
    isExpression(NewBound, E2).
isExpression(Bound, negate(E)) :-
    Bound > 0,
    NewBound is Bound - 1,
    isExpression(NewBound, E).

% 0
% 0 + 0
% 0 + (0 + 0)
% 0 + (0 + (0 + 0)) ...
