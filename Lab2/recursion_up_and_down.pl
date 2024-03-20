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

digit_sum(0,0):-!.
digit_sum(X,Sum):-X1 is X // 10, Rem is X mod 10,
	summ_cifr(X1, Sum1), Sum is Sum1 + Rem.
