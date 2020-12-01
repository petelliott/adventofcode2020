:- initialization(main, main).

evaluate(X, R) :- R is X.

sum_2020(X, Y, Z) :- X + Y =:= 2020, evaluate(X * Y, Z).

inner_loop([], _, _) :- false.
inner_loop([H1|T1], [H2|T2], Z) :-
    sum_2020(H1, H2, Z);
    inner_loop(T1, [H2|T2], Z).

outer_loop(_, [], _) :- false.
outer_loop(L, [H2|T2], Z) :-
    inner_loop(L, [H2|T2], Z);
    outer_loop(L, T2, Z).


/* this only works if 1010 is not in the input */
solution(LIST, Z) :- outer_loop(LIST, LIST, Z).

read_input(Result) :-
    read_line_to_string(user_input, String),
    (
        String == end_of_file -> Result = [];
        number_codes(H, String),
        Result = [H|T],
        read_input(T)
    ).

main :-
    read_input(List),
    solution(List, Z),
    write_ln(Z).
