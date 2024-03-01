man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
children(X):- parent(X,Y), print(Y), nl, fail.

% Построить предикат mother(X, Y), который проверяет, является ли X матерью Y.
mother(X,Y):- woman(X), parent(X,Y).
% Построить предикат, mother(X), который выводит маму X.
mother(X):- mother(Y,X), print(Y), nl.

% Построить предикат brother(X, Y), который проверяет, является ли X братом Y.
brothers(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Y).
% Построить предикат brothers(X), который выводит всех братьев X.
brothers(X):- parent(Z,X), parent(Z,Y), man(Y), woman(Z), X\==Y, print(Y), nl, fail.

% Построить предикат b_s(X,Y), который проверяет, являются ли X и Y родными
  %братом и сестрой или братьями или сестрами.
b_s(X,Y):- parent(Z,X), parent(Z,Y), woman(X), woman(Y), print(sisters).
b_s(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Y), print(brothers).
b_s(X,Y):- parent(Z,X), parent(Z,Y), ((man(X), woman(Y));(man(Y), woman(X))), print(siblings).
% Построить предикат b_s(X), который выводит
  %всех братьев или сестер X.
b_s(X):- parent(Z,X), parent(Z,Y), woman(Z), X\==Y, print(Y), nl, fail.

% задание 2.
% Построить предикат son(X, Y), который проверяет, является ли X сыном Y.
son(X,Y):- parent(Y,X), man(X).
% Построить предикат, son(X), который выводит сына X.
son(X):- parent(X,Y), man(Y), print(Y), nl, fail.

% Построить предикат sister(X, Y), который проверяет, является ли X сестрой Y.
sister(X,Y):- woman(X), parent(Z,X), parent(Z,Y), X\==Y.
% Построить предикат sisters(X), который выводит всех сестер X.
sisters(X):- woman(Y), parent(Z,X), parent(Z,Y), woman(Z), X\==Y, print(Y), nl, fail.

% задание 3.
% версия с использованием только базы фактов
% Построить предикат grand_ma(X, Y), который проверяет, является ли X бабушкой Y.
grand_ma(X,Y):- woman(X), parent(X,Z), parent(Z,Y).
% Построить предикат grand_mas(X), который выводит всех бабушек X.
grand_mas(X):- woman(Y), parent(Y,Z), parent(Z,X), print(Y), nl, fail.

% Построить предикат grand_pa_and_son(X,Y), который проверяет, являются ли X и Y
  %дедушкой и внуком или внуком и дедушкой.
grand_pa_and_son(X,Y):- man(X), man(Y),(parent(X,Z), parent(Z,Y));(parent(Y,Z), parent(Z,X)).

% Построить предикат, который проверяет, является ли X дядей Y. Построить
  %предикат, который выводит всех дядей X.
uncle(X, Y):- man(X), parent(Z,Y), parent(A,Z), parent(A,X).
uncles(X):- man(Y), parent(Z,X), parent(A,Z), parent(A,Y), woman(A), print(Y), nl, fail.

% задание 3.
% версия с использованием готовых предикатов.
%grand_ma(X,Y):- mother(X,Z), parent(Z,Y).
%grand_mas(X):- grand_ma(Y,X), print(Y), nl, fail.
%
%grand_pa(X,Y):- father(X,Z), parent(Z,Y).
%
%grand_pa_and_son(X,Y):- man(Y), grand_pa(X,Y).
%
%siblings(X,Y):-parent(Z,X), parent(Z,Y), woman(Z).
%
%uncle(X,Y):- man(X), parent(Z,Y), siblings(Z, X).
%uncles(X):- uncle(Y, X), print(Y), nl, fail.



max(X,Y,Z):-(
     X>=Y -> Z is X;
     Y>X -> Z is Y
    ).

fact(0,1).
fact(N,X):- N>0,
    N1 is N-1, fact(N1,X1), X is N*X1.

fact2(0,X,X).
fact2(N,A,X):- N>0,
    A1 is N*A,
    N1 is N-1,
    fact2(N1,A1,X).

call_fact2(N,X):- fact2(N,1,X).

