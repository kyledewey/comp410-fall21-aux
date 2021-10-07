isCompound(water).

element(gold).
element(mercury).

melting_point(water, 0).
melting_point(mercury, -39).
melting_point(gold, 1064).

boiling_point(water, BP) :-
  melting_point(water, MP),
  BP is MP + 100.
boiling_point(mercury, 357).
boiling_point(gold, 2970).

%% ?- element(E).
%% ?- boiling_point(I, BP).
%% ?- element(E), melting_point(E, MP),
%% MP =< 0.

%% ?- boiling_point(C1, BP), melting_point(C2, MP),
%% BP < MP.
