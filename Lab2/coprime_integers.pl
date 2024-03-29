% nod(+A, +B, -C)
% наибольший общий делитель
nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-Ost is A mod B, nod(B,Ost,C).

% coprime(+A, +B)
% Проверяет, являются ли числа A и B взаимно простыми.
coprime(A, B) :- nod(A, B, 1).

% find_div_coprimes_max(+N, -MaxDiv)
% Найти делитель числа, являющийся взаимно простым с наибольшим количеством
  %цифр данного числа.
find_div_coprimes_max(N, MaxDiv) :-
    find_divs(N, Divs),
    write(Divs),
    find_max_count(Divs, N, MaxDiv).
    write(MaxDiv).

% count_coprimes(+N, +Max, -Count)
% Найти количество чисел, взаимно простых с заданным.
count_coprimes(_, 0, 0).
count_coprimes(N, Max, Count) :-
    Max > 0,
    (   coprime(N, Max) ->  Count1 is Count + 1;
    Count1 is Count
    ),
    Max1 is Max - 1,
    count_coprimes(N, Max1, Count1).

% find_divs(+N, -Divs)
% Находит все делители числа N.
% N - унифицированная переменная, Divs - неунифицированная переменная.
find_divs(N, Divs) :- find_divs(N, 1, [N], Divs).
find_divs(N, N, CurDivs, CurDivs).
find_divs(N, CurDiv, CurDivs, Divs) :-
    (N mod CurDiv =:= 0 -> append(CurDivs, [CurDiv], NewDivs);
    NewDivs = CurDivs),
    NewDiv is CurDiv + 1,
    find_divs(N, NewDiv, NewDivs, Divs).

% find_count(+Div, +N, -Count)
% Подсчитывает количество цифр в числе N, взаимно простых с Div.
% Div и N - унифицированные переменные, Count - неунифицированная переменная.
find_count(Div, N, Count) :- find_count(Div, N, 0, Count).
find_count(Div, 0, Count, Count).
find_count(Div, N, CurCount, Count) :-
    Digit is N mod 10,
    N1 is N // 10,
    (coprime(Div, Digit) ->
    NextCount is CurCount + 1;
    NextCount is CurCount),
    find_count(Div, N1, NextCount, Count).

% find_max_count(+Divs, +N, -MaxDiv)
% Находит делитель из списка Divs, являющийся взаимно простым с наибольшим количеством
%цифр данного числа.
find_max_count(Divs, N, MaxDiv) :- find_max_count(Divs, N, 0, 0, MaxDiv).
find_max_count([], N, MaxDiv, _, MaxDiv).
find_max_count([H|T], N, CurMaxDiv, CurMaxCount, MaxDiv) :-
    find_count(H, N, Count),
    (Count > CurMaxCount ->
    NextMaxCount is Count, NextMaxDiv is H;
    NextMaxCount is CurMaxCount, NextMaxDiv is CurMaxDiv),
    find_max_count(T, N, NextMaxDiv, NextMaxCount, MaxDiv).
