% cons(1, cons(2, cons(3, nil)))
% Base case: putting nil on the front of another list
% Recursive case:
%
% [1, 2, 3] ++ [4, 5, 6] ==> 1 :: ([2, 3] ++ [4, 5, 6])
%
% myAppend: InputList1, InputList2, OutputList
myAppend(nil, OtherList, OtherList).
myAppend(cons(Head, Tail), OtherList, cons(Head, IntermediateList)) :-
    myAppend(Tail, OtherList, IntermediateList).

someFact(1).
someFact(2).
someFact(3).

foo(X, Y) :-
    Z = X,
    Z = Y.
