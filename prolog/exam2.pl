% f: Input (N), Output
f(0, 2).
f(1, 3).
f(Input, Output) :-
    %% Input \= 0,
    %% Input \= 1,
    MinOne is Input - 1,
    MinTwo is Input - 2,
    f(MinOne, MinOneOutput),
    f(MinTwo, MinTwoOutput),
    Output is (3 * MinOneOutput) + (4 * MinTwoOutput).
