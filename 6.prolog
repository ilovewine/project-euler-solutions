make_list(Max, Max, [Max]).
make_list(Max, Index, [Index|List]) :-
    Index < Max,
    Index1 is Index + 1,
    make_list(Max, Index1, List).

make_list(Max, List) :- make_list(Max, 1, List).

generate_squares([], []).
generate_squares([El|List], [Square|Squares]) :-
    Square is El ** 2,
    generate_squares(List, Squares).

sum_squares(Sum) :-
    make_list(100, List),
    generate_squares(List, Squares),
    sum_list(Squares, Sum), !.

square_sum(Square) :-
    make_list(100, List),
    sum_list(List, Sum),
    Square is Sum ** 2, !.

main(Result) :-
    sum_squares(Sum),
    square_sum(Square),
    Result is Square - Sum.