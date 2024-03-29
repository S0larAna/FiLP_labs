:- dynamic(abundant/1).
:- dynamic(sum/1).

% Предикат для нахождения делителей числа и сохранения их в динамической памяти
find_div_sum(N, Sum) :- find_div_sum(N, 0, 1, Sum).
find_div_sum(N, Sum, N, Sum).
find_div_sum(N, CurSum, K, Sum) :-
    ((N mod K =:= 0) -> NextSum is CurSum + K; NextSum is CurSum),
    NextK is K + 1,
    find_div_sum(N, NextSum, NextK, Sum).

% Предикат для проверки, является ли число избыточным
is_abundant(N) :-
    find_div_sum(N, Sum),
    (   Sum > N
    ->  true, !
    ;   !, fail
    ).


% Предикат для генерации избыточных чисел до Max и сохранения их в динамической памяти
generate_abundant_numbers(Max) :-
    between(1, Max, N),
    write(N), nl,
    is_abundant(N),
    assertz(abundant(N)),
    fail.
generate_abundant_numbers(_).

% Предикат для генерации уникальных сумм из пар избыточных чисел и сохранения их в динамической памяти
generate_unique_sums(Max) :-
    abundant(A),
    abundant(B),
    Sum is A + B,
    Sum =< Max,
    \+ sum(Sum),
    assertz(sum(Sum)),
    write(Sum), nl,
    fail.
generate_unique_sums(_).

% Предикат для подсчета количества чисел, которые нельзя представить в виде суммы двух чисел с избытком
count_non_sum_of_two_abundant(Max, Count) :-
    generate_abundant_numbers(Max),
    generate_unique_sums(Max),
    count_non_sum(1, Max, 0, Count),
    retractall(abundant(_)),
    retractall(sum(_)).

% Рекурсивный предикат для подсчета количества чисел, которые нельзя представить в виде суммы двух избыточных чисел
count_non_sum(N, N, Count, Count) :- !.
count_non_sum(N, Max, AccCount, Count) :-
    (   sum(N)
    ->  NextN is N + 1,
        count_non_sum(NextN, Max, AccCount, Count)
    ;   NextN is N + 1,
        NextAccCount is AccCount + 1,
        write(NextAccCount), nl,
        count_non_sum(NextN, Max, NextAccCount, Count)
    ).

% Главный предикат для решения задачи
solve(Count) :-
    Max = 28123,
    count_non_sum_of_two_abundant(Max, Count).
