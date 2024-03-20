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
	digit_sum(X,Sum):-X1 is X // 10, Rem is X mod 10, (X1, Sum1), Sum is Sum1 + Rem.

digit_sum_down(X, Sum) :- digit_sum_down(X, 0, Sum).
digit_sum_down(0, SumCur, SumCur) :- !.
digit_sum_down(X1, SumCur, Sum) :- X2 is X1 // 10, Rem is X1 mod 10, SumNew is SumCur + Rem, digit_sum_down(X2, SumNew, Sum).

free_of_squares(X) :- X>1, not(free_of_squares(2, X)).
free_of_squares(N, X) :- N *N =< X,(
0 is mod(X, N*N); N1 is N + 1,
                          free_of_squares(N1, X)
).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K + 1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).





% task 2
max_digit(0, Max, Max) :- !.
max_digit(N, Max) :- CurMax is N mod 10, N1 is N // 10, max_digit(N1, CurMax, Max).
max_digit(N1, CurMax, Max) :- CurDigit is N1 mod 10, N is N1 // 10, (CurDigit > CurMax) -> NextMax is CurDigit, max_digit(N, NextMax, Max).
