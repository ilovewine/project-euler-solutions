chars_numbers([], []).
chars_numbers([Char|Chars], [Number|Numbers]) :- atom_number(Char, Number), chars_numbers(Chars, Numbers).

adjacent_digits(13).
big_number(List) :- atom_chars("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450", Chars), chars_numbers(Chars, List).

filter_slice(Slice) :- \+ member(0, Slice).

slice(List, From, Length, Slice) :-
    From1 is From - 1,
    length(Prefix, From1),
    append(Prefix, Remainder, List),
    length(Slice, Length),
    append(Slice, _, Remainder).
    
generate_all_slices(Numbers, Index, []) :-
    adjacent_digits(Digits),
    length(Numbers, Length),
    Length - Digits < Index, !.
generate_all_slices(Numbers, Index, [Slice|Slices]) :-
    adjacent_digits(Digits),
    slice(Numbers, Index, Digits, Slice),
    filter_slice(Slice),
    Index1 is Index + 1,
    generate_all_slices(Numbers, Index1, Slices), !.
generate_all_slices(Numbers, Index, Slices) :-
    Index1 is Index + 1,
    generate_all_slices(Numbers, Index1, Slices), !.

list_product([], 1).
list_product([El|List], Product) :-
    list_product(List, Product1),
    Product is Product1 * El.

calculate_all_products([], []).
calculate_all_products([Slice|Slices], [Product|ProductList]) :-
    list_product(Slice, Product),
    calculate_all_products(Slices, ProductList), !.

main(Result) :-
    big_number(Number),
    generate_all_slices(Number, 1, Slices),
    calculate_all_products(Slices, Products),
    max_list(Products, Result).