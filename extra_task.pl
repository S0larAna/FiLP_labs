digit_sum_down(X, Sum) :- digit_sum_down(X, 0, Sum).
digit_sum_down(0, SumCur, SumCur) :- !.
digit_sum_down(X1, SumCur, Sum) :- X2 is X1 // 10, Rem is X1 mod 10, SumNew is SumCur + Rem, digit_sum_down(X2, SumNew, Sum).

solve(N) :-
    first_deleted(N, NewNum).

first_deleted(N, NewNum):-
    between(0, 3, RandomNumPlacement),
    Multiple is 10 ** RandomNumPlacement,
    Rem is N mod Multiple, Quot is N // Multiple,
    between(1, 9, K),
    NewNum is (Quot * Multiple * 10) + K * Multiple + Rem,
    between(1, 36, PossibleSum),
    PossibleNumber is NewNum + PossibleSum,
    digit_sum_down(PossibleNumber, ActualSum),
    (PossibleSum =:= ActualSum -> (write(PossibleNumber), nl)),
    fail.