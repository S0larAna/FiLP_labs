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

mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.

brothers(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Y).
brothers(X):- parent(Z,X), parent(Z,Y), man(Y), woman(Z), X\==Y, print(Y), nl, fail.

b_s(X,Y):- parent(Z,X), parent(Z,Y), woman(X), woman(Y), print(sisters).
b_s(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Y), print(brothers).
b_s(X,Y):- parent(Z,X), parent(Z,Y), ((man(X), woman(Y));(man(Y), woman(X))), print(siblings).
b_s(X):- parent(Z,X), parent(Z,Y), woman(Z), X\==Y, print(Y), nl, fail.

son(X,Y):- parent(Y,X), man(X).
son(X):- parent(X,Y), man(Y), print(Y), nl, fail.

sister(X,Y):- woman(X), parent(Z,X), parent(Z,Y), X\==Y.
sisters(X):- woman(Y), parent(Z,X), parent(Z,Y), woman(Z), X\==Y, print(Y), nl, fail.

grand_ma(X,Y):- woman(X), parent(X,Z), parent(Z,Y).
grand_mas(X):- woman(Y), parent(Y,Z), parent(Z,X), print(Y), nl, fail.

grand_pa_and_son(X,Y):- man(X), man(Y),(parent(X,Z), parent(Z,Y));(parent(Y,Z), parent(Z,X)).


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

