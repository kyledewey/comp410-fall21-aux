foo(1).
foo(2).
foo(3).

bar(4).
bar(5).
bar(6).

fooOrBar(X) :- foo(X); bar(X).

fooAndBar(pair(X, Y)) :-
    foo(X),
    bar(Y).
