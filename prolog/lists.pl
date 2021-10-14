% cons(1, cons(2, cons(3, nil)))
% Base case: putting nil on the front of another list
% Recursive case:
%
% [1, 2, 3] ++ [4, 5, 6] ==> 1 :: ([2, 3] ++ [4, 5, 6])
%
%
% myAppend([1, 2, 3], [4, 5, 6]) ==>
%   1 :: myAppend([2, 3], [4, 5, 6]): [2, 3, 4, 5, 6]
%   Cons(1, myAppend([2, 3], [4, 5, 6]))
%
% def myAppend(list1, list2):
%     if isinstance(list1, Nil):
%         return list2
%     else: # must be a cons
%         rest = myAppend(list1.tail, list2)
%         return Cons(list1.head, rest)

unify(X, X).

myAppend(List1, List2, Result) :-
    unify(List1, nil),
    unify(Result, List2).
myAppend(List1, List2, Result) :-
    unify(List1, cons(Head, Tail)),
    myAppend(Tail, List2, Rest),
    unify(Result, cons(Head, Rest)).



%% myAppend(nil, Result, Result).
%% myAppend(cons(Head, Tail), List2, cons(Head, Rest)) :-
%%     myAppend(Tail, List2, Rest).




%
%
% if (base case) {
%   // do base case stuff
% } else {
%   // do recursive case stuff
% }
%
% myAppend: InputList1, InputList2, OutputList
%% myAppend(nil, OtherList, OtherList). % base case
%% myAppend(cons(Head, Tail), OtherList, cons(Head, IntermediateList)) :- % recursive case
%%     myAppend(Tail, OtherList, IntermediateList).

someFact(1).
someFact(2).
someFact(3).

foo(X, Y) :-
    Z = X,
    Z = Y.
