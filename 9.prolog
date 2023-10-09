:- use_module(library(clpfd)).

pythagorean_triplet(A, B, C) :-
    Components = [A,B,C],
    Components ins 1..499,
    A * A + B * B #= C * C,
    A + B + C #= 1000,
    labeling([], Components).

main(Result) :-
    pythagorean_triplet(A, B, C),
    Result is A * B * C, !.