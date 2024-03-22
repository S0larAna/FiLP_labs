% Предикат для нахождения делителей числа
find_divs(N, Divs) :- find_divs(N, 1, [], Divs).
find_divs(N, N, Acc, Divs) :- append(Acc, [N], Divs).
find_divs(N, I, Acc, Divs) :-
    I < N,
    (   0 =:= N mod I
    ->  NextAcc = [I | Acc]
    ;   NextAcc = Acc
    ),
    NextI is I + 1,
    find_divs(N, NextI, NextAcc, Divs).

% Предикат для проверки, является ли число избыточным
is_abundant(N) :-
    find_divs(N, Divs),
    sum_list(Divs, Sum),
    Sum > N + N.

% Предикат для генерации списка избыточных чисел до Max
generate_abundant_numbers(Max, AbundantNumbers) :-
    findall(N, (between(1, Max, N), is_abundant(N)), AbundantNumbers).

% Предикат для генерации списка уникальных сумм из пар избыточных чисел
generate_unique_sums(AbundantNumbers, UniqueSums) :-
    findall(Sum, (member(A, AbundantNumbers), member(B, AbundantNumbers), Sum is A + B), Sums),
    sort(Sums, UniqueSums).

% Предикат для подсчета количества чисел, которые нельзя представить в виде суммы двух чисел с избытком
count_non_sum_of_two_abundant(Max, Count) :-
    generate_abundant_numbers(Max, AbundantNumbers),
    generate_unique_sums(AbundantNumbers, UniqueSums),
    Count is Max - length(UniqueSums).

% Главный предикат для решения задачи
solve(Count) :-
    Max = 20000,
    count_non_sum_of_two_abundant(Max, Count).
