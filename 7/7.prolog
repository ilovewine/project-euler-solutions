is_prime(_, []).
is_prime(Number, [El|List]) :-
    Number mod El =\= 0,
    is_prime(Number, List).

prime(Nth, _, List, List) :- length(List, Nth), ground(List).
prime(Nth, Number, HelperList, List) :-
    is_prime(Number, HelperList),
    Number1 is Number + 2,
    prime(Nth, Number1, [Number|HelperList], List).
prime(Nth, Number, HelperList, List) :-
    Number1 is Number + 2,
    prime(Nth, Number1, HelperList, List).
prime(Nth, List) :- prime(Nth, 3, [2], List), !.

main(Result) :-
    prime(10001, [Result|_]).