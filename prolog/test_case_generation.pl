% boolean expressions
% E is an expression
% E ::= true | false | not(E) | and(E1, E2) | or(E1, E2)
%
% true || false ==> or(true, false)
% true && (false || true) ==> and(true, or(false, true))

% isBooleanExpression/1
% takes the data to check, succeeds if it is a boolean
% expression, according to the above grammar
isBooleanExpression(true).
isBooleanExpression(false).
isBooleanExpression(not(E)) :-
    isBooleanExpression(E).
isBooleanExpression(and(E1, E2)) :-
    isBooleanExpression(E1),
    isBooleanExpression(E2).
isBooleanExpression(or(E1, E2)) :-
    isBooleanExpression(E1),
    isBooleanExpression(E2).

decBound(OldDepth, NewDepth) :-
    OldDepth > 0,
    NewDepth is OldDepth - 1.

% boundedIsBooleanExpression: MaxDepth, Expression
boundedIsBooleanExpression(_, true).
boundedIsBooleanExpression(_, false).
boundedIsBooleanExpression(MaxDepth, not(E)) :-
    decBound(MaxDepth, NewDepth),
    boundedIsBooleanExpression(NewDepth, E).
boundedIsBooleanExpression(MaxDepth, and(E1, E2)) :-
    decBound(MaxDepth, NewDepth),
    boundedIsBooleanExpression(NewDepth, E1),
    boundedIsBooleanExpression(NewDepth, E2).
boundedIsBooleanExpression(MaxDepth, or(E1, E2)) :-
    decBound(MaxDepth, NewDepth),
    boundedIsBooleanExpression(NewDepth, E1),
    boundedIsBooleanExpression(NewDepth, E2).

% if(condition, ifTrue, ifFalse)
exp(_,true).
exp(_,false).
exp(Bound, if(E1,E2,E3)) :-
    decBound(Bound, NewBound),
    exp(NewBound,E1),
    exp(NewBound,E2),
    exp(NewBound,E3).
