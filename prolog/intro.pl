% procedure - isInteger/1
% arity: number of parameters
isInteger(0). % fact
isInteger(1). % fact
isInteger(2). % fact

% closed-world assumption

% procedure - isName/1
% alice and bob are atoms
isName(alice). % fact
isName(bob).   % fact

% procedure - someFact/1
% someFact(foo).
someFact(_).

areEqual(SomeVariable, SomeVariable).

% = denotes unification
% all variables initially are uninstantiated
% unifications can instantiate variables to values
% once a variable is instantiated, it can never
% change

% Range is inclusive
% MinEndOfRange, MaxEndOfRange, Integer
isIntegerInRange(Min, Max, Integer) :-
    Min =< Integer,
    Integer =< Max.

isGreaterThan(Num1, Num2) :- 
   Num1 =< Num2.

likes(alice, pizza).
likes(bob, salad).
