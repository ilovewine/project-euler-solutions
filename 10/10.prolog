is_coprime(Number, El) :- 
    gcd(Number, El) =:= 1.
is_coprime(Number, El) :-
    Number >= El.

remove_mults(ResultList, [], ResultList).
remove_mults(List, [El|SampleList], ResultList) :-
    include(is_coprime(El), List, ReducedList),
    remove_mults(ReducedList, SampleList, ResultList), !.

remove_mults([El], [El]).
remove_mults(List, ResultList) :-
    sort(List, SortedList),
    max_list(SortedList, Max),
    Sqrt is ceiling(sqrt(Max)),
    include(between(2, Sqrt), SortedList, SampleList),
    remove_mults(SampleList, ReducedSampleList),
    remove_mults(SortedList, ReducedSampleList, ResultList), !.

main(Result) :-
    numlist(2, 2000000, List),
    remove_mults(List, ReducedList),
    sum_list(ReducedList, Result).