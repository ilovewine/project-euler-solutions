
:- use_module(library(clpfd)).

char_list_to_int_list([], []).
char_list_to_int_list([Code|Codes], [Digit|Digits]) :-
    atom_number(Code, Digit),
    char_list_to_int_list(Codes, Digits).


number_to_digits(Number, Digits) :- 
    number_chars(Number,Chars),
    char_list_to_int_list(Chars, Digits).
    
divide(List, A, B) :-
    append(A, B, List),
    length(A, N),
    length(B, N), !.
divide(List, A, B) :-
    append(AWithLast, B, List),
    length(AWithLast, N1),
    length(B, N),
    N1 =:= N + 1,
    last(AWithLast, Last),
    append(A, [Last], AWithLast),
    !.
    
palindrome(Number) :-
    number_to_digits(Number, Digits),
    divide(Digits, A, ReverseB),
    reverse(ReverseB, A).


main(Result, A, B) :-
    Result is A*B,
    palindrome(Result).
main(Result, A, 900) :-
    A > 900,
    A1 is A-1,
    main(Result, A1, 999).
main(Result, A, B) :-
    B > 900,
    B1 is B-1,
    main(Result, A, B1).

main(Result) :- 
    setof(Palindrome, main(Palindrome, 999, 999), Set),
    max_list(Set, Result).