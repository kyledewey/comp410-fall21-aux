% Soda costs $2
% Chips cost $3
% Hot dogs cost twice as much as soda (do not hardcode $4)
% Soda chips, and hot dogs are food
% Pencils and pens are office supplies
% All office supplies cost $2
% Cold medicine costs $7

% cost: Item, PriceAsInteger
% cost/2 procedure
cost(soda, 2).
cost(chips, 3).
cost(hot_dog, Cost) :-
    cost(soda, SodaCost),
    Cost is 2 * SodaCost.
cost(Item, 2) :-
    officeSupply(Item).
cost(cold_medicine, 7).

% food/1
food(soda).
food(chips).
food(hot_dog).

% officeSupply/1
officeSupply(pencil).
officeSupply(pen).
