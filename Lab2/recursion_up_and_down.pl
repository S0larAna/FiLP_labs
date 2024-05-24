% предикат max(+X, +Y, +U, -Z)
% Z - максимальное из чисел X, Y и U.
max(X, Y, U, X) :- X>Y, X>U, !.
max(_, Y, U, Y) :- Y>U, !.
max(_,_,U,U).

% предикат fact_up(+N, -X)
% факториал первого аргумента с помощью рекурсии вверх
fact_up(0, 1) :- !.
fact_up(N, X) :- N1 is N - 1, fact_up(N1, X1), X is N*X1.

% предикат fact_down(+N, -X)
% факториал первого аргумента с помощью рекурсии вниз
fact_down(N, X) :- fact_down(0, 1, N, X).
fact_down(N, Z, N, Z) :- !.
fact_down(N,_,N,_):-!,fail.
fact_down(Y, Z, N, X) :- Y1 is Y + 1, Z1 is Z*Y1, fact_down(Y1, Z1, N, X).

% предикат digit_sum(+X, -Sum)
% Sum - сумма цифр числа X (рекурсия вверх)
digit_sum(0,0):-!.
digit_sum(X,Sum):-X1 is X // 10, Rem is X mod 10, digit_sum(X1, Sum1), Sum is Sum1 + Rem.

% предикат digit_sum_down(+X, -Sum)
% Sum - сумма цифр числа X (рекурсия вниз).
digit_sum_down(X, Sum) :- digit_sum_down(X, 0, Sum).
digit_sum_down(0, SumCur, SumCur) :- !.
digit_sum_down(X1, SumCur, Sum) :- X2 is X1 // 10, Rem is X1 mod 10, SumNew is SumCur + Rem, digit_sum_down(X2, SumNew, Sum).

% предикат free_of_squares(+X)
% проверяет, свободно ли число X от квадратов.
free_of_squares(X) :- X>1, not(free_of_squares(2, X)).
free_of_squares(N, X) :- N *N =< X,(
0 is mod(X, N*N); N1 is N + 1,
                          free_of_squares(N1, X)
).

find_div_sum(N, Sum) :- find_div_sum(N, 0, 1, Sum).
find_div_sum(N, Sum, N, Sum).
find_div_sum(N, CurSum, K, Sum) :-
    ((N mod K =:= 0) -> NextSum is CurSum + K; NextSum is CurSum),
    NextK is K + 1,
    find_div_sum(N, NextSum, NextK, Sum).

% предикат read_list(-List)
% считывает список с клавиатуры.
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

% предикат write_list(+List)
% выводит список на экран.
write_list([]) :- !.
write_list([H|Tail]) :- write(H), nl, write_list(Tail).

% предикат sum_list_down(+List, -Summ)
% Summ - сумма элементов списка List (рекурсия вниз).
sum_list_down(List, Summ) :- sum_list_down(0, List, Summ).
sum_list_down(Acc, [], Acc).
sum_list_down(Acc, [H|Tail], Summ) :- NewAcc is Acc + H, sum_list_down(NewAcc, Tail, Summ).

% предикат sum_list_up(+List, -Sum)
% Sum - сумма элементов списка List (рекурсия вверх).
sum_list_up([], 0).
sum_list_up([H|T], Sum) :- sum_list_up(T, AccSum), Sum is AccSum + H.

% предикат remove_items_with_digit_sum(+List, +Sum, -Result)
% удаляет из списка List элементы, сумма цифр которых равна Sum.
remove_items_with_digit_sum([], _, []).
remove_items_with_digit_sum([H|T], Sum, Result) :-
    digit_sum(H, DigitSum),
    (   DigitSum =:= Sum
    ->  remove_items_with_digit_sum(T, Sum, Result)
    ;   Result = [H|NewResult],
        remove_items_with_digit_sum(T, Sum, NewResult)
    ).


% task 2
% предикат max_digit_up(+N, -Max)
% Max - максимальная цифра числа N (рекурсия вверх).
max_digit_up(0, 0).
max_digit_up(N, Max) :- CurDigit is N mod 10, N1 is N // 10, max_digit_up(N1, CurMax), (CurDigit>CurMax -> Max is CurDigit; Max is CurMax).

% предикат max_digit(+N, -Max)
% Max - максимальная цифра числа N (рекурсия вниз).
max_digit(0, Max, Max) :- !.
max_digit(N, Max) :- CurMax is N mod 10, N1 is N // 10, max_digit(N1, CurMax, Max).
max_digit(N1, CurMax, Max) :- CurDigit is N1 mod 10, N is N1 // 10, ((CurDigit > CurMax) -> NextMax is CurDigit; NextMax is CurMax), max_digit(N, NextMax, Max).

