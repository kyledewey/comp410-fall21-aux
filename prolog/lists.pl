% cons(1, cons(2, cons(3, nil)))
% Base case: putting nil on the front of another list
% Recursive case:
%
% [1, 2, 3] ++ [4, 5, 6] ==> 1 :: ([2, 3] ++ [4, 5, 6])
%
%

%% myAppend(List1, List2, Result) :-
%%     List1 = nil,
%%     Result = List2.
%% myAppend(List1, List2, Result) :-
%%     List1 = cons(Head, Tail),
%%     Result = cons(Head, Rest),
%%     myAppend(Tail, List2, Rest).


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

myAppend(nil, Result, Result).
myAppend(cons(Head, Tail), List2, cons(Head, Rest)) :-
    myAppend(Tail, List2, Rest).

myAppendRegular([], Result, Result).
myAppendRegular([Head|Tail], List2, [Head|Rest]) :-
    myAppendRegular(Tail, List2, Rest).



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

% list = nil | cons(element, list)

% length([5, 2, 9]): 3
%   1 + length([2, 9]): 3
%
% def length(list):
%   if isinstance(list, Nil):
%     return 0
%   else:
%     rest_length = length(list.tail)
%     return rest_length + 1
%
% myLength: List, Length
myLength([], 0).
myLength([_|Tail], Result) :-
    myLength(Tail, RestLength),
    Result is RestLength + 1.

% def length2(list):
%   total = 0
%   while isinstance(list, Cons):
%     total += 1
%     list = list.tail
%   return total
%
% myLengthAccum/3
% myLengthAccum: List, Accumulator, OutputValue
myLengthAccum([], Accum, Accum).
myLengthAccum([_|T], Accum, Result) :-
    NewAccum is Accum + 1,
    myLengthAccum(T, NewAccum, Result).

% myLengthAccum/2
% myLengthAccum: List, OutputValue
myLengthAccum(List, OutputValue) :-
    myLengthAccum(List, 0, OutputValue).
