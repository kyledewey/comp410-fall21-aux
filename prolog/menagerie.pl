likes(alice, pasta) :- !.
likes(alice, burger).
likes(alice, chips).
likes(bob, salad).
likes(bob, granola).
likes(bob, milk).

notLikes(bob, pasta).
notLikes(bob, burger).
notLikes(bob, chips).


myLength([], 0).
myLength([_|T], Result) :-
    myLength(T, RestLength),
    Result is RestLength + 1.

myLength2(List, Result) :-
    (List = []) ->
        Result = 0;
        (List = [_|T],
         myLength2(T, RestLength),
         Result is RestLength + 1).

foo(Input) :-
    someExpensiveCheck(Input),
    doOneThing(Input).
foo(Input) :-
    \+ someExpensiveCheck(Input),
    doAnotherThing(Input).

foo2(Input) :-
    someExpensiveCheck(Input) ->
        doOneThing(Input);
        doAnotherThing(Input).
