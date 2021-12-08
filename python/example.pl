foo(1).
foo(2).
foo(3).

bar(alpha).
bar(beta).

fooAndBarPair(pair(A, B)) :-
    foo(A),
    bar(B).
