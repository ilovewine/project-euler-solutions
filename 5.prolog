lcm_list([], 1).
lcm_list([El|List], LCM) :-
    lcm_list(List, LCM1),
    LCM is lcm(El, LCM1).

generate_list(Max, Max, [Max]) :- !.
generate_list(Max, Index, [Index|List]) :-
    Index < Max,
    Index1 is Index+1,
    generate_list(Max, Index1, List).

generate_list(Max, List) :- generate_list(Max, 1, List).

main(Result) :-
    generate_list(20, List),
    lcm_list(List, Result).