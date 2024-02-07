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

son(X,Y):- parent(Y,X), man(X).
son(X):- parent(X,Y), man(Y), print(Y), nl, fail.

sister(X,Y):- woman(X), parent(Z,X), parent(Z,Y), X\==Y.
sisters(X):- woman(Y), parent(Z,X), parent(Z,Y), woman(Z), X\==Y, print(Y), nl, fail.

grand_ma(X,Y):- woman(X), parent(X,Z), parent(Z,Y).
grand_mas(X):- woman(Y), parent(Y,Z), parent(Z,X), print(Y), nl, fail.

grand_pa_and_son(X,Y):- man(X), man(Y),(parent(X,Z), parent(Z,Y));(parent(Y,Z), parent(Z,X)).


