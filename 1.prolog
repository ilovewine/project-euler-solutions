:- use_module(library(clpfd)).

multiple_of(Number, Multiple) :- 
    Multiple in Number..999,
    Multiple mod Number #= 0,
    indomain(Multiple).

multiples_of(Number, Multiples) :-
    setof(Multiple, multiple_of(Number, Multiple), Multiples).

sum_list(List, Sum) :- sum_list(List, 0, Sum).
sum_list([], Sum, Sum) :- !.
sum_list([El|List], Helper, Result) :- 
    NewHelper #= El + Helper,
    sum_list(List, NewHelper, Result).

main(Sum) :- 
    multiples_of(3, MultiplesOfThree),
    multiples_of(5, MultiplesOfFive),
    append(MultiplesOfThree, MultiplesOfFive, Multiples),
    sort(Multiples, List),
    sum_list(List, Sum).