% предикат sum_mul_3_up(+N, -Sum)
% Sum - сумма цифр числа N, кратных 3 (рекурсия вверх).
sum_mul_3_up(0, 0).
sum_mul_3_up(N, Sum) :- CurDigit is N mod 10, N1 is N // 10, sum_mul_3_up(N1, CurSum), (CurDigit mod 3 =:= 0 -> Sum is CurSum + CurDigit; Sum is CurSum).

% предикат sum_mul_3_down(+N, -Sum)
% Sum - сумма цифр числа N, кратных 3 (рекурсия вниз).
sum_mul_3_down(N, Sum) :- sum_mul_3_down(N, 0, Sum).
sum_mul_3_down(0, CurSum, CurSum).
sum_mul_3_down(N, CurSum, Sum) :- CurDigit is N mod 10, N1 is N // 10, (CurDigit mod 3 =:= 0 -> NextSum is CurSum + CurDigit; NextSum is CurSum),
sum_mul_3_down(N1, NextSum, Sum).

% предикат count_divs_up(+N, -Count)
% Count - количество делителей числа N (рекурсия вверх).
count_divs_up(N, 0, 1).
count_divs_up(N, Count) :- Div is N, count_divs_up(N, CurCount, Div), (N mod Div =:= 0 -> Count is CurCount + 1; Count is CurCount).
count_divs_up(N, Count, Div) :- NewDiv is Div - 1, count_divs_up(N, CurCount, NewDiv), (N mod NewDiv =:= 0 -> Count is CurCount + 1; Count is CurCount).

% предикат count_divs_down(+N, -Count)
% Count - количество делителей числа N (рекурсия вниз).
count_divs_down(N, Count) :- count_divs_down(N, Count, 1, 1).
count_divs_down(N, CurCount, N, CurCount).
count_divs_down(N, Count, Div, CurCount) :- (N mod Div =:= 0 -> NextCount is CurCount + 1 ; NextCount is CurCount), NewDiv is Div + 1, count_divs_down(N, Count, NewDiv, NextCount).

task1 :-
    read_list(List),
    write_list(List),
    sum_list_down(List, Sum),
    remove_items_with_digit_sum([123, 2, 3], 6, Result),
    write(Result),
    write(Sum).

% task3 variant 2
% предикат min_el_ind(+List, -MinInd)
% MinInd - индекс минимального элемента в списке List.
min_el_ind([H|T], MinInd) :- min_el_ind([H|T], 0, H, MinInd, 0).
min_el_ind([], _, _, CurMinInd, CurMinInd).
min_el_ind([H|T], CurInd, CurMin, MinInd, CurMinInd) :-
    (H =< CurMin -> (NextMin is H, NextMinInd is CurInd);
    NextMin is CurMin, NextMinInd is CurMinInd),
    NextInd is CurInd + 1,
    min_el_ind(T, NextInd, NextMin, MinInd, NextMinInd).

% предикат two_min_els(+List, -Min1, -Min2)
% Min1 - минимальный элемент списка List, Min2 - второй по минимальности элемент списка List.
two_min_els([A, B|T], Min1, Min2) :- T \== [], two_min_els(T, A, B, Min1, Min2).
two_min_els([], CurMin1, CurMin2, CurMin1, CurMin2).
two_min_els([H|T], CurMin1, CurMin2, Min1, Min2) :-
    (H < CurMin1 ->
    NextMin1 is H, NextMin2 is CurMin1;
    (H < CurMin2 ->
    NextMin1 is CurMin1, NextMin2 is H;
    NextMin1 is CurMin1, NextMin2 is CurMin2)),
    two_min_els(T, NextMin1, NextMin2, Min1, Min2).

% предикат count_even_els(+List, -Count)
% Count - количество четных элементов в списке List.
count_even_els(List, Count) :- count_even_els(List, 0, Count).
count_even_els([], Count, Count).
count_even_els([H|T], CurCount, Count) :-
    (H mod 2 =:= 0 ->
    NextCount is CurCount + 1;
    NextCount is CurCount),
    count_even_els(T, NextCount, Count).

task3 :-
    read_list(List),
    min_el_ind(List, Ind),
    write(Ind),
    two_min_els(List, Min1, Min2),
    write(Min1, Min2).

