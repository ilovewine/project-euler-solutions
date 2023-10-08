:- use_module(library(clpfd)).

factors(1, _, []) :- !.
factors(Number, Index, Factors) :-
    Number mod Index =\= 0,
    Index1 is Index + 1,
    factors(Number, Index1, Factors), !. 

factors(Number, Index, Factors) :-
    Number1 is Number // Index,
    factors(Number1, Index, Factors1),
    Factors = [Index|Factors1], !.

main(Result) :-
    Number = 600851475143,
    factors(Number, 2, Factors),
    max_list(Factors, Result), !.