% Fibonacci number
% f(0) = 0
% f(1) = 1
% f(n) = f(n - 1) + f(n - 2), where n > 1

% procedure f/2
% procedureName/procedureArity
% arity: the number of parameters a procedure takes
%
% f: Input, Output
f(0, 0). % fact
f(1, 1). % fact
f(Input, Output) :- % rule
    Input > 1,
    MinOne is Input - 1,
    f(MinOne, FirstCallOutput),
    MinTwo is Input - 2,
    f(MinTwo, SecondCallOutput),
    Output is FirstCallOutput + SecondCallOutput.

% b
% b || false

% myBetween: Low, High, Value
% ?- myBetween(3, 5, X).
%    X = 3;
myBetween(Low, High, Low) :-
    Low =< High.
myBetween(Low, High, Value) :-
    Low =< High,
    NewLow is Low + 1,
    myBetween(NewLow, High, Value).
