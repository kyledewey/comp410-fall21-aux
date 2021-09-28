servedWarm(pizza).
servedWarm(burger).
servedWarm(burrito).

likes(alice, pizza). 
likes(alice, burger). 
likes(alice, burrito). 
likes(alice, yogurt). 

likes(bob, pizza). 
likes(bob, burger). 
likes(bob, salad). 
likes(bob, milk).

%              <=
% servedWarm(X) => likes(bill, X).

% rule head: likes(bill, X)
% rule body: servedWarm(X)
%% likes(bill, X) :-
%%     servedWarm(X).

likes(janet, Food) :-
    likes(alice, Food),
    likes(bob, Food).

likes(mel,X) :-
    (likes(janet,X) ; X = yogurt).

%% likes(mel, yogurt).
%% likes(mel, X) :-
%%     likes(janet, X).

% tail call optimization
%% likes(mel, Food) :-
%%     likes(mel, yogurt).
%% likes(mel, yogurt).
