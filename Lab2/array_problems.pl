read_list(List) :- read_list([], List).

read_list(Acc, List) :-
    write('Enter an element (or press Enter to finish): '),
    read_line_to_string(user_input, Input),
    (   Input = ""
    ->  reverse(Acc, List)
    ;   (   atom_number(Input, Element)
        ->  true
        ;   Element = Input
        ),
        append(Acc, [Element], NewAcc),
        read_list(NewAcc, List)
    ).

read_input(Input) :-
    write('Введите число: '),
    read_line_to_string(user_input, El),
    atom_number(Input, Element).

count_on_interval(List, A, B, Count) :- count_on_interval(List, A, B, 0, Count).
count_on_interval([], A, B, Count, Count).
count_on_interval([H|T], A, B, CurCount, Count) :- (
    (H =< B, H >= A) ->
    NextCount is CurCount + 1;
    NextCount is CurCount
    ),
    count_on_interval(T, A, B, NextCount, Count).

find_min([H|T], Min) :- find_min([H|T], H, Min).
find_min([], Min, Min).
find_min([H|T], CurMin, Min) :-
    (H =< CurMin ->
    NextMin is H;
    NextMin is CurMin),
    find_min(T, NextMin, Min).

count_occurence(List, N, Count) :- count_occurence(List, N, 0, Count).
count_occurence([], N, Count, Count).
count_occurence([H|T], N, CurCount, Count) :-
    (H =:= N ->
    NextCount is CurCount + 1;
    NextCount is CurCount),
    count_occurence(T, N, NextCount, Count).

count_min([H|T], Count) :-
    find_min([H|T], Min),
    count_occurence([H|T], Min, Count).

find_avg(List, Avg) :-
    sum_list(List, Sum),
    length(List, Len),
    Avg is Sum / Len.

filter(List, A, B, NewList) :- filter(List, A, B, [], NewList).
filter([], A, B, NewList, NewList).
filter([H|T], A, B, CurList, NewList) :-
    ((H < B, H > A) ->
    append(CurList, [H], NextList);
    NextList = CurList
    ),
    filter(T, A, B, NextList, NewList).

create_new(List, NewList) :-
    find_avg(List, Avg),
    max_list(List, Max),
    filter(List, Avg, Max, NewList).

count_divs_down(N, Count) :- count_divs_down(N, Count, 1, 1).
count_divs_down(N, CurCount, N, CurCount).
count_divs_down(N, Count, Div, CurCount) :- (N mod Div =:= 0 -> NextCount is CurCount + 1 ; NextCount is CurCount), NewDiv is Div + 1, count_divs_down(N, Count, NewDiv, NextCount).

prime(N) :-
    count_divs_down(N, Count),
    Count =:= 2.

prime_sum_count([], 0, 0).
prime_sum_count([H|T], Sum, Count) :-
    prime(H),
    !,
    prime_sum_count(T, TailSum, TailCount),
    Sum is H + TailSum,
    Count is TailCount + 1.
prime_sum_count([_|T], Sum, Count) :-
    prime_sum_count(T, Sum, Count).

non_prime_sum_count([], _, 0, 0).
non_prime_sum_count([H|T], PrimeAvg, Sum, Count) :-
    \+ prime(H),
    H > PrimeAvg,
    !,
    non_prime_sum_count(T, PrimeAvg, TailSum, TailCount),
    Sum is H + TailSum,
    Count is TailCount + 1.
non_prime_sum_count([_|T], PrimeAvg, Sum, Count) :-
    non_prime_sum_count(T, PrimeAvg, Sum, Count).

find_avg_of_avg(List, Avg) :-
      prime_sum_count(List, PrimeSum, PrimeCount),
      PrimeAvg is PrimeSum / PrimeCount,
     non_prime_sum_count(List, PrimeAvg, NonPrimeSum, NonPrimeCount),
         Avg is NonPrimeSum / NonPrimeCount.

main :-
    read_list(List),
    read_input(A),
    read_input(B),
    count_on_interval(List, A, B, Count),
    count_min(List, MinCount),
    create_new(List, NewList),
    find_avg_of_avg(List, Avg).

