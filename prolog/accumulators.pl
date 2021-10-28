reversed([], Accumlator, Accumlator).
reversed([Head | Tail], Accumlator, Result) :-
    reversed(Tail, [Head | Accumlator], Result).

reversed(List, Result) :-
    reversed(List, [], Result).
