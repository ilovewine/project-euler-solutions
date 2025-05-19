% After noticing that even-valued terms are places in a subsequence F_2, F_5, F_8...(two odd values always produces an even value) I've written a prolog program which will increase index by 3:

:- use_module(library(clpfd)).

fibonnaci(0, 1).
fibonnaci(1, 1).
fibonnaci(Index, Number) :-
    Index1 #= Index-1,
    Index2 #= Index-2,
    fibonnaci(Index1, Number1),
    fibonnaci(Index2, Number2),
    Number #= Number1 + Number2, !.

sum_even_fibonnaci(Index, 0) :- 
    fibonnaci(Index, Number),
    Number > 4000000.
sum_even_fibonnaci(Index, Sum) :- 
    fibonnaci(Index, Number),
    Index1 #= Index+3,
    sum_even_fibonnaci(Index1, Sum1),
    Sum #= Sum1 + Number, !.

main(Result) :-
    sum_even_fibonnaci(2, Result).