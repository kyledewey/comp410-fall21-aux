% Procedure: facts/rules with the same name and arity
% arity: the number of parameters the fact/rule takes
% reversed/3
reversed([], Accumlator, Accumlator).
reversed([Head | Tail], Accumlator, Result) :-
    reversed(Tail, [Head | Accumlator], Result).

% reversed/2
reversed(List, Result) :-
    reversed(List, [], Result).
