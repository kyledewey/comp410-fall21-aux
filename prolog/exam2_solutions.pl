% Approach #1: Python-like
% allEqualHelper: Head, List
allEqualHelper(_, []).
allEqualHelper(Head, [Head|Rest]) :-
    allEqualHelper(Head, Rest).

allEqual([]).
allEqual([_]).
allEqual([Head|Rest]) :-
    Rest = [_|_],
    allEqualHelper(Head, Rest).


%% allEqual([Head, Other|Rest]) :-
%%     allEqualHelper(Head, [Other|Rest]).

% Approach #2
allEqualAlt([]).
allEqualAlt([_]).
allEqualAlt([A, A|Rest]) :-
    allEqualAlt([A|Rest]).

% ?- allPairs([], Pairs).
% Pairs = [].
% ?- allPairs([1, 2, 3, 4], Pairs).
% Pairs = [pair(1, 2), pair(3, 4)].
% ?- allPairs([foo, bar], Pairs).
% Pairs = [pair(foo, bar)].
% ?- allPairs([alpha], Pairs).
% false.
% ?- allPairs([alpha, beta, gamma], Pairs).
% false.
allPairs([], []).
allPairs([A, B|Rest], [pair(A, B)|OutputRest]) :-
    allPairs(Rest, OutputRest).

%% allPairs([Head1|InputTail1], Output) :-
%%     InputTail1 = [Head2|InputTail2],
%%     Output = [pair(Head1, Head2)|Remainder],
%% allPairs([A|[B|Rest]], [pair(A, B)|OutputRest]) :-


% ?- takeUpTo(1, [a, b, c], Result).
% Result = [];
% Result = [a].
% ?- takeUpTo(2, [a, b, c], Result).
% Result = [];
% Result = [a];
% Result = [a, b].
% ?- takeUpTo(0, [a, b, c], Result).
% Result = [].
% ?- takeUpTo(-1, [a, b, c], Result).
% false.
takeUpTo(N, _, []) :- % empty list
    N >= 0.
%% takeUpTo(0, _, []).
takeUpTo(N, [Head|Tail], [Head|Rest]) :- % take one element
    N > 0,
    NewN is N - 1,
    takeUpTo(NewN, Tail, Rest).

% ?- treeSum(leaf(5), Result).
% Result = 5.
% ?- treeSum(node(leaf(2), leaf(4)), Result).
% Result = 6.
% ?- treeSum(node(leaf(2), node(leaf(3), leaf(4))), Result).
% Result = 9.
% ?- treeSum(node(node(leaf(5), leaf(6)), leaf(7)), Result).
% Result = 18.
treeSum(leaf(Value), Value).
treeSum(node(Left, Right), Result) :-
    treeSum(Left, LeftSum),
    treeSum(Right, RightSum),
    Result is LeftSum + RightSum.
